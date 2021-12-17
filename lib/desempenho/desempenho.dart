import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'package:to_na_ufam/meus_resultados/home_meus_resultados.dart';
import 'dashboard/dashboard_materias/biologia.dart';
import 'dashboard/dashboard_materias/fisica.dart';
import 'dashboard/dashboard_materias/geografia.dart';
import 'dashboard/dashboard_materias/historia.dart';
import 'dashboard/dashboard_materias/literatura.dart';
import 'dashboard/dashboard_materias/matematica.dart';
import 'dashboard/dashboard_materias/portugues.dart';
import 'dashboard/dashboard_materias/quimica.dart';
import 'dashboard/dashboard_materias/redacao.dart';

class Desempenho extends StatefulWidget {
  Desempenho({Key key, this.scaffoldKey, this.pageController})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  @override
  _DesempenhoState createState() => _DesempenhoState();
}

class _DesempenhoState extends State<Desempenho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        elevation: 0.1,
        title: Text("Desempenho",
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
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
            )
        ),
      ),
      drawer: CustomDrawer(widget.pageController),
      backgroundColor: Color.fromARGB(100, 42, 46, 50),
      body: Container(
        color: Colors.transparent,
        child: ListView(
          padding:
          EdgeInsets.only(top: 0),
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
                            type: PageTransitionType.fade, child: DashboardPortugues()));
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
                            type: PageTransitionType.fade, child: DashboardMatematica()));
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
                            type: PageTransitionType.fade, child: DashboardQuimica()));
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
                            type: PageTransitionType.fade, child: DashboardFisica()));
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
                            type: PageTransitionType.fade, child: DashboardBiologia()));
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
                            type: PageTransitionType.fade, child: DashboardGeografia()));
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
                            type: PageTransitionType.fade, child: DashboardHistoria()));
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
                            type: PageTransitionType.fade, child: DashboardLiteratura()));
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 5
              ),
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
                              type: PageTransitionType.fade, child: DashboardRedacao()));
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

