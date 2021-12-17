import 'package:flutter/material.dart';
import 'dias/quarta.dart';
import 'dias/segunda.dart';
import 'dias/terca.dart';
import 'dias/quinta.dart';
import 'dias/sexta.dart';
import 'dias/sabado.dart';
import 'dias/domingo.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class PlanoDeEstudosHome extends StatefulWidget {
  PlanoDeEstudosHome(
      {Key key,
      this.Drawer,
      this.scaffoldKeysegunda,
      this.scaffoldKeyterca,
      this.scaffoldKeyquarta,
      this.scaffoldKeyquinta,
      this.scaffoldKeysexta,
      this.scaffoldKeysabado,
      this.scaffoldKeydomingo
      })
      : super(key: key);

  final Widget Drawer;
  final GlobalKey<ScaffoldState> scaffoldKeysegunda;
  final GlobalKey<ScaffoldState> scaffoldKeyterca;
  final GlobalKey<ScaffoldState> scaffoldKeyquarta;
  final GlobalKey<ScaffoldState> scaffoldKeyquinta;
  final GlobalKey<ScaffoldState> scaffoldKeysexta;
  final GlobalKey<ScaffoldState> scaffoldKeysabado;
  final GlobalKey<ScaffoldState> scaffoldKeydomingo;

  @override
  _PlanoDeEstudosHomeState createState() => _PlanoDeEstudosHomeState();
}

class _PlanoDeEstudosHomeState extends State<PlanoDeEstudosHome> {

  PageController pageController = PageController();

  int dia = 1;

  _DiasDaSemana(){
    if(DateFormat('EEEE').format(DateTime.now()).toString() == "Monday"){
      setState(() {
        dia = 0;
      });
    }
    else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Tuesday"){
      setState(() {
        dia = 1;
      });
    }
    else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Wednesday"){
      setState(() {
        dia = 2;
      });
    }
    else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Thursday"){
      setState(() {
        dia = 3;
      });
    }
    else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Friday"){
      setState(() {
        dia = 4;
      });
    }
    else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Saturday"){
      setState(() {
        dia = 5;
      });
    }
    else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Sunday"){
      setState(() {
        dia = 6;
      });
    }
    else {
      setState(() {
        dia = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this._DiasDaSemana();
    pageController = PageController(
      initialPage: dia
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Segunda(
          scaffoldKey: widget.scaffoldKeysegunda,
          pageController: pageController,
          drawer: widget.Drawer,
        ),
        Terca(
          scaffoldKey: widget.scaffoldKeyterca,
          pageController: pageController,
          drawer: widget.Drawer,
        ),
        Quarta(
          scaffoldKey: widget.scaffoldKeyquarta,
          pageController: pageController,
          drawer: widget.Drawer,
        ),
        Quinta(
          scaffoldKey: widget.scaffoldKeyquinta,
          pageController: pageController,
          drawer: widget.Drawer,
        ),
        Sexta(
          scaffoldKey: widget.scaffoldKeysexta,
          pageController: pageController,
          drawer: widget.Drawer,
        ),
        Sabado(
          scaffoldKey: widget.scaffoldKeysabado,
          pageController: pageController,
          drawer: widget.Drawer,
        ),
        Domingo(
          scaffoldKey: widget.scaffoldKeydomingo,
          pageController: pageController,
          drawer: widget.Drawer,
        ),
      ],
    );
  }
}
