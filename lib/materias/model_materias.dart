import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ModelMaterias extends StatefulWidget {
  ModelMaterias(
      {Key key,
        this.materia,
        this.titleKey,
        this.subtitleKey,
        this.controllertitle,
        this.controllersubtitle,
        this.add,
        this.list,
        this.istrue,
        this.all,
        this.icone,
        this.body})
      : super(key: key);

  final String materia;
  final GlobalKey<FormState> titleKey;
  final GlobalKey<FormState> subtitleKey;
  final TextEditingController controllertitle;
  final TextEditingController controllersubtitle;
  final VoidCallback add;
  final List list;
  final int istrue;
  final int all;
  final IconData icone;
  final Widget body;

  @override
  _ModelMateriasState createState() => _ModelMateriasState();
}

class _ModelMateriasState extends State<ModelMaterias> {

  BannerAd myBanner;
  int clicks = 0;

  void startBanner() {
    myBanner = BannerAd(
      adUnitId: "ca-app-pub-3187294347110962/3774790292",
      size: AdSize.fullBanner,
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
          'direito'
        ],
        contentUrl: 'https://flutter.io',
        childDirected: false,
      ),
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened) {
        }
      },
    );
  }

  void displayBanner() {
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  void dispose() {
    myBanner?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3187294347110962~7379278793");

    startBanner();
    displayBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(100, 42, 46, 50),
        appBar: AppBar(
          elevation: 0.1,
          title: Text(widget.materia,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Color.fromARGB(150, 42, 46, 50),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
            iconSize: 20,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
                  backgroundColor: Color.fromARGB(250, 28, 34, 34),
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Theme(
                              data: ThemeData(
                                  primaryColor:
                                  Color.fromARGB(150, 42, 46, 50),
                                  primaryColorDark:
                                  Color.fromARGB(150, 42, 46, 50)),
                              child: Form(
                                key: widget.titleKey,
                                child: TextFormField(
                                  controller: widget.controllertitle,
                                  validator: (value) {
                                    if (value.isEmpty ||
                                        value == "" ||
                                        value == " " ||
                                        value == "  " ||
                                        value == "   " ||
                                        value == "    " ||
                                        value == "     " ||
                                        value == "      " ||
                                        value == "       " ||
                                        value == "        " ||
                                        value == "         " ||
                                        value == "          " ||
                                        value == "           " ||
                                        value == "            " ||
                                        value == "             " ||
                                        value == "              " ||
                                        value == "               " ||
                                        value == "                " ||
                                        value == "                 " ||
                                        value == "                  " ||
                                        value == "                   " ||
                                        value == "                    " ||
                                        value == "                     " ||
                                        value == "                      " ||
                                        value ==
                                            "                       " ||
                                        value ==
                                            "                        ") {
                                      return "Preencha corretamente";
                                    } else if (value.length > 50) {
                                      return "O número de caracteres não pode ser maior que 50";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  maxLength: 50,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Color(0xff13d38e)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.white),
                                      ),
                                      counterStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      labelText: "Título",
                                      labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  autofocus: true,
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Theme(
                              data: ThemeData(
                                  primaryColor: Colors.white,
                                  primaryColorDark: Colors.blue),
                              child: Form(
                                key: widget.subtitleKey,
                                child: TextFormField(
                                  controller: widget.controllersubtitle,
                                  validator: (value) {
                                    if (value.isEmpty ||
                                        value == "" ||
                                        value == " " ||
                                        value == "  " ||
                                        value == "   " ||
                                        value == "    " ||
                                        value == "     " ||
                                        value == "      " ||
                                        value == "       " ||
                                        value == "        " ||
                                        value == "         " ||
                                        value == "          " ||
                                        value == "           " ||
                                        value == "            " ||
                                        value == "             " ||
                                        value == "              " ||
                                        value == "               " ||
                                        value == "                " ||
                                        value == "                 " ||
                                        value == "                  " ||
                                        value == "                   " ||
                                        value == "                    " ||
                                        value == "                     " ||
                                        value == "                      " ||
                                        value == "                       " ||
                                        value == "                        ") {
                                      return "Preencha corretamente";
                                    } else if (value.length > 50) {
                                      return "O número de caracteres não pode ser maior que 50";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  maxLength: 50,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Color(0xff13d38e)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.white),
                                      ),
                                      counterStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      labelText: "Subtítulo",
                                      labelStyle: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                      border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  autofocus: true,
                                ),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                  child: Icon(
                                    Icons.check,
                                    color: Color(0xff13d38e),
                                    size: 30,
                                  ),
                                  onPressed: widget.add),
                            ],
                          ),
                        ],
                      ),),
                  ),
                );
              },
            )
          ],
        ),
        extendBodyBehindAppBar: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              elevation: 14,
              color: Color.fromARGB(150, 42, 46, 50),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(40))),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 10,
                          offset: Offset(0.0, 0.0))
                    ],
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.65,
                      animation: true,
                      animationDuration: 1000,
                      animateFromLastPercent: true,
                      alignment: MainAxisAlignment.center,
                      lineHeight: 9,
                      trailing: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 40,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      widget.list.length == 0
                                          ? "0%"
                                          : "${((widget.istrue / widget.all) * 100).round()}%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 1),
                                  child: Container(
                                    height: 40,
                                    width: 50,
                                    child: Center(
                                      child: Text(
                                        "${widget.istrue}/"
                                            "${widget.all}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                      percent: widget.list.length == 0
                          ? 0.0
                          : (widget.istrue / widget.all),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.white,
                      backgroundColor: Color.fromARGB(250, 42, 46, 50),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: widget.list.length == 0
                    ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Você não possui assuntos para estudar...",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          widget.icone,
                          size: 40,
                          color: Colors.grey,
                        )
                      ],
                    ))
                    : widget.body)
          ],
        ));
  }
}

class ModelMateriasCard extends StatefulWidget {
  ModelMateriasCard(
      {Key key,
        this.subtitulo,
        this.titulo,
        this.check,
        this.remove,
        this.save})
      : super(key: key);

  final String subtitulo;
  final String titulo;
  final bool check;
  final DismissDirectionCallback remove;
  final ValueChanged<bool> save;

  @override
  _ModelMateriasCardState createState() => _ModelMateriasCardState();
}

class _ModelMateriasCardState extends State<ModelMateriasCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        direction: DismissDirection.startToEnd,
        onDismissed: widget.remove,
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          decoration: BoxDecoration(color: Color.fromARGB(250, 153, 0, 21)),
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete_forever, color: Colors.white),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ListTile(
                  title: Text(
                    widget.subtitulo,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(200, 165, 165, 175)),
                  ),
                  subtitle: Padding(
                      padding: EdgeInsets.only(top: 7, bottom: 7),
                      child: Text(
                        widget.titulo,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  trailing: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: widget.check == true
                            ? Colors.transparent
                            : Colors.white24,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.transparent,
                          ),
                          child: Checkbox(
                            value: widget.check,
                            checkColor: Colors.green,
                            activeColor: widget.check == true
                                ? Colors.transparent
                                : Colors.transparent,
                            onChanged: widget.save,
                          ),
                        )),
                  )),
            ),
            Divider(
              color: Colors.white12,
              height: 0,
              thickness: 1.0,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ));
  }
}
