import '../dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DashboardRedacao extends StatefulWidget {
  @override
  _DashboardRedacaoState createState() => _DashboardRedacaoState();
}

class _DashboardRedacaoState extends State<DashboardRedacao> {

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
    return DashBoardRedacao(
      primarycolor: Color.fromARGB(250, 227, 4, 37),
      secondarycolor: Color.fromARGB(100, 227, 4, 37),
      materia: "Redação",
      percent3:(ano3.length == 0) ? 0: (((ano3.where((element) => element["check"] == true)).length) / (ano3.length)),
      variant: (resultados.length == 0 || resultados.length < 2) ? 0 :(((resultados[resultados.length-1]["rightquestions"]/resultados[resultados.length-1]["allquestions"])*100.round()).roundToDouble()-
          ((resultados[resultados.length-2]["rightquestions"]/resultados[resultados.length-2]["allquestions"])*100.round()).roundToDouble()),
      rendimento: resultados.length == 0 ? 0.0
          : ((resultados.map((resultados) => resultados["rightquestions"]).toList().reduce((curr, next) => curr + next)/resultados.map((resultados) => resultados["allquestions"]).toList().reduce((curr, next) => curr + next))*100).roundToDouble(),
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
    final directoryfoldertest = File("${directory.path}/materiasredacao/materiasredacao.json");

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

  Future<File> _getFileano3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/terceiroanoredacao/terceiroanoredacao.json");

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
