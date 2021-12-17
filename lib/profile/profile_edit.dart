import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'package:to_na_ufam/page_view/home_screen.dart';

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key key, this.scaffoldKey, this.pageController})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  GlobalKey<FormState> _formKey0 = GlobalKey<FormState>();
  final _controllerNome = TextEditingController(text: "");

  List encodelist = [
    {
      "profile": "profile",
      "nome": "Estudante",
      "pronome": "Universitário",
      "future": "futuro",
      "serie": "1º ano"
    },
  ];

  List cursosufam = [];
  List sexolist = [];
  List serielist = [];


  var sexo = "Masculino";
  var serie = "1º ano";
  var pronome = "Universitário";
  var future = "futuro";
  var dropdownbuttonufam = 'Escolha seu curso...';
  var dropdownbuttonmasculinoufam = 'Universitário';
  var dropdownbuttonfemininoufam = 'Universitária';


  Widget myalert = Text("",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.red, fontSize: 15));
  Widget myalertreal = Text("É necessário que você escolha um curso",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.red, fontSize: 15));

  Future<String> CursosUfamJson() async {
    var jsonString = await rootBundle.loadString('assets/cursos_ufam.json');
    setState(() {
      this.cursosufam = jsonDecode(jsonString);
    });
  }

  Future<String> SexoJson() async {
    var jsonString = await rootBundle.loadString('assets/sexo.json');
    setState(() {
      this.sexolist = jsonDecode(jsonString);
    });
  }

  Future<String> SerieJson() async {
    var jsonString = await rootBundle.loadString('assets/serie.json');
    setState(() {
      this.serielist = jsonDecode(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if (data.isNotEmpty) {
          encodelist = jsonDecode(data);
        }
      });
    });
    this.CursosUfamJson();
    this.SexoJson();
    this.SerieJson();
  }

  _validade(String input) {
    if (sexo == "Masculino") {
      setState(() {
        pronome = dropdownbuttonmasculinoufam;
        future = "futuro";
      });
    } else if (sexo == "Feminino") {
      setState(() {
        pronome = dropdownbuttonfemininoufam;
        future = "futura";
      });
    }
  }

  void dataprofile() {
    setState(() {
      Map<String, dynamic> dataprofile = Map();
      dataprofile["profile"] = "profile";
      dataprofile["nome"] = _controllerNome.text;
      dataprofile["curso"] = dropdownbuttonufam;
      dataprofile["sexo"] = sexo;
      dataprofile["pronome"] = pronome;
      dataprofile["future"] = future;
      dataprofile["serie"] = serie;
      encodelist.add(dataprofile);
      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.scaffoldKey,
        appBar: AppBar(
          elevation: 10,
          title: Text("Meu Perfil",
              style: TextStyle(color: Colors.white, fontSize: 17)),
          backgroundColor: Color.fromARGB(150, 42, 46, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 25,
            ),
            onPressed: () => widget.scaffoldKey.currentState.openDrawer(),
          ),
        ),
        drawer: CustomDrawer(widget.pageController),
        backgroundColor: Color.fromARGB(250, 28, 34, 34),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_formKey0.currentState.validate() &&
                  dropdownbuttonufam != 'Escolha seu curso...') {
                dataprofile();
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: HomeScreen()));
              } else {
                myalert = myalertreal;
              }
            });
          },
          elevation: 5,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 25,
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.white,
                      primaryColorDark: Colors.blue),
                  child: Form(
                    key: _formKey0,
                    child: TextFormField(
                      controller: _controllerNome,
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
                            value == "                    ") {
                          return "Este campo não pode estar em branco";
                        } else if (value.length > 20) {
                          return "O número de caracteres não pode ser maior que 20";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      maxLength: 20,
                      decoration: InputDecoration(
                          errorMaxLines: 2,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                width: 2, color: Color(0xff13d38e)),
                          ),
                          counterStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelText: "Insira seu nome ou apelido",
                          labelStyle:
                          TextStyle(color: Colors.white, fontSize: 19),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)))),
                      autofocus: false,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Gênero",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromARGB(250, 212, 214, 216),
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(150, 42, 46, 50),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                )),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.425,
                            child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: DropdownButton(
                                    value: null,
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    hint: Text(
                                      "$sexo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    underline: Container(
                                      color: Colors.white,
                                    ),
                                    onChanged: (sexolist) {
                                      setState(() {
                                        this.sexo = sexolist["sexo"];
                                        _validade(pronome);
                                      });
                                    },
                                    items: sexolist.map((sexolist) {
                                      return DropdownMenuItem<dynamic>(
                                        value: sexolist,
                                        child: Text(
                                          sexolist["sexo"],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )))),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Série",
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: TextStyle(
                                color: Color.fromARGB(250, 212, 214, 216),
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(150, 42, 46, 50),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                )),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.425,
                            child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: DropdownButton(
                                    value: null,
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    hint: Text(
                                      "$serie",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    underline: Container(
                                      color: Colors.white,
                                    ),
                                    onChanged: (serielist) {
                                      setState(() {
                                        this.serie = serielist["serie"];
                                      });
                                    },
                                    items: serielist.map((serielist) {
                                      return DropdownMenuItem<dynamic>(
                                        value: serielist,
                                        child: Text(
                                          serielist["serie"],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )))),
                  ],
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.transparent,
                  child: Text(
                    "Qual graduação você pretende cursar na UFAM ?",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color.fromARGB(250, 212, 214, 216),
                        fontSize: 18),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(150, 42, 46, 50),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        )),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: DropdownButton(
                              value: null,
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 30,
                              ),
                              hint: Text(
                                "$dropdownbuttonufam",
                                textAlign: TextAlign.left,
                                style:
                                TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              underline: Container(
                                color: Colors.white,
                              ),
                              onChanged: (cursosufam) {
                                setState(() {
                                  this.dropdownbuttonufam = cursosufam["curso"];
                                  this.dropdownbuttonmasculinoufam =
                                  cursosufam["masculino"];
                                  this.dropdownbuttonfemininoufam =
                                  cursosufam["feminino"];
                                  _validade(pronome);
                                });
                              },
                              items: cursosufam.map((cursosufam) {
                                return DropdownMenuItem<dynamic>(
                                  value: cursosufam,
                                  child: Text(
                                    cursosufam['curso'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList()),
                        )))),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 10, top: 5),
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 20,
                  child: myalert,
                ))
          ],
        )
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/profile/profile.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
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
