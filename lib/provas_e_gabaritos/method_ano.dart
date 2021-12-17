import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MethodAno extends StatefulWidget {
  MethodAno({
    Key key,
    this.ano,
    this.prova1ano,
    this.prova2ano,
    this.prova3ano,
    this.share1anoprova,
    this.share2anoprova,
    this.share3anoprova,
    this.share1anogabarito,
    this.share2anogabarito,
    this.share3anogabarito,
  }) : super(key: key);

  final String ano;
  final Widget prova1ano;
  final Widget prova2ano;
  final Widget prova3ano;
  final VoidCallback share1anoprova;
  final VoidCallback share2anoprova;
  final VoidCallback share3anoprova;
  final VoidCallback share1anogabarito;
  final VoidCallback share2anogabarito;
  final VoidCallback share3anogabarito;

  @override
  _MethodAnoState createState() => _MethodAnoState();
}

class _MethodAnoState extends State<MethodAno> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        tileColor: Colors.transparent,
        title: Text(
          widget.ano,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 14,
                    title: Text(widget.ano,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    backgroundColor: Color.fromARGB(150, 42, 46, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  body: Container(
                    child: ListView(
                      children: ListTile.divideTiles(
                          context: context,
                          color: Colors.white24,
                          tiles: [
                            GestureDetector(
                              child: ListTile(
                                title: Text(
                                  "1º ano",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: Scaffold(
                                          backgroundColor: Colors.white,
                                          appBar: AppBar(
                                            elevation: 14,
                                            title: Text(
                                                "Prova 1º ano ${widget.ano}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                            backgroundColor:
                                                Color.fromARGB(250, 28, 34, 34),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        bottom: Radius.circular(
                                                            30))),
                                            leading: IconButton(
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            actions: [
                                              Theme(
                                                data: ThemeData(
                                                  cardColor: Color.fromARGB(250, 28, 34, 34),
                                                ),
                                                child: PopupMenuButton(
                                                  icon: Icon(Icons.link,color: Colors.white,),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      child: GestureDetector(
                                                        child: Text("Compartilhar Prova",style: TextStyle(color: Colors.white),),
                                                        onTap: widget.share1anoprova,
                                                      ),
                                                      value: 0,
                                                    ),
                                                    PopupMenuItem(
                                                      child: GestureDetector(
                                                        child: Text("Compartilhar Gabarito",style: TextStyle(color: Colors.white)),
                                                        onTap: widget.share1anogabarito,
                                                      ),
                                                      value: 1,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          body: widget.prova1ano,
                                        )));
                              },
                            ),
                            GestureDetector(
                              child: ListTile(
                                title: Text(
                                  "2º ano",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: Scaffold(
                                          backgroundColor: Colors.white,
                                          appBar: AppBar(
                                            elevation: 14,
                                            title: Text(
                                                "Prova 2º ano ${widget.ano}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                            backgroundColor:
                                                Color.fromARGB(250, 28, 34, 34),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        bottom: Radius.circular(
                                                            30))),
                                            leading: IconButton(
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            actions: [
                                              Theme(
                                                data: ThemeData(
                                                  cardColor: Color.fromARGB(250, 28, 34, 34),
                                                ),
                                                child: PopupMenuButton(
                                                  icon: Icon(Icons.link,color: Colors.white,),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      child: GestureDetector(
                                                        child: Text("Compartilhar Prova",style: TextStyle(color: Colors.white),),
                                                        onTap: widget.share2anoprova,
                                                      ),
                                                      value: 0,
                                                    ),
                                                    PopupMenuItem(
                                                      child: GestureDetector(
                                                        child: Text("Compartilhar Gabarito",style: TextStyle(color: Colors.white)),
                                                        onTap: widget.share2anogabarito,
                                                      ),
                                                      value: 1,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          body: widget.prova2ano,
                                        )));
                              },
                            ),
                            GestureDetector(
                              child: ListTile(
                                title: Text(
                                  "3º ano",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: Scaffold(
                                          backgroundColor: Colors.white,
                                          appBar: AppBar(
                                            elevation: 14,
                                            title: Text(
                                                "Prova 3º ano ${widget.ano}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                            backgroundColor:
                                                Color.fromARGB(250, 28, 34, 34),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        bottom: Radius.circular(
                                                            30))),
                                            leading: IconButton(
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            actions: [
                                              Theme(
                                                data: ThemeData(
                                                  cardColor: Color.fromARGB(250, 28, 34, 34),
                                                ),
                                                child: PopupMenuButton(
                                                  icon: Icon(Icons.link,color: Colors.white,),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      child: GestureDetector(
                                                        child: Text("Compartilhar Prova",style: TextStyle(color: Colors.white),),
                                                        onTap: widget.share3anoprova,
                                                      ),
                                                      value: 0,
                                                    ),
                                                    PopupMenuItem(
                                                      child: GestureDetector(
                                                        child: Text("Compartilhar Gabarito",style: TextStyle(color: Colors.white)),
                                                        onTap: widget.share3anogabarito,
                                                      ),
                                                      value: 1,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          body: widget.prova3ano,
                                        )));
                              },
                            ),
                          ]).toList(),
                    ),
                  ),
                )));
      },
    );
  }
}
