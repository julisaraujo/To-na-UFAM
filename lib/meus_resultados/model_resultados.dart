import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModelResultados extends StatefulWidget {

  ModelResultados({
    Key key,
    this.materia,
    this.assuntoKey,
    this.rightquestionsKey,
    this.allquestionsKey,
    this.controllerassunto,
    this.controllerrightquestions,
    this.controllerallquestions,
    this.list,
    this.icone,
    this.body,
    this.add
  }) : super(key: key);

  final String materia;
  final GlobalKey<FormState> assuntoKey;
  final GlobalKey<FormState> rightquestionsKey;
  final GlobalKey<FormState> allquestionsKey;
  final TextEditingController controllerassunto;
  final TextEditingController controllerrightquestions;
  final TextEditingController controllerallquestions;
  final List list;
  final IconData icone;
  final Widget body;
  final VoidCallback add;

  @override
  _ModelResultadosState createState() => _ModelResultadosState();
}

class _ModelResultadosState extends State<ModelResultados> {

  BannerAd myBanner;

  void startBanner() {
    myBanner = BannerAd(
      adUnitId: "ca-app-pub-3187294347110962/5999582669",
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
        print("BannerAd event is $event");
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
        elevation: 14,
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
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
                                    primaryColor: Colors.white,
                                    primaryColorDark: Colors.blue),
                                child: Form(
                                  key: widget.assuntoKey,
                                  child: TextFormField(
                                    controller: widget.controllerassunto,
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
                                          value == "            " ) {
                                        return "Preencha corretamente";
                                      }
                                      else if(value.length > 50){
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
                                        labelText: "Assunto",
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
                            SizedBox(
                              height: 10,
                            ),
                            Theme(
                                data: ThemeData(
                                    primaryColor: Colors.white,
                                    primaryColorDark: Colors.blue),
                                child: Form(
                                  key: widget.rightquestionsKey,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: widget.controllerrightquestions,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value == "" ||
                                          value == " " ||
                                          value == "  ") {
                                        return "Preencha corretamente";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    maxLength: 2,
                                    decoration: InputDecoration(
                                        errorMaxLines: 2,
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
                                        labelText: "Número de questões certas",
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
                            SizedBox(
                              height: 10,
                            ),
                            Theme(
                                data: ThemeData(
                                    primaryColor: Colors.white,
                                    primaryColorDark: Colors.blue),
                                child: Form(
                                  key: widget.allquestionsKey,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: widget.controllerallquestions,
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value == "" ||
                                          value == " " ||
                                          value == "  ") {
                                        return "Preencha corretamente";
                                      } else if (int.parse(
                                          widget.controllerrightquestions.text) >
                                          int.parse(
                                              widget.controllerallquestions.text)) {
                                        return "O número total de questões deve ser maior ou igual ao de questões certas";
                                      } else if (int.parse(
                                          widget.controllerallquestions.text) ==
                                          0) {
                                        return "Insira um número diferente de zero";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    maxLength: 2,
                                    decoration: InputDecoration(
                                        errorMaxLines: 2,
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
                                        labelText: "Número total de questões",
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
                                    onPressed: widget.add
                                )
                              ],
                            ),
                          ],
                        )),
                  ));
            },
          ),
        ],
      ),
      body: widget.list.length == 0 ?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Você ainda não adicionou seus resultados...",
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
        ),
      ) :
      Container(
        child: widget.body,
      ),
    );
  }
}


class ModelCardResultados extends StatefulWidget {

  ModelCardResultados({
    Key key,
    this.assunto,
    this.rightquestions,
    this.allquestions,
    this.remove
  }) : super(key: key);

  final String assunto;
  final int rightquestions;
  final int allquestions;
  final DismissDirectionCallback remove;

  @override
  _ModelCardResultadosState createState() => _ModelCardResultadosState();
}

class _ModelCardResultadosState extends State<ModelCardResultados> {
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
          decoration: BoxDecoration(
            color: Color.fromARGB(250, 153, 0, 21),
          ),
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete_forever, color: Colors.white),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: ListTile(
                  title: Text(
                    widget.assunto,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  trailing: Container(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.rightquestions}/${widget.allquestions}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${((widget.rightquestions/widget.allquestions)* 100).toInt()}%",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
              ),
            ),
            Divider(
              color: Colors.white12,
              height: 0,
              thickness: 1.0,
              indent: 10,
              endIndent: 10,
            ),
          ],
        )
    );
  }
}