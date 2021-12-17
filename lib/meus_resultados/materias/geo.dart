import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../model_resultados.dart';

class Geografia extends StatefulWidget {
  @override
  _GeografiaState createState() => _GeografiaState();
}

class _GeografiaState extends State<Geografia> {
  GlobalKey<FormState> _assuntoKey = GlobalKey<FormState>();
  GlobalKey<FormState> _rightquestionsKey = GlobalKey<FormState>();
  GlobalKey<FormState> _allquestionsKey = GlobalKey<FormState>();
  final _controllerassunto = TextEditingController(text: "");
  final _controllerrightquestions = TextEditingController(text: "");
  final _controllerallquestions = TextEditingController(text: "");

  List encodelist = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          encodelist = jsonDecode(data);
        }
      });
    });
  }

  void _adddesempenho() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["assunto"] = _controllerassunto.text;
      newToDo["rightquestions"] = int.parse(_controllerrightquestions.text);
      newToDo["allquestions"] = int.parse(_controllerallquestions.text);
      encodelist.add(newToDo);
      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModelResultados(
      materia:"Geografia",
      assuntoKey:_assuntoKey,
      rightquestionsKey:_rightquestionsKey,
      allquestionsKey:_allquestionsKey,
      controllerassunto:_controllerassunto,
      controllerrightquestions:_controllerrightquestions,
      controllerallquestions:_controllerallquestions,
      list:encodelist,
      icone:MaterialCommunityIcons.earth,
      add:() {
        setState(() {
          if (_assuntoKey.currentState
              .validate() &&
              _rightquestionsKey.currentState
                  .validate() &&
              _allquestionsKey.currentState
                  .validate()) {
            Navigator.pop(context);
            _adddesempenho();
            _controllerallquestions.clear();
            _controllerrightquestions.clear();
            _controllerassunto.clear();
          }
        });
      },
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 5, bottom: 0),
                itemCount: encodelist.length,
                itemBuilder: (context, index) {
                  return ModelCardResultados(
                    assunto: encodelist[index]["assunto"],
                    rightquestions: encodelist[index]["rightquestions"],
                    allquestions: encodelist[index]["allquestions"],
                    remove: (direction) {
                      setState(() {
                        encodelist.removeAt(index);
                        _saveData();
                      });
                    },
                  );
                }),
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
    final directoryfoldertest = File("${directory.path}/materiasgeografia/materiasgeografia.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<File> _saveData() async {
    String data = json.encode(encodelist);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
