import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../model_materias.dart';

class Fis1 extends StatefulWidget {
  @override
  _Fis1State createState() => _Fis1State();
}

class _Fis1State extends State<Fis1> {

  GlobalKey<FormState> _titleKey = GlobalKey<FormState>();
  GlobalKey<FormState> _subtitleKey = GlobalKey<FormState>();
  final _controllertitle = TextEditingController(text: "");
  final _controllersubtitle = TextEditingController(text: "");

  List encodelist = [];

  @override
  void initState() {
    super.initState();
    _readData().then((db) {
      setState(() {
        if(db.isNotEmpty){
          encodelist = jsonDecode(db);
        }
      });
    });
  }

  void _addBio1() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["titulo"] = _controllertitle.text;
      newToDo["subtitulo"] = _controllersubtitle.text;
      newToDo["check"] = false;
      encodelist.add(newToDo);
      _saveData();
    });
  }

  Future <Null> _onRefresh()async{
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      encodelist.sort((a,b){
        if(a["check"] && !b["check"]) return 1;
        else if (!a["check"] && b["check"]) return -1;
        else return 0;
      });
      _saveData();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ModelMaterias(
      materia:"Física",
      titleKey:_titleKey,
      subtitleKey:_subtitleKey,
      controllertitle:_controllertitle,
      controllersubtitle:_controllersubtitle,
      add:() {
        setState(() {
          if (_titleKey.currentState.validate() &&
              _subtitleKey.currentState
                  .validate()) {
            _addBio1();
            Navigator.pop(context);
            _controllersubtitle.clear();
            _controllertitle.clear();
          }
        });
      },
      list:encodelist,
      istrue:((encodelist.where((element) => element["check"] == true)).length),
      all:(encodelist.length),
      icone:MaterialCommunityIcons.atom,
      body:Column(
        children: [
          Expanded(
            child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 5, bottom: 0),
                    itemCount: encodelist.length,
                    itemBuilder: (context, index) {
                      return ModelMateriasCard(
                        subtitulo:encodelist[index]["subtitulo"],
                        titulo:encodelist[index]["titulo"],
                        check:encodelist[index]["check"],
                        remove:(direction) {
                          setState(() {
                            encodelist.removeAt(index);
                            _saveData();
                          });
                        },
                        save:(bool value) {
                          setState(() {
                            encodelist[index]["check"] = value;
                            _saveData();
                          });
                        },
                      );
                    })
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/primeiroanofisica/primeiroanofisica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
      return directoryfoldertest2.absolute;
    }
  }
  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveData() async {
    String db = json.encode(encodelist);

    final file = await _getFile();
    return file.writeAsString(db);
  }

}
