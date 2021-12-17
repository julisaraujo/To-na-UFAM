import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'infos_psc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_admob/firebase_admob.dart';

class UfamPSC extends StatefulWidget {
  @override
  _UfamPSCState createState() => _UfamPSCState();
}

class _UfamPSCState extends State<UfamPSC> {
  List curso_ufam_notas = [];
  var cursonome1 = "Direito Diur (Bach.) - PPI1";
  var cursonota1 = <dynamic>[243.0, 231.0, 198.0, 219.0, 261.0, 258.0, 294.0];
  var cursocandidatos1 = <dynamic>[55, 43, 44, 82, 164, 116, 120];
  var cursovagas1 = <dynamic>[4, 5, 7, 7, 5, 5, 7];
  var cursonome2 = "Direito Diur (Bach) - PPI2";
  var cursonota2 = <dynamic>[246.0, 267.0, 192.0, 273.0, 261.0, 306.0, 270.0];
  var cursocandidatos2 = <dynamic>[32, 42, 26, 91, 70, 71, 65];
  var cursovagas2 = <dynamic>[4, 5, 7, 7, 5, 5, 7];

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  Future loadJsonData() async {
    var jsonString =
    await rootBundle.loadString('assets/cursos_ufam_notas.json');
    setState(() {
      this.curso_ufam_notas = jsonDecode(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3187294347110962~7379278793");
    this.loadJsonData();
  }

  InterstitialAd _interstitialAd;
  int clicks = 0;

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-3187294347110962/3018196108",
      targetingInfo: MobileAdTargetingInfo(
        keywords: <String>[
          'vestibular',
          'universidade',
          'bolsa de estudos',
          'faculdade',
          'livros',
          'notebooks',
          'papelaria',
          'cursinho',
          'curso',
          'pré vestibular',
          'concurso',
          'escola',
          'ufam',
          'faculdade pública',
          'faculdade particular',
          'medicina',
          'engenharia',
          'direito',
          'faculdade manaus',
          'manaus',
          'amazonas'
        ],
        contentUrl: 'https://ufam.edu.br/',
        childDirected: false,
      ),
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void shouldDisplayTheAd() {
    clicks++;
    if (clicks >= 2) {
      _interstitialAd = createInterstitialAd()
        ..load()
        ..show();
      clicks = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              title: Text("PSC"),
              backgroundColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height * 0.45,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: InfoPSC()));
                    })
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)),
                        color: Color.fromARGB(150, 42, 46, 50),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(-1.0, 5.0))
                        ],
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*2,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                  bottom: 30,
                                  left: 20,
                                  right: 20
                              ),
                              child: LineChart(
                                LineChartData(
                                  lineTouchData: LineTouchData(
                                    enabled: true,
                                    getTouchedSpotIndicator:
                                        (LineChartBarData barData,
                                        List<int> spotIndexes) {
                                      return spotIndexes.map((index) {
                                        return TouchedSpotIndicatorData(
                                          FlLine(
                                            color: Colors.transparent,
                                            strokeWidth: 0.5,
                                          ),
                                          FlDotData(
                                            show: true,
                                            getDotPainter: (spot, percent,
                                                barData, index) =>
                                                FlDotCirclePainter(
                                                  radius: 4,
                                                  color: Colors.transparent,
                                                  strokeWidth: 2,
                                                  strokeColor: Color.fromARGB(
                                                      200, 0, 82, 75),
                                                ),
                                          ),
                                        );
                                      }).toList();
                                    },
                                    touchTooltipData: LineTouchTooltipData(
                                      tooltipBgColor: Colors.transparent,
                                      tooltipRoundedRadius: 25,
                                      getTooltipItems:
                                          (List<LineBarSpot> lineBarsSpot) {
                                        return lineBarsSpot
                                            .map((lineBarSpot) {
                                          return LineTooltipItem(
                                            lineBarSpot.y.toString(),
                                            TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }).toList();
                                      },
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawVerticalLine: true,
                                    drawHorizontalLine: true,
                                    horizontalInterval: 100,
                                    verticalInterval: 1,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: const Color(0xff37434d),
                                        strokeWidth: 1,
                                      );
                                    },
                                    getDrawingVerticalLine: (value) {
                                      return FlLine(
                                        color: const Color(0xff37434d),
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 15,
                                      margin: 8,
                                      textStyle: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,),
                                      getTitles: (value) {
                                        switch (value.toInt()) {
                                          case 0:
                                            return '2014';
                                          case 1:
                                            return '2015';
                                          case 2:
                                            return '2016';
                                          case 3:
                                            return '2017';
                                          case 4:
                                            return '2018';
                                          case 5:
                                            return '2019';
                                          case 6:
                                            return '2020';
                                        }
                                        return '';
                                      },
                                    ),
                                    leftTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 10,
                                      margin: 9,
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                      getTitles: (value) {
                                        switch (value.toInt()) {
                                          case 100:
                                            return '100';
                                          case 200:
                                            return '200';
                                          case 300:
                                            return '300';
                                          case 400:
                                            return '400';
                                          case 500:
                                            return '500';
                                        }
                                        return '';
                                      },
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  minX: 0,
                                  maxX: 6,
                                  minY: 0,
                                  maxY: 540,
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, cursonota1[0]),
                                        FlSpot(1, cursonota1[1]),
                                        FlSpot(2, cursonota1[2]),
                                        FlSpot(3, cursonota1[3]),
                                        FlSpot(4, cursonota1[4]),
                                        FlSpot(5, cursonota1[5]),
                                        FlSpot(6, cursonota1[6]),
                                      ],
                                      isCurved: false,
                                      colors: [
                                        Color.fromARGB(150, 57, 186, 255)
                                      ],
                                      barWidth: 4,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                              radius: 3,
                                              color: Colors.white,
                                              strokeWidth: 1,
                                              strokeColor: Color.fromARGB(
                                                  250, 57, 186, 255),
                                            ),
                                      ),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        colors: [
                                          Color.fromARGB(50, 57, 186, 255),
                                          Colors.transparent
                                        ],
                                        gradientColorStops: [0.5, 1.0],
                                        gradientFrom: const Offset(0, 0),
                                        gradientTo: const Offset(0, 1),
                                      ),
                                    ),
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, cursonota2[0]),
                                        FlSpot(1, cursonota2[1]),
                                        FlSpot(2, cursonota2[2]),
                                        FlSpot(3, cursonota2[3]),
                                        FlSpot(4, cursonota2[4]),
                                        FlSpot(5, cursonota2[5]),
                                        FlSpot(6, cursonota2[6]),
                                      ],
                                      isCurved: false,
                                      colors: [
                                        Color.fromARGB(150, 19, 203, 147)
                                      ],
                                      barWidth: 4,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                              radius: 3,
                                              color: Colors.white,
                                              strokeWidth: 1,
                                              strokeColor: Color.fromARGB(
                                                  250, 19, 203, 147),
                                            ),
                                      ),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        colors: [
                                          Color.fromARGB(50, 19, 203, 147),
                                          Colors.transparent
                                        ],
                                        gradientColorStops: [0.5, 1.0],
                                        gradientFrom: const Offset(0, 0),
                                        gradientTo: const Offset(0, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              )),

                        ],
                      )),
                ),
              )),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal:
                            MediaQuery.of(context).size.width * 0.011),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(150, 42, 46, 50),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0.0, 10.0))
                            ]),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Center(
                              child: DropdownButton(
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(250, 57, 186, 255),
                                    size: 40,
                                  ),
                                  hint: Text(
                                    "$cursonome1",
                                    style: TextStyle(
                                        color:
                                        Color.fromARGB(250, 57, 186, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (cursoUfamNotas) {
                                    setState(() {
                                      this.cursonota1 = cursoUfamNotas['nota'];
                                      this.cursonome1 = cursoUfamNotas['curso'];
                                      this.cursocandidatos1 =
                                      cursoUfamNotas['candidatos'];
                                      this.cursovagas1 =
                                      cursoUfamNotas['vagas'];
                                    });
                                  },
                                  value: null,
                                  items: curso_ufam_notas.map((cursoUfamNotas) {
                                    return DropdownMenuItem<dynamic>(
                                      value: cursoUfamNotas,
                                      child: Text(
                                        cursoUfamNotas['curso'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList()),
                            ))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal:
                            MediaQuery.of(context).size.width * 0.011),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(150, 42, 46, 50),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0.0, 10.0))
                            ]),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Center(
                              child: DropdownButton(
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(250, 19, 203, 147),
                                    size: 40,
                                  ),
                                  hint: Text(
                                    "$cursonome2",
                                    style: TextStyle(
                                        color:
                                        Color.fromARGB(250, 19, 203, 147),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (cursoUfamNotas) {
                                    setState(() {
                                      this.cursonota2 = cursoUfamNotas['nota'];
                                      this.cursonome2 = cursoUfamNotas['curso'];
                                      this.cursocandidatos2 =
                                      cursoUfamNotas['candidatos'];
                                      this.cursovagas2 =
                                      cursoUfamNotas['vagas'];
                                    });
                                  },
                                  value: null,
                                  items: curso_ufam_notas.map((cursoUfamNotas) {
                                    return DropdownMenuItem<dynamic>(
                                      value: cursoUfamNotas,
                                      child: Text(cursoUfamNotas['curso'],
                                          style:
                                          TextStyle(color: Colors.white)),
                                    );
                                  }).toList()),
                            ))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        shouldDisplayTheAd();
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0))),
                            context: context,
                            builder: (context) => Wrap(
                              children: [
                                ModalShowBanner(
                                  cursonome1,
                                  (cursonota1[0].toInt()),
                                  (cursonota1[1].toInt()),
                                  (cursonota1[2].toInt()),
                                  (cursonota1[3].toInt()),
                                  (cursonota1[4].toInt()),
                                  (cursonota1[5].toInt()),
                                  (cursonota1[6].toInt()),
                                  ((((cursonota1.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .floor() <
                                      0
                                      ? 0
                                      : ((((cursonota1.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .floor(),
                                  ((((cursonota1.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round() <
                                      0
                                      ? 0
                                      : ((((cursonota1.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round(),
                                  ((((cursonota1.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round() <
                                      0
                                      ? 0
                                      : ((((cursonota1.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round(),
                                  cursocandidatos1[0],
                                  cursocandidatos1[1],
                                  cursocandidatos1[2],
                                  cursocandidatos1[3],
                                  cursocandidatos1[4],
                                  cursocandidatos1[5],
                                  cursocandidatos1[6],
                                  cursovagas1[0],
                                  cursovagas1[1],
                                  cursovagas1[2],
                                  cursovagas1[3],
                                  cursovagas1[4],
                                  cursovagas1[5],
                                  cursovagas1[6],
                                )
                              ],
                            ));
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 70,
                          margin: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal:
                              MediaQuery.of(context).size.width * 0.011),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(150, 42, 46, 50),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0.0, 10.0))
                              ]),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,
                                      color: Color.fromARGB(250, 57, 186, 255),
                                      size: 35),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "$cursonome1",
                                      style: TextStyle(color: Colors.white),
                                      maxLines: 3,
                                    ),
                                  )
                                ],
                              ))),
                    ),
                    GestureDetector(
                      onTap: () {
                        shouldDisplayTheAd();
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0))),
                            context: context,
                            builder: (context) => Wrap(
                              children: [
                                ModalShowBanner(
                                  cursonome2,
                                  (cursonota2[0].toInt()),
                                  (cursonota2[1].toInt()),
                                  (cursonota2[2].toInt()),
                                  (cursonota2[3].toInt()),
                                  (cursonota2[4].toInt()),
                                  (cursonota2[5].toInt()),
                                  (cursonota2[6].toInt()),
                                  ((((cursonota2.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .floor() <
                                      0
                                      ? 0
                                      : ((((cursonota2.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .floor(),
                                  ((((cursonota2.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round() <
                                      0
                                      ? 0
                                      : ((((cursonota2.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round(),
                                  ((((cursonota2.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round() <
                                      0
                                      ? 0
                                      : ((((cursonota2.cast<double>())
                                      .reduce(max)
                                      .toInt()) -
                                      42) /
                                      9)
                                      .round(),
                                  cursocandidatos2[0],
                                  cursocandidatos2[1],
                                  cursocandidatos2[2],
                                  cursocandidatos2[3],
                                  cursocandidatos2[4],
                                  cursocandidatos2[5],
                                  cursocandidatos2[6],
                                  cursovagas2[0],
                                  cursovagas2[1],
                                  cursovagas2[2],
                                  cursovagas2[3],
                                  cursovagas2[4],
                                  cursovagas2[5],
                                  cursovagas2[6],
                                )
                              ],
                            ));
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 70,
                          margin: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal:
                              MediaQuery.of(context).size.width * 0.011),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(150, 42, 46, 50),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0.0, 10.0))
                              ]),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Color.fromARGB(250, 19, 203, 147),
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "$cursonome2",
                                      style: TextStyle(color: Colors.white),
                                      maxLines: 3,
                                    ),
                                  )
                                ],
                              ))),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class ModalShowBanner extends StatelessWidget {
  final String nome;
  final int quatro;
  final int cinco;
  final int seis;
  final int sete;
  final int oito;
  final int nove;
  final int zero;
  final int primeiroano;
  final int segundoano;
  final int terceiroano;
  final int candidatos4;
  final int candidatos5;
  final int candidatos6;
  final int candidatos7;
  final int candidatos8;
  final int candidatos9;
  final int candidatos0;
  final int vagas4;
  final int vagas5;
  final int vagas6;
  final int vagas7;
  final int vagas8;
  final int vagas9;
  final int vagas0;

  ModalShowBanner(
      this.nome,
      this.quatro,
      this.cinco,
      this.seis,
      this.sete,
      this.oito,
      this.nove,
      this.zero,
      this.primeiroano,
      this.segundoano,
      this.terceiroano,
      this.candidatos4,
      this.candidatos5,
      this.candidatos6,
      this.candidatos7,
      this.candidatos8,
      this.candidatos9,
      this.candidatos0,
      this.vagas4,
      this.vagas5,
      this.vagas6,
      this.vagas7,
      this.vagas8,
      this.vagas9,
      this.vagas0,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.minimize_rounded,
          size: 40,
          color: Colors.white24,
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: Colors.white10,
          height: 0,
          thickness: 1.0,
          indent: 10,
          endIndent: 10,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(40),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                nome,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )),
        SizedBox(
          height: 25,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(40),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Notas de corte",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.width * 0.15,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(40),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quatro.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2014",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cinco.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2015",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        seis.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2016",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sete.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2017",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        oito.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2018",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nove.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2019",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        zero.toString(),
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2020",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(40),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Relação candidatos/vagas",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.width * 0.15,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(40),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${candidatos4.toString()}/${vagas4.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2014",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${candidatos5.toString()}/${vagas5.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2015",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${candidatos6.toString()}/${vagas6.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2016",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${candidatos7.toString()}/${vagas7.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2017",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${candidatos8.toString()}/${vagas8.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2018",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${candidatos9.toString()}/${vagas9.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2019",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${candidatos0.toString()}/${vagas0.toString()}",
                        style: TextStyle(
                            color: Color.fromARGB(250, 0, 82, 75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text("2020",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(40),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Projeção de questões para aprovação",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0.0, 10.0))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1º ano",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(primeiroano.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(250, 0, 82, 75),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0.0, 10.0))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "2º ano",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(segundoano.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(250, 0, 82, 75),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0.0, 10.0))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "3º ano",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(terceiroano.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(250, 0, 82, 75),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0.0, 10.0))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Redação",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text("7",
                          style: TextStyle(
                              color: Color.fromARGB(250, 0, 82, 75),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
