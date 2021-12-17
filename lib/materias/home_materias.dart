import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'package:to_na_ufam/materias/primeiroano/bio.dart';
import 'package:to_na_ufam/materias/primeiroano/fis.dart';
import 'package:to_na_ufam/materias/primeiroano/geo.dart';
import 'package:to_na_ufam/materias/primeiroano/hist.dart';
import 'package:to_na_ufam/materias/primeiroano/lit.dart';
import 'package:to_na_ufam/materias/primeiroano/mat.dart';
import 'package:to_na_ufam/materias/primeiroano/quim.dart';
import 'package:to_na_ufam/materias/segundoano/bio.dart';
import 'package:to_na_ufam/materias/segundoano/fis.dart';
import 'package:to_na_ufam/materias/segundoano/mat.dart';
import 'package:to_na_ufam/materias/segundoano/port.dart';
import 'package:to_na_ufam/materias/segundoano/quim.dart';
import 'package:to_na_ufam/materias/terceiroano/bio.dart';
import 'package:to_na_ufam/materias/terceiroano/fis.dart';
import 'package:to_na_ufam/materias/terceiroano/mat.dart';
import 'package:to_na_ufam/materias/terceiroano/port.dart';
import 'primeiroano/port.dart';
import 'terceiroano/redacao.dart';
import 'segundoano/geo.dart';
import 'segundoano/hist.dart';
import 'segundoano/lit.dart';
import 'terceiroano/geo.dart';
import 'terceiroano/hist.dart';
import 'terceiroano/lit.dart';
import 'terceiroano/quim.dart';

class HomeMaterias extends StatefulWidget {
  HomeMaterias({Key key, this.scaffoldKey, this.pageController})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  @override
  _HomeMateriasState createState() => _HomeMateriasState();
}

