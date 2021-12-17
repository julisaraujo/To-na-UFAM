import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Redacao extends StatefulWidget {
  @override
  _RedacaoState createState() => _RedacaoState();
}

class _RedacaoState extends State<Redacao> {
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
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 42, 46, 50),
      appBar: AppBar(
        elevation: 14,
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
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
                                    primaryColor: Colors.white,
                                    primaryColorDark: Colors.blue),
                                child: Form(
                                  key: _assuntoKey,
                                  child: TextFormField(
                                    controller: _controllerassunto,
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
                                          value == "            " ) {
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
                            SizedBox(
                              height: 10,
                            ),
                            Theme(
                                data: ThemeData(
                                    primaryColor: Colors.white,
                                    primaryColorDark: Colors.blue),
                                child: Form(
                                  key: _rightquestionsKey,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: _controllerrightquestions,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value == "" ||
                                          value == " " ||
                                          value == "  ") {
                                        return "Preencha corretamente";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    maxLength: 2,
                                    decoration: InputDecoration(
                                        errorMaxLines: 2,
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
                                        labelText: "Nota obtida",
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
                            SizedBox(
                              height: 10,
                            ),
                            Theme(
                                data: ThemeData(
                                    primaryColor: Colors.white,
                                    primaryColorDark: Colors.blue),
                                child: Form(
                                  key: _allquestionsKey,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: _controllerallquestions,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value == "" ||
                                          value == " " ||
                                          value == "  ") {
                                        return "Preencha corretamente";
                                      } else if (int.parse(
                                          _controllerrightquestions.text) >
                                          int.parse(
                                              _controllerallquestions.text)) {
                                        return "A nota máxima deve ser maior ou igual a nota obtida";
                                      } else if (int.parse(
                                          _controllerallquestions.text) ==
                                          0) {
                                        return "Insira um número diferente de zero";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    maxLength: 2,
                                    decoration: InputDecoration(
                                        errorMaxLines: 2,
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
                                        labelText: "Nota máxima",
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
                                    }),
                              ],
                            )
                          ],
                        )),
                  ));
            },
          ),
        ],
      ),
      body: encodelist.length == 0 ?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Você ainda não adicionou seus resultados...",
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
        ),
      ) :
      Container(
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
                key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(250, 153, 0, 21),
                  ),
                  child: Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Icon(Icons.delete_forever, color: Colors.white),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: ListTile(
                          title: Text(
                            "${encodelist[index]["assunto"]}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.justify,
                          ),
                          trailing: Container(
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${encodelist[index]["rightquestions"]}/${encodelist[index]["allquestions"]}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${((encodelist[index]["rightquestions"]/encodelist[index]["allquestions"])* 100).toInt()}%",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
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
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/materiasredacao/materiasredacao.json");

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
