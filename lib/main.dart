import 'package:flutter/material.dart';
import 'package:to_na_ufam/init.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tô na UFAM",
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.teal,
          canvasColor: Color.fromARGB(250, 28, 34, 34),

        ),
        home: Splash()
    );
  }
}