class _HomeMateriasState extends State<HomeMaterias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        elevation: 0.1,
        title: Text("Matérias",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 25,
          ),
          onPressed: () => widget.scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: CustomDrawer(widget.pageController),
      backgroundColor: Color.fromARGB(100, 42, 46, 50),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(
                            MediaQuery.of(context).size.height * 0.04)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 10,
                          offset: Offset(0.0, 35.0))
                    ],
                  ),
                  child: Material(
                    elevation: 14,
                    color: Color.fromARGB(150, 42, 46, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(40))),
                    child: TabBar(
                      indicatorWeight: 2.5,
                      indicatorPadding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.04,
                          right: MediaQuery.of(context).size.height * 0.04),
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.white,
                      unselectedLabelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      labelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      tabs: <Widget>[
                        Tab(
                          text: '1º ano',
                        ),
                        Tab(
                          text: '2º ano',
                        ),
                        Tab(
                          text: '3º ano',
                        )
                      ],
                    ),
                  )),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: ListView(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Português",
                                  MaterialCommunityIcons.alphabetical,
                                  Color.fromARGB(250, 59, 38, 186),
                                  Color.fromARGB(40, 59, 38, 186),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Port1()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Matemática",
                                  MaterialCommunityIcons.pi_box,
                                  Color.fromARGB(250, 253, 110, 33),
                                  Color.fromARGB(40, 253, 110, 33),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Mat1()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Química",
                                  MaterialCommunityIcons.flask,
                                  Color.fromARGB(250, 255, 20, 151),
                                  Color.fromARGB(40, 255, 20, 151),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Quim1()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Física",
                                  MaterialCommunityIcons.atom,
                                  Color.fromARGB(250, 255, 255, 10),
                                  Color.fromARGB(40, 255, 255, 10),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Fis1()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Biologia",
                                  MaterialCommunityIcons.bacteria_outline,
                                  Color.fromARGB(250, 19, 203, 147),
                                  Color.fromARGB(40, 19, 203, 147),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Bio1()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Geografia",
                                  MaterialCommunityIcons.earth,
                                  Color.fromARGB(250, 57, 186, 255),
                                  Color.fromARGB(40, 57, 186, 255),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Geo1()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "História",
                                  MaterialCommunityIcons.pillar,
                                  Color.fromARGB(250, 130, 253, 0),
                                  Color.fromARGB(40, 130, 253, 0),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Hist1()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Literatura",
                                  MaterialCommunityIcons.drama_masks,
                                  Color.fromARGB(250, 174, 59, 241),
                                  Color.fromARGB(40, 174, 59, 241),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Lit1()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Português",
                                  MaterialCommunityIcons.alphabetical,
                                  Color.fromARGB(250, 59, 38, 186),
                                  Color.fromARGB(40, 59, 38, 186),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Port2()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Matemática",
                                  MaterialCommunityIcons.pi_box,
                                  Color.fromARGB(250, 253, 110, 33),
                                  Color.fromARGB(40, 253, 110, 33),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Mat2()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Química",
                                  MaterialCommunityIcons.flask,
                                  Color.fromARGB(250, 255, 20, 151),
                                  Color.fromARGB(40, 255, 20, 151),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Quim2()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Física",
                                  MaterialCommunityIcons.atom,
                                  Color.fromARGB(250, 255, 255, 10),
                                  Color.fromARGB(40, 255, 255, 10),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Fis2()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Biologia",
                                  MaterialCommunityIcons.bacteria_outline,
                                  Color.fromARGB(250, 19, 203, 147),
                                  Color.fromARGB(40, 19, 203, 147),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Bio2()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Geografia",
                                  MaterialCommunityIcons.earth,
                                  Color.fromARGB(250, 57, 186, 255),
                                  Color.fromARGB(40, 57, 186, 255),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Geo2()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "História",
                                  MaterialCommunityIcons.pillar,
                                  Color.fromARGB(250, 130, 253, 0),
                                  Color.fromARGB(40, 130, 253, 0),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Hist2()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Literatura",
                                  MaterialCommunityIcons.drama_masks,
                                  Color.fromARGB(250, 174, 59, 241),
                                  Color.fromARGB(40, 174, 59, 241),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Lit2()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Português",
                                  MaterialCommunityIcons.alphabetical,
                                  Color.fromARGB(250, 59, 38, 186),
                                  Color.fromARGB(40, 59, 38, 186),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Port3()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Matemática",
                                  MaterialCommunityIcons.pi_box,
                                  Color.fromARGB(250, 253, 110, 33),
                                  Color.fromARGB(40, 253, 110, 33),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Mat3()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Química",
                                  MaterialCommunityIcons.flask,
                                  Color.fromARGB(250, 255, 20, 151),
                                  Color.fromARGB(40, 255, 20, 151),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Quim3()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Física",
                                  MaterialCommunityIcons.atom,
                                  Color.fromARGB(250, 255, 255, 10),
                                  Color.fromARGB(40, 255, 255, 10),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Fis3()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "Biologia",
                                  MaterialCommunityIcons.bacteria_outline,
                                  Color.fromARGB(250, 19, 203, 147),
                                  Color.fromARGB(40, 19, 203, 147),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Bio3()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Geografia",
                                  MaterialCommunityIcons.earth,
                                  Color.fromARGB(250, 57, 186, 255),
                                  Color.fromARGB(40, 57, 186, 255),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Geo3()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: CardMaterias(
                                  "História",
                                  MaterialCommunityIcons.pillar,
                                  Color.fromARGB(250, 130, 253, 0),
                                  Color.fromARGB(40, 130, 253, 0),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Hist3()));
                                },
                              ),
                              GestureDetector(
                                child: CardMaterias(
                                  "Literatura",
                                  MaterialCommunityIcons.drama_masks,
                                  Color.fromARGB(250, 174, 59, 241),
                                  Color.fromARGB(40, 174, 59, 241),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: Lit3()));
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: CardMaterias(
                                    "Redação",
                                    FlutterIcons.book_faw,
                                    Color.fromARGB(250, 227, 4, 37),
                                    Color.fromARGB(100, 227, 4, 37),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Redacao3()));
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class CardMaterias extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color coloricon;
  final Color colorconstraste;

  CardMaterias(this.title, this.icon, this.coloricon, this.colorconstraste);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.172,
      width: MediaQuery.of(context).size.width * 0.45,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 7.5),
      decoration: BoxDecoration(
        color: Color.fromARGB(150, 42, 46, 50),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black38, blurRadius: 10, offset: Offset(-1.0, 5.0))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: MediaQuery.of(context).size.height * 0.055,
            color: coloricon,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: colorconstraste,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "$title",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
