import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'ufam_psc.dart';
import 'package:firebase_admob/firebase_admob.dart';

class HomeNotasDeCorte extends StatefulWidget {
  HomeNotasDeCorte({Key key, this.scaffoldKey, this.pageController})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  @override
  _HomeNotasDeCorteState createState() => _HomeNotasDeCorteState();
}

class _HomeNotasDeCorteState extends State<HomeNotasDeCorte> {

  InterstitialAd _interstitialAd;


  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-3187294347110962/3542856007",
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
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-3187294347110962~7379278793");
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        elevation: 14,
        title: Text("Notas de corte",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
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
      body: Container(
        color: Colors.transparent,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                _interstitialAd?.dispose();
                _interstitialAd = createInterstitialAd()..load();
                _interstitialAd?.show();
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: UfamPSC()));
              },
              child: CardNC(
                  "PSC",
                  "O Processo Seletivo Contínuo (PSC) é a forma de ingresso estabelecida pela Universidade Federal do Amazonas com seleção feita em avaliação seriada e contínua nas três séries do ensino médio.",
                  AssetImage("assets/ufam.jpg")),
            ),
          ],
        ),
      ),
    );
  }
}

class CardNC extends StatelessWidget {
  final String title;
  final String subtitle;
  final AssetImage universityIcon;

  CardNC(this.title, this.subtitle, this.universityIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Stack(
        children: [
          Container(
            width: 500,
            margin: EdgeInsets.only(left: 45),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(150, 42, 46, 50),
                    Color.fromARGB(150, 42, 46, 50),
                    Color.fromARGB(150, 42, 46, 50),
                    Color.fromARGB(150, 42, 46, 50),
                    Color.fromARGB(50, 42, 46, 50),
                  ]),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(-1.0, 5.0))
              ],
            ),
            child: Container(
                margin: EdgeInsets.only(left: 55,
                    right: 10,bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(subtitle,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              alignment: FractionalOffset.centerLeft,
              child: Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                        offset: Offset(-10.0, 10.0))
                  ],
                  shape: BoxShape.circle,
                  image:
                  DecorationImage(fit: BoxFit.cover, image: universityIcon),
                ),
              ))
        ],
      ),
    );
  }
}
