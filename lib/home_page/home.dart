import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:radar_chart/radar_chart.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'package:to_na_ufam/plano_de_estudos/tag_color/tag_color_page.dart';
import 'info_diaria.dart';

class Home extends StatefulWidget {
  Home({Key key, this.pageController, this.scaffoldkey}) : super(key: key);

  final PageController pageController;
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List encodelist = [];
  var Icone = Icons.emoji_people_rounded;

  List portResult = [];
  List matResult = [];
  List quiResult = [];
  List fisResult = [];
  List bioResult = [];
  List geoResult = [];
  List histResult = [];
  List litResult = [];
  List redResult = [];

  List all = [
    {
      "materia": "Português",
      "nota": 0
    },
    {
      "materia": "Matemática",
      "nota": 0
    },
    {
      "materia": "Química",
      "nota": 0
    },
    {
      "materia": "Física",
      "nota": 0
    },
    {
      "materia": "Biologia",
      "nota": 0
    },
    {
      "materia": "Geografia",
      "nota": 0
    },
    {
      "materia": "História",
      "nota": 0
    },
    {
      "materia": "Literatura",
      "nota": 0
    },
    {
      "materia": "Redação",
      "nota": 0
    },
  ];
  List sortall = [
    {
      "materia": "Português",
      "nota": 0
    },
    {
      "materia": "Matemática",
      "nota": 0
    },
    {
      "materia": "Química",
      "nota": 0
    },
    {
      "materia": "Física",
      "nota": 0
    },
    {
      "materia": "Biologia",
      "nota": 0
    },
    {
      "materia": "Geografia",
      "nota": 0
    },
    {
      "materia": "História",
      "nota": 0
    },
    {
      "materia": "Literatura",
      "nota": 0
    },
    {
      "materia": "Redação",
      "nota": 0
    },
  ];


