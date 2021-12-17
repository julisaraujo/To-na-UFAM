import 'package:flutter/material.dart';
import '../dashboard.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DashboardQuimica extends StatefulWidget {
  @override
  _DashboardQuimicaState createState() => _DashboardQuimicaState();
}

class _DashboardQuimicaState extends State<DashboardQuimica> {

  List resultados = [];
  List ano1 = [];
  List ano2 = [];
  List ano3 = [];

  @override
  void initState() {
    super.initState();
    _readDataresultados().then((data) {
      setState(() {
        if(data.isNotEmpty){
          resultados = jsonDecode(data);
        }
      });
    });
    _readDataano1().then((data) {
      setState(() {
        if(data.isNotEmpty){
          ano1 = jsonDecode(data);
        }
      });
    });
    _readDataano2().then((data) {
      setState(() {
        if(data.isNotEmpty){
          ano2 = jsonDecode(data);
        }
      });
    });
    _readDataano3().then((data) {
      setState(() {
        if(data.isNotEmpty){
          ano3 = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashBoard(
      primarycolor: Color.fromARGB(250, 255, 20, 151),
      secondarycolor: Color.fromARGB(40, 255, 20, 151),
      materia: "Química",
      percent1:(ano1.length == 0) ? 0: (((ano1.where((element) => element["check"] == true)).length) / (ano1.length)),
      percent2: (ano2.length == 0) ? 0: (((ano2.where((element) => element["check"] == true)).length) / (ano2.length)),
      percent3:(ano3.length == 0) ? 0: (((ano3.where((element) => element["check"] == true)).length) / (ano3.length)),
      variant: (resultados.length == 0 || resultados.length < 2) ? 0 :(((resultados[resultados.length-1]["rightquestions"]/resultados[resultados.length-1]["allquestions"])*100.round()).roundToDouble()-
          ((resultados[resultados.length-2]["rightquestions"]/resultados[resultados.length-2]["allquestions"])*100.round()).roundToDouble()),
      rendimento: resultados.length == 0 ? 0
          : ((resultados.map((resultados) => resultados["rightquestions"]).toList().reduce((curr, next) => curr + next)/resultados.map((resultados) => resultados["allquestions"]).toList().reduce((curr, next) => curr + next))*100).round(),
      x1: (resultados.length == 0 || resultados.length < 10) ? 0 :((resultados[resultados.length-10]["rightquestions"]/resultados[resultados.length-10]["allquestions"])*100.round()).roundToDouble(),
      x2: (resultados.length == 0 || resultados.length < 9) ? 0 :((resultados[resultados.length-9]["rightquestions"]/resultados[resultados.length-9]["allquestions"])*100.round()).roundToDouble(),
      x3: (resultados.length == 0 || resultados.length < 8) ? 0 :((resultados[resultados.length-8]["rightquestions"]/resultados[resultados.length-8]["allquestions"])*100.round()).roundToDouble(),
      x4: (resultados.length == 0 || resultados.length < 7) ? 0 :((resultados[resultados.length-7]["rightquestions"]/resultados[resultados.length-7]["allquestions"])*100.round()).roundToDouble(),
      x5: (resultados.length == 0 || resultados.length < 6) ? 0 :((resultados[resultados.length-6]["rightquestions"]/resultados[resultados.length-6]["allquestions"])*100.round()).roundToDouble(),
      x6: (resultados.length == 0 || resultados.length < 5) ? 0 :((resultados[resultados.length-5]["rightquestions"]/resultados[resultados.length-5]["allquestions"])*100.round()).roundToDouble(),
      x7: (resultados.length == 0 || resultados.length < 4) ? 0 :((resultados[resultados.length-4]["rightquestions"]/resultados[resultados.length-4]["allquestions"])*100.round()).roundToDouble(),
      x8: (resultados.length == 0 || resultados.length < 3) ? 0 :((resultados[resultados.length-3]["rightquestions"]/resultados[resultados.length-3]["allquestions"])*100.round()).roundToDouble(),
      x9: (resultados.length == 0 || resultados.length < 2) ? 0 :((resultados[resultados.length-2]["rightquestions"]/resultados[resultados.length-2]["allquestions"])*100.round()).roundToDouble(),
      x10:(resultados.length == 0 || resultados.length < 1) ? 0 :((resultados[resultados.length-1]["rightquestions"]/resultados[resultados.length-1]["allquestions"])*100.round()).roundToDouble(),
    );
  }
  Future<File> _getFileresultados() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/materiasquimica/materiasquimica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataresultados() async {
    try {
      final file = await _getFileresultados();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileano1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/primeiroanoquimica/primeiroanoquimica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
      return directoryfoldertest2.absolute;
    }
  }
  Future<String> _readDataano1() async {
    try {
      final file = await _getFileano1();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileano2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/segundoanoquimica/segundoanoquimica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
      return directoryfoldertest2.absolute;
    }
  }
  Future<String> _readDataano2() async {
    try {
      final file = await _getFileano2();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _getFileano3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/terceiroanoquimica/terceiroanoquimica.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
      return directoryfoldertest2.absolute;
    }
  }
  Future<String> _readDataano3() async {
    try {
      final file = await _getFileano3();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}