import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class InfoDay extends StatefulWidget {

  @override
  _InfoDayState createState() => _InfoDayState();
}

class _InfoDayState extends State<InfoDay> {

  StatefulWidget widgetday;

  @override
  void initState() {
    super.initState();
    this._DiasDaSemana();
  }

  _DiasDaSemana(){
    setState(() {
      if(DateFormat('EEEE').format(DateTime.now()).toString() == "Monday"){
        setState(() {
          widgetday = Segunda();
        });
      }
      else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Tuesday"){
        setState(() {
          widgetday = Terca();
        });
      }
      else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Wednesday"){
        setState(() {
          widgetday = Quarta();
        });
      }
      else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Thursday"){
        setState(() {
          widgetday = Quinta();
        });
      }
      else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Friday"){
        setState(() {
          widgetday = Sexta();
        });
      }
      else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Saturday"){
        setState(() {
          widgetday = Sabado();
        });
      }
      else if(DateFormat('EEEE').format(DateTime.now()).toString() == "Sunday"){
        setState(() {
          widgetday = Domingo();
        });
      }
      else {
        setState(() {
          widgetday = Segunda();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(250, 28, 34, 34),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Tags de hoje",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.bookmark_rounded,
                    color: Colors.white ,)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                height: 96,
                color: Colors.transparent,
                child: widgetday
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Segunda extends StatefulWidget {
  @override
  _SegundaState createState() => _SegundaState();
}

class _SegundaState extends State<Segunda> {
  List listday = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          listday = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return listday.length == 0 ?
    Center(
        child: Text("Você ainda não adicionou tags para a segunda-feira",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),)
    ) :
    Text("${listday.map((listday) => listday["nametag"]).toList().toSet().toList().join(',')}",
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white60
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/segunda/segunda.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
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


class Terca extends StatefulWidget {
  @override
  _TercaState createState() => _TercaState();
}

class _TercaState extends State<Terca> {
  List listday = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          listday = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return listday.length == 0 ?
    Center(
        child: Text("Você ainda não adicionou tags para a terça-feira",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),)
    ) :
    Text("${listday.map((listday) => listday["nametag"]).toList().toSet().toList().join(',')}",
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white60
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/terca/terca.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
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


class Quarta extends StatefulWidget {
  @override
  _QuartaState createState() => _QuartaState();
}

class _QuartaState extends State<Quarta> {
  List listday = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          listday = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return listday.length == 0 ?
    Center(
        child: Text("Você ainda não adicionou tags para a quarta-feira",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),)
    ) :
    Text("${listday.map((listday) => listday["nametag"]).toList().toSet().toList().join(',')}",
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white60
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/quarta/quarta.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
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

class Quinta extends StatefulWidget {
  @override
  _QuintaState createState() => _QuintaState();
}

class _QuintaState extends State<Quinta> {
  List listday = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          listday = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return listday.length == 0 ?
    Center(
        child: Text("Você ainda não adicionou tags para a quinta-feira",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),)
    ) :
    Text("${listday.map((listday) => listday["nametag"]).toList().toSet().toList().join(',')}",
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white60
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/quinta/quinta.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
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

class Sexta extends StatefulWidget {
  @override
  _SextaState createState() => _SextaState();
}

class _SextaState extends State<Sexta> {
  List listday = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          listday = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return listday.length == 0 ?
    Center(
        child: Text("Você ainda não adicionou tags para a sexta-feira",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),)
    ) :
    Text("${listday.map((listday) => listday["nametag"]).toList().toSet().toList().join(',')}",
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white60
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/sexta/sexta.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
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

class Sabado extends StatefulWidget {
  @override
  _SabadoState createState() => _SabadoState();
}

class _SabadoState extends State<Sabado> {
  List listday = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          listday = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return listday.length == 0 ?
    Center(
        child: Text("Você ainda não adicionou tags para o sábado",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),)
    ) :
    Text("${listday.map((listday) => listday["nametag"]).toList().toSet().toList().join(',')}",
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white60
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/sabado/sabado.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
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

class Domingo extends StatefulWidget {
  @override
  _DomingoState createState() => _DomingoState();
}

class _DomingoState extends State<Domingo> {
  List listday = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        if(data.isNotEmpty){
          listday = jsonDecode(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return listday.length == 0 ?
    Center(
        child: Text("Você ainda não adicionou tags para o domingo",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),)
    ) :
    Text("${listday.map((listday) => listday["nametag"]).toList().toSet().toList().join(',')}",
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 6,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white60
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/domingo/domingo.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(
          recursive: true);
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