  @override
  void initState() {
    super.initState();
    this._ranking();
    setState(() {
      _readData().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            encodelist = jsonDecode(data);
          }
          _iconefunction();
        });
      });
    });
    setState(() {
      _readDataresultadosbio().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            bioResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadosport().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            portResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadosmat().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            matResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadosquim().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            quiResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadosgeo().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            geoResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadosfis().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            fisResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadosred().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            redResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadoslit().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            litResult = jsonDecode(data);
          }
        });
      });
    });
    setState(() {
      _readDataresultadoshist().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            histResult = jsonDecode(data);
          }
        });
      });
    });
  }

  Future<Null> _ranking() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      all = [
        {
          "materia": "Português",
          "nota": (portResult.length == 0
              ? 0
              : ((portResult
              .map((portResult) => portResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              portResult
                  .map((portResult) => portResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "Matemática",
          "nota": (matResult.length == 0
              ? 0
              : ((matResult
              .map((matResult) => matResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              matResult
                  .map((matResult) => matResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "Química",
          "nota": (quiResult.length == 0
              ? 0
              : ((quiResult
              .map((quiResult) => quiResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              quiResult
                  .map((quiResult) => quiResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "Física",
          "nota": (fisResult.length == 0
              ? 0
              : ((fisResult
              .map((fisResult) => fisResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              fisResult
                  .map((fisResult) => fisResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "Biologia",
          "nota": (bioResult.length == 0
              ? 0
              : ((bioResult
              .map((bioResult) => bioResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              bioResult
                  .map((bioResult) => bioResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "Geografia",
          "nota": (geoResult.length == 0
              ? 0
              : ((geoResult
              .map((geoResult) => geoResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              geoResult
                  .map((geoResult) => geoResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "História",
          "nota": (histResult.length == 0
              ? 0
              : ((histResult
              .map((histResult) => histResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              histResult
                  .map((histResult) => histResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "Literatura",
          "nota": (litResult.length == 0
              ? 0
              : ((litResult
              .map((litResult) => litResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              litResult
                  .map((litResult) => litResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
        {
          "materia": "Redação",
          "nota": (redResult.length == 0
              ? 0
              : ((redResult
              .map((redResult) => redResult["rightquestions"])
              .toList()
              .reduce((curr, next) => curr + next) /
              redResult
                  .map((redResult) => redResult["allquestions"])
                  .toList()
                  .reduce((curr, next) => curr + next)) *
              100)
              .round())
        },
      ];
      sortall = all;
      sortall.sort((a,b) => a["nota"].compareTo(b["nota"]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldkey,
      drawer: CustomDrawer(widget.pageController),
      backgroundColor: Color.fromARGB(100, 42, 46, 50),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            backgroundColor: Color.fromARGB(250, 28, 34, 34),
            expandedHeight: 230,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                size: 25,
              ),
              onPressed: () => widget.scaffoldkey.currentState.openDrawer(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.turned_in_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: TagColorPage()));
                },
              ),
            ],
            shape: CustomShapeBorder(),
            flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 125,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    encodelist.length == 0
                                        ? "Olá, estudante"
                                        : "Olá ${encodelist[encodelist.length - 1]["future"]} ${encodelist[encodelist.length - 1]["pronome"]}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    encodelist.length == 0
                                        ? "Atualize seus dados na aba Meu Perfil"
                                        : "${encodelist[encodelist.length - 1]["nome"]}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                  Text(
                                    encodelist.length == 0
                                        ? ""
                                        : "${encodelist[encodelist.length - 1]["serie"]}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icone,
                            color: Colors.white,
                            size: 70,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  <Widget>[
                    InfoDay(),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(250, 28, 34, 34),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Comparativo de rendimento",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            RadarChart(
                              length: 9,
                              radius: MediaQuery.of(context).size.width*0.35,
                              initialAngle: 145,
                              borderStroke: 2,
                              backgroundColor: Color.fromARGB(250, 42, 46, 50),
                              radialStroke: 0.5,
                              radialColor: Colors.white10,
                              vertices: [
                                PreferredSize(
                                  preferredSize: Size.fromRadius(-5),
                                  child: Text(
                                    "Port",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.fromRadius(0),
                                  child: Text(
                                    "Mat",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.fromRadius(-3),
                                  child: Text(
                                    "Quí",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.square(50),
                                  child: Text(
                                    "Fis",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.lerp(
                                      Size.fromRadius(10), Size.fromRadius(11), 15),
                                  child: Text(
                                    "Bio",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.fromRadius(20),
                                  child: Text(
                                    "Geo",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.square(50),
                                  child: Text(
                                    "Hist",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.square(55),
                                  child: Text(
                                    "Lit",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                ),
                                PreferredSize(
                                  preferredSize: Size.fromRadius(0),
                                  child: Text(
                                    "Red",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60),
                                  ),
                                )
                              ],
                              radars: [
                                RadarTile(
                                  values: [
                                    portResult.length == 0
                                        ? 0
                                        : ((portResult
                                        .map((portResult) => portResult[
                                    "rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        portResult
                                            .map((portResult) =>
                                        portResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    matResult.length == 0
                                        ? 0
                                        : ((matResult
                                        .map((matResult) =>
                                    matResult["rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        matResult
                                            .map((matResult) =>
                                        matResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    quiResult.length == 0
                                        ? 0
                                        : ((quiResult
                                        .map((quiResult) =>
                                    quiResult["rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        quiResult
                                            .map((quiResult) =>
                                        quiResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    fisResult.length == 0
                                        ? 0
                                        : ((fisResult
                                        .map((fisResult) =>
                                    fisResult["rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        fisResult
                                            .map((fisResult) =>
                                        fisResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    bioResult.length == 0
                                        ? 0
                                        : ((bioResult
                                        .map((bioResult) =>
                                    bioResult["rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        bioResult
                                            .map((bioResult) =>
                                        bioResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    geoResult.length == 0
                                        ? 0
                                        : ((geoResult
                                        .map((geoResult) =>
                                    geoResult["rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        geoResult
                                            .map((geoResult) =>
                                        geoResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    histResult.length == 0
                                        ? 0
                                        : ((histResult
                                        .map((histResult) => histResult[
                                    "rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        histResult
                                            .map((histResult) =>
                                        histResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    litResult.length == 0
                                        ? 0
                                        : ((litResult
                                        .map((litResult) =>
                                    litResult["rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        litResult
                                            .map((litResult) =>
                                        litResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble(),
                                    redResult.length == 0
                                        ? 0
                                        : ((redResult
                                        .map((redResult) =>
                                    redResult["rightquestions"])
                                        .toList()
                                        .reduce((curr, next) =>
                                    curr + next) /
                                        redResult
                                            .map((redResult) =>
                                        redResult["allquestions"])
                                            .toList()
                                            .reduce((curr, next) =>
                                        curr + next)))
                                        .toDouble()
                                  ],
                                  borderStroke: 2,
                                  backgroundColor: Colors.white24,
                                  borderColor: Colors.white38,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(250, 28, 34, 34),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Ranking de rendimento",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  ComparativoTile("1", "${sortall[8]["materia"]}", sortall[8]["nota"]),
                                  ComparativoTile("2", "${sortall[7]["materia"]}", sortall[7]["nota"]),
                                  ComparativoTile("3", "${sortall[6]["materia"]}", sortall[6]["nota"]),
                                  ComparativoTile("4", "${sortall[5]["materia"]}", sortall[5]["nota"]),
                                  ComparativoTile("5", "${sortall[4]["materia"]}", sortall[4]["nota"]),
                                  ComparativoTile("6", "${sortall[3]["materia"]}", sortall[3]["nota"]),
                                  ComparativoTile("7", "${sortall[2]["materia"]}", sortall[2]["nota"]),
                                  ComparativoTile("8", "${sortall[1]["materia"]}", sortall[1]["nota"]),
                                  ComparativoTile("9", "${sortall[0]["materia"]}", sortall[0]["nota"]),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ])
          ),
        ],
      ),
    );
  }

  _iconefunction() {
    if ((((encodelist.where((element) => element["profile"] == "profile"))
                    .toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Enfermagem") {
      setState(() {
        Icone = FlutterIcons.syringe_faw5s;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Música") {
      setState(() {
        Icone = FlutterIcons.music_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Artes Visuais") {
      setState(() {
        Icone = FlutterIcons.palette_outline_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Agronomia") {
      setState(() {
        Icone = FlutterIcons.tractor_faw5s;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia Florestal") {
      setState(() {
        Icone = FlutterIcons.sprout_outline_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia de Pesca") {
      setState(() {
        Icone = FlutterIcons.fishbowl_outline_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Zootecnia") {
      setState(() {
        Icone = FlutterIcons.cow_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia de Alimentos") {
      setState(() {
        Icone = FlutterIcons.food_apple_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Farmácia") {
      setState(() {
        Icone = FlutterIcons.pills_faw5s;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Direito") {
      setState(() {
        Icone = FlutterIcons.scale_balance_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Educação Física") {
      setState(() {
        Icone = FlutterIcons.dumbbell_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Fisioterapia") {
      setState(() {
        Icone = FlutterIcons.crutch_faw5s;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Administração") {
      setState(() {
        Icone = FlutterIcons.account_tie_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Ciências Contábeis") {
      setState(() {
        Icone = FlutterIcons.calculator_faw;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Ciências Econômicas") {
      setState(() {
        Icone = FlutterIcons.piggy_bank_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Bibliteconomia") {
      setState(() {
        Icone = FlutterIcons.book_open_page_variant_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Relações Públicas") {
      setState(() {
        Icone = FlutterIcons.human_greeting_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Arquivologia") {
      setState(() {
        Icone = FlutterIcons.archive_ent;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Jornalismo") {
      setState(() {
        Icone = FlutterIcons.newspaper_o_faw;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Letras - Português") {
      setState(() {
        Icone = FlutterIcons.alphabetical_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Letras - Inglês") {
      setState(() {
        Icone = FlutterIcons.currency_usd_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Letras - Francês") {
      setState(() {
        Icone = FlutterIcons.baguette_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Letras - Espanhol") {
      setState(() {
        Icone = FlutterIcons.comment_text_multiple_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Letras - Japonês") {
      setState(() {
        Icone = FlutterIcons.vihara_faw5s;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Medicina") {
      setState(() {
        Icone = FlutterIcons.stethoscope_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Odontologia") {
      setState(() {
        Icone = FlutterIcons.tooth_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Psicologia") {
      setState(() {
        Icone = FlutterIcons.account_question_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia Civil") {
      setState(() {
        Icone = FlutterIcons.md_construct_ion;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia Elétrica - Eletrônica") {
      setState(() {
        Icone = FlutterIcons.memory_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia Elétrica - Eletrotécnica") {
      setState(() {
        Icone = FlutterIcons.flash_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia Elétrica - Telecomunicações") {
      setState(() {
        Icone = FlutterIcons.satellite_uplink_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia da Computação") {
      setState(() {
        Icone = FlutterIcons.keyboard_ent;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia de Produção") {
      setState(() {
        Icone = FlutterIcons.factory_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Design") {
      setState(() {
        Icone = FlutterIcons.palette_swatch_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia de Materiais") {
      setState(() {
        Icone = FlutterIcons.molecule_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia Mecânica") {
      setState(() {
        Icone = FlutterIcons.tools_oct;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Arquitetura e Urbanismo") {
      setState(() {
        Icone = FlutterIcons.ruler_square_compass_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia de Petróleo e Gás") {
      setState(() {
        Icone = FlutterIcons.gas_station_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia Química") {
      setState(() {
        Icone = FlutterIcons.test_tube_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Ciências Biológicas") {
      setState(() {
        Icone = FlutterIcons.bacteria_outline_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Ciências Naturais") {
      setState(() {
        Icone = FlutterIcons.leaf_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Biotecnologia") {
      setState(() {
        Icone = FlutterIcons.dna_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Estatística") {
      setState(() {
        Icone = FlutterIcons.chart_areaspline_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Geologia") {
      setState(() {
        Icone = FlutterIcons.pickaxe_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Matemática") {
      setState(() {
        Icone = FlutterIcons.pi_box_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Química") {
      setState(() {
        Icone = FlutterIcons.flask_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Física") {
      setState(() {
        Icone = FlutterIcons.atom_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Ciência da Computação") {
      setState(() {
        Icone = FlutterIcons.desktop_classic_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Engenharia de Software") {
      setState(() {
        Icone = FlutterIcons.file_code_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Serviço Social") {
      setState(() {
        Icone = FlutterIcons.account_multiple_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Geografia") {
      setState(() {
        Icone = FlutterIcons.earth_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "História") {
      setState(() {
        Icone = FlutterIcons.pillar_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Ciências Sociais") {
      setState(() {
        Icone = FlutterIcons.users_faw5s;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Filosofia") {
      setState(() {
        Icone = FlutterIcons.thought_bubble_outline_mco;
      });
    } else if ((((encodelist.where(
                    (element) => element["profile"] == "profile")).toList())
                .length) >
            0 &&
        "${((encodelist.where((element) => element["profile"] == "profile")).toList())[((encodelist.where((element) => element["profile"] == "profile")).toList()).length - 1]["curso"]}" ==
            "Pedagogia") {
      setState(() {
        Icone = FlutterIcons.chalkboard_teacher_faw5s;
      });
    } else {
      setState(() {
        Icone = Icone;
      });
    }
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

  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadosbio() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasbiologia/materiasbiologia.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadosbio() async {
    try {
      final file = await _getFileresultadosbio();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadosfis() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasfisica/materiasfisica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadosfis() async {
    try {
      final file = await _getFileresultadosfis();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadosgeo() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasgeografia/materiasgeografia.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadosgeo() async {
    try {
      final file = await _getFileresultadosgeo();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadoshist() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiashistoria/materiashistoria.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadoshist() async {
    try {
      final file = await _getFileresultadoshist();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadoslit() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasliteratura/materiasliteratura.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadoslit() async {
    try {
      final file = await _getFileresultadoslit();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadosmat() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasmatematica/materiasmatematica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadosmat() async {
    try {
      final file = await _getFileresultadosmat();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadosport() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasportugues/materiasportugues.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadosport() async {
    try {
      final file = await _getFileresultadosport();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadosquim() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasquimica/materiasquimica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadosquim() async {
    try {
      final file = await _getFileresultadosquim();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileresultadosred() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/materiasredacao/materiasredacao.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultadosred() async {
    try {
      final file = await _getFileresultadosred();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect size, {TextDirection textDirection}) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ComparativoTile extends StatelessWidget {

  final String posicao;
  final String materia;
  final int nota;

  ComparativoTile(this.posicao,this.materia,this.nota);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                posicao,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    materia,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60),
                  ),
                ],
              )
            ],
          ),
          subtitle: nota < 50 ? Text("É indicável você dar atenção a essa matéria",
            style: TextStyle(
                fontSize: 12,
                color: Colors.red),
          ) : null,
          trailing: Text(
            "${nota.toString()}%",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Divider(
          color: Colors.white12,
          height: 0,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}