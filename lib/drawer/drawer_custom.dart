import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'ajuda.dart';
import 'drawer_interface.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 14,
      child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      color: Colors.transparent,
                      child: Image.asset("assets/tucano.png"),
                    ),
                    Expanded(
                      child: Container(
                          color: Colors.transparent,
                          child: ProfileDrawer()),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(250, 28, 34, 34),
                ),
              ),
              DrawerInterface(Icons.home, "Home", pageController, 0),
              DrawerInterface(
                  Icons.calendar_today, "Plano de estudos", pageController, 1),
              DrawerInterface(Icons.attach_file, "Matérias", pageController, 2),
              DrawerInterface(Icons.rule, "Meus resultados", pageController, 3),
              DrawerInterface(Icons.insert_chart_outlined_rounded, "Desempenho",
                  pageController, 4),
              DrawerInterface(
                  Icons.equalizer, "Notas de corte", pageController, 5),
              DrawerInterface(
                  Icons.library_books, "Provas e gabaritos", pageController, 6),
              DrawerInterface(Icons.account_circle_outlined, "Meu Perfil",
                  pageController, 7),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(10, 218, 221, 224),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help_outline_outlined,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Ajuda",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Ajuda()));
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }
}

class ProfileDrawer extends StatefulWidget {
  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  List encodelist = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _readData().then((data) {
        setState(() {
          if (data.isNotEmpty) {
            encodelist = jsonDecode(data);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          encodelist.length == 0
              ? "Olá, estudante"
              : "${encodelist[encodelist.length - 1]["nome"]}",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          encodelist.length == 0
              ? "Atualize seus dados na aba Meu Perfil"
              : "${encodelist[encodelist.length - 1]["curso"]}",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white60),
        ),
      ],
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

  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
