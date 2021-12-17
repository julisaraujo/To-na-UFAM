import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_na_ufam/plano_de_estudos/drawer/pde_drawer_interface.dart';

class Domingo extends StatefulWidget {
  Domingo({Key key, this.scaffoldKey, this.pageController, this.drawer})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;
  final Widget drawer;

  @override
  _DomingoState createState() => _DomingoState();
}

class _DomingoState extends State<Domingo> {

  List encodelist = [];
  List daysinfolist;

  var timein;
  var timeout;

  List listtags = [];
  String tagsname = "";
  List tagscolorsnumber = [];

  GlobalKey<FormState> _Keyinitialhour = GlobalKey<FormState>();
  final _controllerinitialhour = TextEditingController(text: "");

  GlobalKey<FormState> _Keyinitialminute = GlobalKey<FormState>();
  final _controllerinitialminute = TextEditingController(text: "");

  GlobalKey<FormState> _Keyendhour = GlobalKey<FormState>();
  final _controllerendhour = TextEditingController(text: "");

  GlobalKey<FormState> _Keyendminute = GlobalKey<FormState>();
  final _controllerendminute = TextEditingController(text: "");

  GlobalKey<FormState> _Keydescription = GlobalKey<FormState>();
  final _controllerdescription = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    this._timeOrder();
    _readData().then((quinta) {
      setState(() {
        if(quinta.isNotEmpty){
          encodelist = jsonDecode(quinta);
          timein = encodelist.where((e) => e["timein"] ==
              "${_controllerinitialhour.text}:${_controllerinitialminute.text}");
          timeout = encodelist.where((e) => e["timeout"] ==
              "${_controllerendhour.text}:${_controllerendminute.text}");
        }
      });
    });
    _readDatatag().then((tag) {
      setState(() {
        listtags = jsonDecode(tag);
        tagsname = listtags[0]['tagsname'];
        tagscolorsnumber = listtags[0]['colorsnumber'];
      });
    });
  }

  void _addDay() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["description"] = _controllerdescription.text;
      newToDo["nametag"] = tagsname;
      newToDo["numbercolortags"] = tagscolorsnumber;
      newToDo["timein"] = "${_controllerinitialhour.text}:${_controllerinitialminute.text}";
      newToDo["timeout"] = "${_controllerendhour.text}:${_controllerendminute.text}";
      encodelist.add(newToDo);
      _saveData();
    });
  }

  Future <Null> _timeOrder() async {
    await Future.delayed(
        Duration(seconds: 1)
    );
    setState(() {
      encodelist.sort((a, b) {
        final aTimeInSplit = a["timein"].toString().split(":");
        final aAsDuration = Duration(hours: int.parse(aTimeInSplit.first),
            minutes: int.parse(aTimeInSplit.last));

        final bTimeInSplit = b["timein"].toString().split(":");
        final bAsDuration = Duration(hours: int.parse(bTimeInSplit.first),
            minutes: int.parse(bTimeInSplit.last));

        return aAsDuration.inSeconds < bAsDuration.inSeconds ? -1 : 1;
      });

      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        elevation: 5,
        title: Text("Domingo",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        automaticallyImplyLeading: false,
        leading: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                widget.scaffoldKey.currentState.openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          StatefulBuilder(
            builder: (BuildContext context, setState) {
              return IconButton(
                icon: Icon(Icons.compare_arrows_sharp),
                onPressed: () {
                  widget.scaffoldKey.currentState.openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: PDEDrawerInterface(widget.pageController),
      drawer: widget.drawer,
      backgroundColor: Color.fromARGB(100, 42, 46, 50),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          listtags.length ==
              0
              ? widget.scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: Text(
                    "Para adicionar uma tarefa, você deve primeiro criar uma tag no botão que está no topo da tela inicial",
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                Icon(Icons.turned_in_outlined,
                    color: Colors.white)
              ],
            ),
            duration: Duration(seconds: 6),
          ))
              : Navigator.push(context,
              PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: StatefulBuilder(
                    builder: (BuildContext context,
                        StateSetter setState){
                      final node = FocusScope.of(context);
                      return Scaffold(
                        appBar: AppBar(
                          elevation: 5,
                          title: Text(
                            "Adicione uma nova tarefa",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Color.fromARGB(150, 42, 46, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_sharp,
                              color:Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          actions: [
                            IconButton(
                                icon: Icon(Icons.check_circle,
                                  color: Color(0xff13d38e),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_Keyinitialhour.currentState.validate() &&
                                        _Keyinitialminute.currentState.validate() &&
                                        _Keyendhour.currentState.validate() &&
                                        _Keyendminute.currentState.validate() &&
                                        _Keydescription.currentState.validate()) {
                                      Navigator.pop(context);
                                      _addDay();
                                      _controllerdescription.clear();
                                      _controllerendhour.clear();
                                      _controllerendminute.clear();
                                      _controllerinitialhour.clear();
                                      _controllerinitialminute.clear();
                                    }
                                  });
                                }
                            )
                          ],
                        ),
                        body: ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10
                          ),
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                      "Insira horários no formato 00:00",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white54, fontSize: 17),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hora inicial",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white70, fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 60,
                                          child: Form(
                                            key: _Keyinitialhour,
                                            child: TextFormField(
                                              onEditingComplete: () => node.nextFocus(),
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              controller: _controllerinitialhour,
                                              validator: (value) {
                                                if (value.isEmpty ||
                                                    value == "" ||
                                                    value == " " ||
                                                    value == "  ") {
                                                  return "";
                                                } else if (value.length != 2) {
                                                  return "";
                                                } else if (int.parse(value) > 23) {
                                                  return "";
                                                } else if (int.parse(value) >
                                                    int.parse(_controllerendhour.text)) {
                                                  return "";
                                                }
                                                return null;
                                              },
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 20),
                                              maxLength: 2,
                                              decoration: InputDecoration(
                                                  errorMaxLines: 1,
                                                  errorStyle: TextStyle(
                                                      fontSize: 10
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(20)),
                                                    borderSide: BorderSide(
                                                        width: 2, color: Color(0xff13d38e)),
                                                  ),
                                                  counterStyle: TextStyle(
                                                    color: Colors.transparent,
                                                  ),
                                                  labelText: "",
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.white),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(20)))),
                                              autofocus: false,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: 20,
                                            height: 100,
                                            child: Align(
                                              alignment: Alignment(0.25, -0.5),
                                              child: Text(
                                                ":",
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 30),
                                              ),
                                            )),
                                        Container(
                                          height: 100,
                                          width: 60,
                                          child: Form(
                                            key: _Keyinitialminute,
                                            child: TextFormField(
                                              onEditingComplete: () => node.nextFocus(),
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              controller: _controllerinitialminute,
                                              validator: (value) {
                                                if (value.isEmpty ||
                                                    value == "" ||
                                                    value == " " ||
                                                    value == "  ") {
                                                  return "";
                                                } else if (value.length != 2) {
                                                  return "";
                                                } else if (int.parse(value) > 59) {
                                                  return "";
                                                } else
                                                if (int.parse(_controllerinitialhour.text) ==
                                                    int.parse(_controllerendhour.text) &&
                                                    int.parse(value) >
                                                        int.parse(_controllerendminute.text)) {
                                                  return "";
                                                } else
                                                if (int.parse(_controllerinitialhour.text) ==
                                                    int.parse(_controllerendhour.text) &&
                                                    int.parse(value) ==
                                                        int.parse(_controllerendminute.text)) {
                                                  return "";
                                                }
                                                return null;
                                              },
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 20),
                                              maxLength: 2,
                                              decoration: InputDecoration(
                                                  errorMaxLines: 1,
                                                  errorStyle: TextStyle(
                                                      fontSize: 10
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(20)),
                                                    borderSide: BorderSide(
                                                        width: 2, color: Color(0xff13d38e)),
                                                  ),
                                                  counterStyle: TextStyle(
                                                    color: Colors.transparent,
                                                  ),
                                                  labelText: "",
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.white),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(20)))),
                                              autofocus: false,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hora final",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white70, fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 60,
                                          child: Form(
                                            key: _Keyendhour,
                                            child: TextFormField(
                                              onEditingComplete: () => node.nextFocus(),
                                              controller: _controllerendhour,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value.isEmpty ||
                                                    value == "" ||
                                                    value == " " ||
                                                    value == "  ") {
                                                  return "";
                                                } else if (value.length != 2) {
                                                  return "";
                                                } else if (int.parse(value) > 23) {
                                                  return "";
                                                } else if (int.parse(value) <
                                                    int.parse(_controllerinitialhour.text)) {
                                                  return "";
                                                }
                                                return null;
                                              },
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 20),
                                              maxLength: 2,
                                              decoration: InputDecoration(
                                                  errorMaxLines: 1,
                                                  errorStyle: TextStyle(
                                                      fontSize: 10
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(20)),
                                                    borderSide: BorderSide(
                                                        width: 2, color: Color(0xff13d38e)),
                                                  ),
                                                  counterStyle: TextStyle(
                                                    color: Colors.transparent,
                                                  ),
                                                  labelText: "",
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.white),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(20)))),
                                              autofocus: false,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: 20,
                                            height: 100,
                                            child: Align(
                                              alignment: Alignment(0.25, -0.5),
                                              child: Text(
                                                ":",
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 30),
                                              ),
                                            )),
                                        Container(
                                          height: 100,
                                          width: 60,
                                          child: Form(
                                            key: _Keyendminute,
                                            child: TextFormField(
                                              onEditingComplete: () => node.nextFocus(),
                                              controller: _controllerendminute,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value.isEmpty ||
                                                    value == "" ||
                                                    value == " " ||
                                                    value == "  ") {
                                                  return "";
                                                } else if (value.length != 2) {
                                                  return "";
                                                } else if (int.parse(value) > 59) {
                                                  return "";
                                                } else
                                                if (int.parse(_controllerinitialhour.text) ==
                                                    int.parse(_controllerendhour.text) &&
                                                    int.parse(value) < int.parse(
                                                        _controllerinitialminute.text)) {
                                                  return "";
                                                } else
                                                if (int.parse(_controllerinitialhour.text) ==
                                                    int.parse(_controllerendhour.text) &&
                                                    int.parse(value) == int.parse(
                                                        _controllerinitialminute.text)) {
                                                  return "";
                                                }
                                                return null;
                                              },
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 20),
                                              maxLength: 2,
                                              decoration: InputDecoration(
                                                  errorMaxLines: 1,
                                                  errorStyle: TextStyle(
                                                      fontSize: 10
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(20)),
                                                    borderSide: BorderSide(
                                                        width: 2, color: Color(0xff13d38e)),
                                                  ),
                                                  counterStyle: TextStyle(
                                                    color: Colors.transparent,
                                                  ),
                                                  labelText: "",
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.white),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(20)))),
                                              autofocus: false,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(150, 42, 46, 50),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    )),
                                alignment: Alignment.centerLeft,
                                width: 350,
                                height: 60,
                                child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: listtags.length ==
                                          0 ?
                                      CircularProgressIndicator()
                                          : DropdownButton(
                                          value: null,
                                          isExpanded: true,
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          hint: Row(
                                            children: [
                                              Icon(
                                                Icons.turned_in_rounded,
                                                color: Color.fromARGB(250, tagscolorsnumber[0],
                                                    tagscolorsnumber[1], tagscolorsnumber[2]),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "$tagsname",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          underline: Container(
                                            color: Colors.white,
                                          ),
                                          onChanged: (listtags) async {
                                            setState(() {
                                              this.tagsname = listtags["tagsname"];
                                              this.tagscolorsnumber = listtags["colorsnumber"];
                                            });
                                          },
                                          items: listtags.map((listtags) {
                                            return DropdownMenuItem<dynamic>(
                                              value: listtags,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.turned_in_rounded,
                                                    color: Color.fromARGB(
                                                        250,
                                                        listtags["colorsnumber"][0],
                                                        listtags["colorsnumber"][1],
                                                        listtags["colorsnumber"][2]),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "${listtags["tagsname"]}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList()),
                                    ))),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 100,
                              child: Form(
                                key: _Keydescription,
                                child: TextFormField(
                                  controller: _controllerdescription,
                                  validator: (value) {
                                    if (value.isEmpty ||
                                        value == "" ||
                                        value == " " ||
                                        value == "  ") {
                                      return "Este campo não pode estar em branco";
                                    } else if (value.length > 40) {
                                      return "O número de caracteres não pode ser maior que 40";
                                    } else if (encodelist.where((e) => e["timein"] ==
                                        "${_controllerinitialhour.text}:${_controllerinitialminute.text}").toList().length != 0 ) {
                                      return "Você já possui uma tarefa que começa esse horário";
                                    } else if (encodelist.where((e) => e["timeout"] ==
                                        "${_controllerendhour.text}:${_controllerendminute.text}").toList().length != 0 ) {
                                      return "Você já possui uma tarefa que termina esse horário";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                  maxLength: 40,
                                  decoration: InputDecoration(
                                      errorMaxLines: 2,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide:
                                        BorderSide(width: 2, color: Color(0xff13d38e)),
                                      ),
                                      counterStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      labelText: "Adicione uma descrição",
                                      labelStyle: TextStyle(color: Colors.white, fontSize: 19),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                                  autofocus: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
              )
          );
        },
      ),
      body: encodelist.length == 0 ?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Você ainda não adicionou tarefas...",
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
              Icons.access_time_outlined,
              size: 30,
              color: Colors.grey,
            )
          ],
        ),
      ) :
      Row(
        children: [
          Expanded(
              child: RefreshIndicator(
                onRefresh: _timeOrder,
                child: ListView.builder(
                    itemCount: encodelist.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: Key(DateTime
                              .now()
                              .millisecondsSinceEpoch
                              .toString()),
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(250, 153, 0, 21),
                            ),
                            child: Align(
                              alignment: Alignment(-0.9, 0.0),
                              child: Icon(Icons.delete_forever,
                                  color: Colors.white),
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              encodelist.removeAt(index);
                              _saveData();
                            });
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: Text(
                                  "${encodelist[index]["timein"]}\n${encodelist[index]["timeout"]}",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15
                                  ),
                                ),
                                title: Text(
                                  "${encodelist[index]["nametag"]}",
                                  textAlign: TextAlign.justify,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                  TextStyle(
                                      fontSize: 13, color: Colors.white54),
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 7, bottom: 7),
                                  child: Text(
                                    "${encodelist[index]["description"]}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    style:
                                    TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.turned_in_rounded,
                                  size: 25,
                                  color: Color.fromARGB(
                                      250,
                                      encodelist[index]["numbercolortags"][0],
                                      encodelist[index]["numbercolortags"][1],
                                      encodelist[index]["numbercolortags"][2]),
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
                    }),
              )
          ),
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/domingo/domingo.json");

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

  Future<File> _getFiletag() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/tagfolder/tag.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatatag() async {
    try {
      final file = await _getFiletag();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveData() async {
    String quinta = json.encode(encodelist);

    final file = await _getFile();
    return file.writeAsString(quinta);
  }
}

