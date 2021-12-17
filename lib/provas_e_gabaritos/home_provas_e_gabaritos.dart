import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'package:to_na_ufam/notas_de_corte/home_notas_corte.dart';
import 'package:to_na_ufam/provas_e_gabaritos/ufam_psc.dart';
import 'package:firebase_admob/firebase_admob.dart';


class HomeProvasEGabaritos extends StatefulWidget {

  HomeProvasEGabaritos({Key key, this.scaffoldKey, this.pageController})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  @override
  _HomeProvasEGabaritosState createState() => _HomeProvasEGabaritosState();
}

class _HomeProvasEGabaritosState extends State<HomeProvasEGabaritos> {

  InterstitialAd _interstitialAd;


  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-3187294347110962/3821169555",
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
        title: Text("Provas e Gabaritos",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
            )
        ),
        leading: IconButton(
          icon: Icon(Icons.menu,
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
                        type: PageTransitionType.fade, child: PscUfam()));
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
