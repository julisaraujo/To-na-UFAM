import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Redacao3 extends StatefulWidget {
  @override
  _Redacao3State createState() => _Redacao3State();
}

class _Redacao3State extends State<Redacao3> {


  GlobalKey<FormState> _titleKey = GlobalKey<FormState>();
  final _controllertitle = TextEditingController(text: "");

  List encodelist = [];

  @override
  void initState() {
    super.initState();
    _readData().then((bio1) {
      setState(() {
        if(bio1.isNotEmpty){
          encodelist = jsonDecode(bio1);
        }
      });
    });
  }

  void _addBio1() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["titulo"] = _controllertitle.text;
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
    return Scaffold(
        backgroundColor: Color.fromARGB(100, 42, 46, 50),
        appBar: AppBar(
          elevation: 0.1,
          title: Text("Redação",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Color.fromARGB(150, 42, 46, 50),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
            iconSize: 20,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
                  backgroundColor: Color.fromARGB(250, 28, 34, 34),
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Theme(
                                data: ThemeData(
                                    primaryColor:
                                    Color.fromARGB(150, 42, 46, 50),
                                    primaryColorDark:
                                    Color.fromARGB(150, 42, 46, 50)),
                                child: Form(
                                  key: _titleKey,
                                  child: TextFormField(
                                    controller: _controllertitle,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value == "" ||
                                          value == " " ||
                                          value == "  " ||
                                          value == "   " ||
                                          value == "    " ||
                                          value == "     " ||
                                          value == "      " ||
                                          value == "       " ||
                                          value == "        " ||
                                          value == "         " ||
                                          value == "          " ||
                                          value == "           " ||
                                          value == "            " ||
                                          value == "             " ||
                                          value == "              " ||
                                          value == "               " ||
                                          value == "                " ||
                                          value == "                 " ||
                                          value == "                  " ||
                                          value == "                   " ||
                                          value == "                    " ||
                                          value == "                     " ||
                                          value == "                      " ||
                                          value == "                       " ||
                                          value == "                        " ) {
                                        return "Preencha corretamente";
                                      }
                                      else if(value.length > 50){
                                        return "O número de caracteres não pode ser maior que 50";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    maxLength: 50,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xff13d38e)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.white),
                                        ),
                                        counterStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        labelText: "Tema da redação",
                                        labelStyle: TextStyle(
                                            color: Colors.white, fontSize: 19),
                                        border: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                    autofocus: true,
                                  ),
                                )),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                    child: Icon(
                                      Icons.check,
                                      color: Color(0xff13d38e),
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_titleKey.currentState.validate()) {
                                          _addBio1();
                                          Navigator.pop(context);
                                          _controllertitle.clear();
                                        }
                                      });
                                    }),
                              ],
                            )
                          ],
                        )),
                  ),
                );
              },
            )
          ],
        ),
        extendBodyBehindAppBar: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              elevation: 14,
              color: Color.fromARGB(150, 42, 46, 50),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(40))),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 10,
                          offset: Offset(0.0, 0.0))
                    ],
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.65,
                      animation: true,
                      animationDuration: 1000,
                      animateFromLastPercent: true,
                      alignment: MainAxisAlignment.center,
                      lineHeight: 9,
                      trailing: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 40,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      encodelist.length ==
                                          0
                                          ? "0%"
                                          : "${(((((encodelist).where((element) => element["check"] == true)).length) /(encodelist.length)) * 100).round()}%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 1),
                                  child: Container(
                                    height: 40,
                                    width: 50,
                                    child: Center(
                                      child: Text(
                                        "${(encodelist.where((element) => element["check"] == true)).length}/"
                                            "${encodelist.length}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                      percent: encodelist.length == 0 ? 0.0
                          : (((encodelist.where((element) => element["check"] == true)).length) / (encodelist.length)),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.white,
                      backgroundColor: Color.fromARGB(250, 42, 46, 50),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: encodelist.length ==
                    0
                    ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Você não possui temas de redação...",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          FlutterIcons.book_faw,
                          size: 40,
                          color: Colors.grey,
                        )
                      ],
                    ))
                    : RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 5, bottom: 0),
                    itemCount: encodelist.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            setState(() {
                              encodelist.removeAt(index);
                              _saveData();
                            });
                          },
                          key: Key(DateTime.now()
                              .millisecondsSinceEpoch
                              .toString()),
                          background: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(250, 153, 0, 21)
                            ),
                            child: Align(
                              alignment: Alignment(-0.9, 0.0),
                              child: Icon(Icons.delete_forever,
                                  color: Colors.white),
                            ),
                          ),
                          child:Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                    title: Text(
                                      "${encodelist[index]["titulo"]}",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    trailing: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: encodelist[index]["check"] ==
                                              true
                                              ? Colors.transparent
                                              : Colors.white24,
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Theme(
                                            data: ThemeData(
                                              unselectedWidgetColor:
                                              Colors.transparent,
                                            ),
                                            child: Checkbox(
                                              value: encodelist[index]["check"],
                                              checkColor: Colors.green,
                                              activeColor: encodelist[index]["check"] ==
                                                  true
                                                  ? Colors.transparent
                                                  : Colors.transparent,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  encodelist[index]["check"] = value;
                                                  _saveData();
                                                });
                                              },
                                            ),
                                          )),
                                    )
                                ),
                              ),
                              Divider(
                                color: Colors.white12,
                                height: 0,
                                thickness: 1.0,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ],
                          )
                      );
                    },
                  ),
                )
            ),
          ],
        ));
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/terceiroanoredacao/terceiroanoredacao.json");

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
    String bio1 = json.encode(encodelist);

    final file = await _getFile();
    return file.writeAsString(bio1);
  }

}
