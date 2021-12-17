import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'materias/bio.dart';
import 'materias/fis.dart';
import 'materias/geo.dart';
import 'materias/hist.dart';
import 'materias/lit.dart';
import 'materias/mat.dart';
import 'materias/port.dart';
import 'materias/quim.dart';
import 'materias/redacao.dart';

class HomeMeusResultados extends StatefulWidget {
  HomeMeusResultados({Key key, this.scaffoldKey, this.pageController})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  @override
  _HomeMeusResultadosState createState() => _HomeMeusResultadosState();
}

class _HomeMeusResultadosState extends State<HomeMeusResultados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        elevation: 14,
        title: Text("Meus Resultados",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 25,
          ),
          onPressed: () => widget.scaffoldKey.currentState.openDrawer(),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      backgroundColor: Color.fromARGB(100, 42, 46, 50),
      drawer: CustomDrawer(widget.pageController),
      body: Container(
        color: Colors.transparent,
        child: ListView(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: CardResultados(
                    "Português",
                    MaterialCommunityIcons.alphabetical,
                    Color.fromARGB(250, 59, 38, 186),
                    Color.fromARGB(40, 59, 38, 186),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Portugues()));
                  },
                ),
                GestureDetector(
                  child: CardResultados(
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
                            child: Matematica()));
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: CardResultados(
                    "Química",
                    MaterialCommunityIcons.flask,
                    Color.fromARGB(250, 255, 20, 151),
                    Color.fromARGB(40, 255, 20, 151),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Quimica()));
                  },
                ),
                GestureDetector(
                  child: CardResultados(
                    "Física",
                    MaterialCommunityIcons.atom,
                    Color.fromARGB(250, 255, 255, 10),
                    Color.fromARGB(40, 255, 255, 10),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Fisica()));
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: CardResultados(
                    "Biologia",
                    MaterialCommunityIcons.bacteria_outline,
                    Color.fromARGB(250, 19, 203, 147),
                    Color.fromARGB(40, 19, 203, 147),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Biologia()));
                  },
                ),
                GestureDetector(
                  child: CardResultados(
                    "Geografia",
                    MaterialCommunityIcons.earth,
                    Color.fromARGB(250, 57, 186, 255),
                    Color.fromARGB(40, 57, 186, 255),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Geografia()));
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: CardResultados(
                    "História",
                    MaterialCommunityIcons.pillar,
                    Color.fromARGB(250, 130, 253, 0),
                    Color.fromARGB(40, 130, 253, 0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Historia()));
                  },
                ),
                GestureDetector(
                  child: CardResultados(
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
                            child: Literatura()));
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
                    child: CardResultados(
                      "Redação",
                      FlutterIcons.book_faw,
                      Color.fromARGB(250, 227, 4, 37),
                      Color.fromARGB(100, 227, 4, 37),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: Redacao()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardResultados extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color coloricon;
  final Color colorconstraste;

  CardResultados(this.title, this.icon, this.coloricon, this.colorconstraste);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.175,
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

