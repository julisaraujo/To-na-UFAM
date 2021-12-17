import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class TagColorPage extends StatefulWidget {
  @override
  _TagColorPageState createState() => _TagColorPageState();
}

class _TagColorPageState extends State<TagColorPage> {

  List encodelist = [];

  List tag_colors_list = [];

  String namecolor = "Vermelho";
  List colorsRGB = [244, 67, 54];

  GlobalKey<FormState> _tagnameKey = GlobalKey<FormState>();
  final _tagnamecontroller = TextEditingController(text: "");

  Future<String> loadJsonData() async {
    var jsonString = await rootBundle.loadString('assets/tag_colors.json');
    setState(() {
      this.tag_colors_list = jsonDecode(jsonString);
    });
  }

  @override
  void initState() {
    this.loadJsonData();
    _readData().then((tag) {
      setState(() {
        if (tag.isNotEmpty) {
          encodelist = jsonDecode(tag);
        }
      });
    });
  }

  void _addTag() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["tagsinformation"] = "tags";
      newToDo["tagsname"] = _tagnamecontroller.text;
      newToDo["colorsnumber"] = colorsRGB;
      encodelist.add(newToDo);
      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 42, 46, 50),
      appBar: AppBar(
        elevation: 10,
        title: Text("Minhas Tags",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(20))),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: (){
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
                  backgroundColor: Color.fromARGB(250, 28, 34, 34),
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: StatefulBuilder(
                        builder: (BuildContext context,
                            StateSetter setState){
                          return Padding(
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Crie uma nova tag",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.turned_in_rounded,
                                      color: Color.fromARGB(
                                          250, colorsRGB[0], colorsRGB[1], colorsRGB[2]),
                                      size: 35,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Theme(
                                    data: ThemeData(
                                        primaryColor: Colors.white, primaryColorDark: Colors.blue),
                                    child: Form(
                                      key: _tagnameKey,
                                      child: TextFormField(
                                        controller: _tagnamecontroller,
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
                                              value == "                        " ||
                                              value == "                         " ||
                                              value == "                          " ||
                                              value == "                           " ||
                                              value == "                            " ||
                                              value == "                             " ||
                                              value == "                              ") {
                                            return "Preencha corretamente";
                                          } else if (value.length > 30) {
                                            return "O número de caracteres não pode ser maior que 30";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                        maxLength: 30,
                                        decoration: InputDecoration(
                                            errorMaxLines: 2,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              borderSide:
                                              BorderSide(width: 2, color: Color(0xff13d38e)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              borderSide: BorderSide(width: 2, color: Colors.white),
                                            ),
                                            counterStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            labelText: "Dê um nome para sua tag",
                                            labelStyle:
                                            TextStyle(color: Colors.white54, fontSize: 19),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(20)))),
                                        autofocus: false,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Escolha uma cor para sua tag:",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: Colors.white54, fontSize: 17),
                                    ),
                                    Container(
                                        width: 80,
                                        height: 50,
                                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(150, 42, 46, 50),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                            padding:
                                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                            child: Center(
                                              child: DropdownButton(
                                                  isExpanded: true,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Color.fromARGB(250, colorsRGB[0],
                                                        colorsRGB[1], colorsRGB[2]),
                                                    size: 30,
                                                  ),
                                                  hint: Center(
                                                    child: Container(
                                                      color: Color.fromARGB(250, colorsRGB[0],
                                                          colorsRGB[1], colorsRGB[2]),
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                  ),
                                                  underline: Container(
                                                    color: Colors.transparent,
                                                  ),
                                                  onChanged: (tag_colors_list) {
                                                    setState(() {
                                                      this.namecolor = tag_colors_list['namecolor'];
                                                      this.colorsRGB = tag_colors_list['listRGB'];
                                                    });
                                                  },
                                                  value: null,
                                                  items: tag_colors_list.map((tag_colors_list) {
                                                    return DropdownMenuItem<dynamic>(
                                                        value: tag_colors_list,
                                                        child: Center(
                                                          child: Container(
                                                            height: 15,
                                                            width: 15,
                                                            color: Color.fromARGB(
                                                                250,
                                                                tag_colors_list['listRGB'][0],
                                                                tag_colors_list['listRGB'][1],
                                                                tag_colors_list['listRGB'][2]),
                                                          ),
                                                        ));
                                                  }).toList()),
                                            ))),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        TextButton(
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.red,
                                            size: 35,
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        TextButton(
                                            child: Icon(
                                              Icons.check_circle,
                                              color: Color(0xff13d38e),
                                              size: 35,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (_tagnameKey.currentState.validate()) {
                                                  Navigator.pop(context);
                                                  _addTag();
                                                  _tagnamecontroller.clear();
                                                }
                                              });
                                            }),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
              );
            },
          )
        ],
      ),
      body: encodelist.length == 0 ?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Você ainda não criou suas tags...",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.turned_in_rounded,
              size: 25,
              color: Colors.grey,
            )
          ],
        ),
      ) :
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: encodelist.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction){
                      setState(() {
                        encodelist.removeAt(index);
                        _saveData();
                      });
                    },
                    background: Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(250, 153, 0, 21),
                      ),
                      child: Align(
                        alignment: Alignment(-0.9, 0.0),
                        child: Icon(Icons.delete_forever, color: Colors.white),
                      ),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.turned_in_rounded,
                              size: 30,
                              color: Color.fromARGB(
                                250,
                                encodelist[index]["colorsnumber"][0],
                                encodelist[index]["colorsnumber"][1],
                                encodelist[index]["colorsnumber"][2],
                              ),
                            ),
                            title: Text(
                              encodelist[index]["tagsname"],
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis,
                              textAlign:
                              TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18,
                                  color:
                                  Colors.white),
                            ),
                          ),
                          Divider(
                            color: Colors.white12,
                            height: 0,
                            thickness: 1.0,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ],
                      ),
                    )
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/tagfolder/tag.json");

    if(await directoryfoldertest.exists()){
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 = await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<File> _saveData() async {
    String tag = json.encode(encodelist);

    final file = await _getFile();
    return file.writeAsString(tag);
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
