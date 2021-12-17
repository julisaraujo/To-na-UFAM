import 'package:flutter/material.dart';
import 'package:to_na_ufam/desempenho/desempenho.dart';
import 'package:to_na_ufam/drawer/drawer_custom.dart';
import 'package:to_na_ufam/home_page/home.dart';
import 'package:to_na_ufam/materias/home_materias.dart';
import 'package:to_na_ufam/meus_resultados/home_meus_resultados.dart';
import 'package:to_na_ufam/notas_de_corte/home_notas_corte.dart';
import 'package:to_na_ufam/plano_de_estudos/plano_de_estudos_home.dart';
import 'package:to_na_ufam/profile/profile_edit.dart';
import 'package:to_na_ufam/provas_e_gabaritos/home_provas_e_gabaritos.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKeyHome = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeymaterias = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyNotasDeCorte = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyMeusResultados = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyMeuDesempenho = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyProvaseGabaritos = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyMeuPerfil = new GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldState> _scaffoldKeysegunda = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyterca = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyquarta = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyquinta = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeysexta = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeysabado = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeydomingo = new GlobalKey<ScaffoldState>();

  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Home(
          scaffoldkey: _scaffoldKeyHome,
          pageController: pageController,
        ),
        PlanoDeEstudosHome(
          Drawer: CustomDrawer(pageController),
          scaffoldKeysegunda: _scaffoldKeysegunda,
          scaffoldKeyterca: _scaffoldKeyterca,
          scaffoldKeyquarta: _scaffoldKeyquarta,
          scaffoldKeyquinta: _scaffoldKeyquinta,
          scaffoldKeysexta: _scaffoldKeysexta,
          scaffoldKeysabado: _scaffoldKeysabado,
          scaffoldKeydomingo: _scaffoldKeydomingo,
        ),
        HomeMaterias(
          scaffoldKey: _scaffoldKeymaterias,
          pageController: pageController,
        ),
        HomeMeusResultados(
          scaffoldKey: _scaffoldKeyMeusResultados,
          pageController: pageController,
        ),
        Desempenho(
          scaffoldKey: _scaffoldKeyMeuDesempenho,
          pageController: pageController,
        ),
        HomeNotasDeCorte(
          scaffoldKey: _scaffoldKeyNotasDeCorte,
          pageController: pageController,
        ),
        HomeProvasEGabaritos(
          scaffoldKey: _scaffoldKeyProvaseGabaritos,
          pageController: pageController,
        ),
        ProfileEdit(
          scaffoldKey: _scaffoldKeyMeuPerfil,
          pageController: pageController,
        )
      ],
    );
  }
}
