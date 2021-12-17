import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_na_ufam/provas_e_gabaritos/method_ano.dart';

class PscUfam extends StatefulWidget {
  @override
  _PscUfamState createState() => _PscUfamState();
}

class _PscUfamState extends State<PscUfam> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 14,
        title: Text("Provas e Gabaritos PSC",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
            )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: (){
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
                MethodAno(
                  ano:"2002",
                  prova1ano: Prova1ano2002(),
                  prova2ano: Prova2ano2002(),
                  prova3ano: Prova3ano2002(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2002_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2002',
                          'prova1ano2002.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2002');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2002_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2002',
                          'gabarito1ano2002.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2002');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2002_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2002',
                          'prova2ano2002.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2002');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2002_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2002',
                          'gabarito2ano2002.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2002');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2002_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2002',
                          'prova3ano2002.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2002');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2002_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2002',
                          'gabarito3ano2002.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2002');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2003",
                  prova1ano: Prova1ano2003(),
                  prova2ano: Prova2ano2003(),
                  prova3ano: Prova3ano2003(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2003_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2003',
                          'prova1ano2003.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2003');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2003_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2003',
                          'gabarito1ano2003.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2003');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2003_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2003',
                          'prova2ano2003.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2003');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2003_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2003',
                          'gabarito2ano2003.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2003');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2003_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2003',
                          'prova3ano2003.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2003');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2003_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2003',
                          'gabarito3ano2003.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2003');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2004",
                  prova1ano: Prova1ano2004(),
                  prova2ano: Prova2ano2004(),
                  prova3ano: Prova3ano2004(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2004_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2004',
                          'prova1ano2004.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2004');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2004_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2004',
                          'gabarito1ano2004.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2004');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2004_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2004',
                          'prova2ano2004.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2004');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2004_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2004',
                          'gabarito2ano2004.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2004');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2004_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2004',
                          'prova3ano2004.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2004');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2004_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2004',
                          'gabarito3ano2004.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2004');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2005",
                  prova1ano: Prova1ano2005(),
                  prova2ano: Prova2ano2005(),
                  prova3ano: Prova3ano2005(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2005_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2005',
                          'prova1ano2005.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2005');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2005_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2005',
                          'gabarito1ano2005.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2005');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2005_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2005',
                          'prova2ano2005.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2005');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2005_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2005',
                          'gabarito2ano2005.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2005');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2005_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2005',
                          'prova3ano2005.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2005');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2005_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2005',
                          'gabarito3ano2005.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2005');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2006",
                  prova1ano: Prova1ano2006(),
                  prova2ano: Prova2ano2006(),
                  prova3ano: Prova3ano2006(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2006_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2006',
                          'prova1ano2006.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2006');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2006_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2006',
                          'gabarito1ano2006.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2006');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2006_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2006',
                          'prova2ano2006.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2006');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2006_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2006',
                          'gabarito2ano2006.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2006');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2006_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2006',
                          'prova3ano2006.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2006');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2006_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2006',
                          'gabarito3ano2006.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2006');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2007",
                  prova1ano: Prova1ano2007(),
                  prova2ano: Prova2ano2007(),
                  prova3ano: Prova3ano2007(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2007_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2007',
                          'prova1ano2007.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2007');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2007_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2007',
                          'gabarito1ano2007.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2007');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2007_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2007',
                          'prova2ano2007.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2007');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2007_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2007',
                          'gabarito2ano2007.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2007');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2007_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2007',
                          'prova3ano2007.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2007');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2007_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2007',
                          'gabarito3ano2007.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2007');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2008",
                  prova1ano: Prova1ano2008(),
                  prova2ano: Prova2ano2008(),
                  prova3ano: Prova3ano2008(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2008_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2008',
                          'prova1ano2008.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2008');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2008_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2008',
                          'gabarito1ano2008.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2008');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2008_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2008',
                          'prova2ano2008.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2008');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2008_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2008',
                          'gabarito2ano2008.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2008');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2008_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2008',
                          'prova3ano2008.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2008');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2008_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2008',
                          'gabarito3ano2008.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2008');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2009",
                  prova1ano: Prova1ano2009(),
                  prova2ano: Prova2ano2009(),
                  prova3ano: Prova3ano2009(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2009_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2009',
                          'prova1ano2009.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2009');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2009_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2009',
                          'gabarito1ano2009.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2009');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2009_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2009',
                          'prova2ano2009.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2009');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2009_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2009',
                          'gabarito2ano2009.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2009');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2009_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2009',
                          'prova3ano2009.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2009');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2009_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2009',
                          'gabarito3ano2009.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2009');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2010",
                  prova1ano: Prova1ano2010(),
                  prova2ano: Prova2ano2010(),
                  prova3ano: Prova3ano2010(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2010_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2010',
                          'prova1ano2010.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2010');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2010_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2010',
                          'gabarito1ano2010.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2010');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2010_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2010',
                          'prova2ano2010.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2010');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2010_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2010',
                          'gabarito2ano2010.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2010');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2010_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2010',
                          'prova3ano2010.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2010');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2010_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2010',
                          'gabarito3ano2010.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2010');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2011",
                  prova1ano: Prova1ano2011(),
                  prova2ano: Prova2ano2011(),
                  prova3ano: Prova3ano2011(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2011_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2011',
                          'prova1ano2011.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2011');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2011_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2011',
                          'gabarito1ano2011.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2011');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2011_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2011',
                          'prova2ano2011.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2011');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2011_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2011',
                          'gabarito2ano2011.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2011');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2011_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2011',
                          'prova3ano2011.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2011');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2011_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2011',
                          'gabarito3ano2011.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2011');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2012",
                  prova1ano: Prova1ano2012(),
                  prova2ano: Prova2ano2012(),
                  prova3ano: Prova3ano2012(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2012_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2012',
                          'prova1ano2012.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2012');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2012_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2012',
                          'gabarito1ano2012.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2012');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2012_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2012',
                          'prova2ano2012.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2012');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2012_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2012',
                          'gabarito2ano2012.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2012');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2012_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2012',
                          'prova3ano2012.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2012');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2012_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2012',
                          'gabarito3ano2012.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2012');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2013",
                  prova1ano: Prova1ano2013(),
                  prova2ano: Prova2ano2013(),
                  prova3ano: Prova3ano2013(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2013_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2013',
                          'prova1ano2013.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2013');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2013_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2013',
                          'gabarito1ano2013.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2013');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2013_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2013',
                          'prova2ano2013.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2013');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2013_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2013',
                          'gabarito2ano2013.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2013');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2013_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2013',
                          'prova3ano2013.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2013');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2013_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2013',
                          'gabarito3ano2013.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2013');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2014",
                  prova1ano: Prova1ano2014(),
                  prova2ano: Prova2ano2014(),
                  prova3ano: Prova3ano2014(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2014_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2014',
                          'prova1ano2014.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2014');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2014_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2014',
                          'gabarito1ano2014.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2014');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2014_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2014',
                          'prova2ano2014.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2014');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2014_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2014',
                          'gabarito2ano2014.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2014');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2014_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2014',
                          'prova3ano2014.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2014');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2014_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2014',
                          'gabarito3ano2014.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2014');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2015",
                  prova1ano: Prova1ano2015(),
                  prova2ano: Prova2ano2015(),
                  prova3ano: Prova3ano2015(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2015_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2015',
                          'prova1ano2015.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2015');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2015_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2015',
                          'gabarito1ano2015.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2015');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2015_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2015',
                          'prova2ano2015.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2015');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2015_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2015',
                          'gabarito2ano2015.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2015');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2015_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2015',
                          'prova3ano2015.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2015');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2015_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2015',
                          'gabarito3ano2015.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2015');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2016",
                  prova1ano: Prova1ano2016(),
                  prova2ano: Prova2ano2016(),
                  prova3ano: Prova3ano2016(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2016_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2016',
                          'prova1ano2016.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2016');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2016_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2016',
                          'gabarito1ano2016.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2016');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2016_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2016',
                          'prova2ano2016.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2016');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2016_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2016',
                          'gabarito2ano2016.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2016');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2016_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2016',
                          'prova3ano2016.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2016');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2016_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2016',
                          'gabarito3ano2016.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2016');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2017",
                  prova1ano: Prova1ano2017(),
                  prova2ano: Prova2ano2017(),
                  prova3ano: Prova3ano2017(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2017_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2017',
                          'prova1ano2017.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2017');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2017_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2017',
                          'gabarito1ano2017.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2017');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2017_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2017',
                          'prova2ano2017.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2017');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2017_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2017',
                          'gabarito2ano2017.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2017');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2017_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2017',
                          'prova3ano2017.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2017');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2017_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2017',
                          'gabarito3ano2017.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2017');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2018",
                  prova1ano: Prova1ano2018(),
                  prova2ano: Prova2ano2018(),
                  prova3ano: Prova3ano2018(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2018_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2018',
                          'prova1ano2018.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2018');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2018_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2018',
                          'gabarito1ano2018.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2018');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2018_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2018',
                          'prova2ano2018.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2018');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2018_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2018',
                          'gabarito2ano2018.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2018');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2018_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2018',
                          'prova3ano2018.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2018');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2018_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2018',
                          'gabarito3ano2018.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2018');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2019",
                  prova1ano: Prova1ano2019(),
                  prova2ano: Prova2ano2019(),
                  prova3ano: Prova3ano2019(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2019_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2019',
                          'prova1ano2019.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2019');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2019_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2019',
                          'gabarito1ano2019.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2019');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2019_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2019',
                          'prova2ano2019.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2019');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2019_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2019',
                          'gabarito2ano2019.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2019');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2019_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2019',
                          'prova3ano2019.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2019');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2019_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2019',
                          'gabarito3ano2019.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2019');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
                MethodAno(
                  ano: "2020",
                  prova1ano: Prova1ano2020(),
                  prova2ano: Prova2ano2020(),
                  prova3ano: Prova3ano2020(),
                  share1anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2020_1ano_prova.pdf');
                      await Share.file(
                          'prova1ano2020',
                          'prova1ano2020.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 1º ano 2020');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share1anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2020_1ano_gabarito.pdf');
                      await Share.file(
                          'gabarito1ano2020',
                          'gabarito1ano2020.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 1º ano 2020');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2020_2ano_prova.pdf');
                      await Share.file(
                          'prova2ano2020',
                          'prova2ano2020.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 2º ano 2020');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share2anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2020_2ano_gabarito.pdf');
                      await Share.file(
                          'gabarito2ano2020',
                          'gabarito2ano2020.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 2º ano 2020');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anoprova: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/provas/PSC2020_3ano_prova.pdf');
                      await Share.file(
                          'prova3ano2020',
                          'prova3ano2020.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Prova PSC 3º ano 2020');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  share3anogabarito: () async {
                    try {
                      final ByteData
                      bytes =
                      await rootBundle.load('assets/psc/gabaritos/PSC2020_3ano_gabarito.pdf');
                      await Share.file(
                          'gabarito3ano2020',
                          'gabarito3ano2020.pdf',
                          bytes.buffer.asUint8List(),
                          'image/png',
                          text: 'Gabarito PSC 3º ano 2020');
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                ),
              ]).toList()
        ),
      ),
    );
  }
}

class Prova1ano2002 extends StatefulWidget {
  @override
  _Prova1ano2002State createState() => _Prova1ano2002State();
}

class _Prova1ano2002State extends State<Prova1ano2002> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2002_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2002 extends StatefulWidget {
  @override
  _Prova2ano2002State createState() => _Prova2ano2002State();
}

class _Prova2ano2002State extends State<Prova2ano2002> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2002_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2002 extends StatefulWidget {
  @override
  _Prova3ano2002State createState() => _Prova3ano2002State();
}

class _Prova3ano2002State extends State<Prova3ano2002> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2002_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}



class Prova1ano2003 extends StatefulWidget {
  @override
  _Prova1ano2003State createState() => _Prova1ano2003State();
}

class _Prova1ano2003State extends State<Prova1ano2003> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2003_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2003 extends StatefulWidget {
  @override
  _Prova2ano2003State createState() => _Prova2ano2003State();
}

class _Prova2ano2003State extends State<Prova2ano2003> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2003_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2003 extends StatefulWidget {
  @override
  _Prova3ano2003State createState() => _Prova3ano2003State();
}

class _Prova3ano2003State extends State<Prova3ano2003> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2003_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2004 extends StatefulWidget {
  @override
  _Prova1ano2004State createState() => _Prova1ano2004State();
}

class _Prova1ano2004State extends State<Prova1ano2004> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2004_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2004 extends StatefulWidget {
  @override
  _Prova2ano2004State createState() => _Prova2ano2004State();
}

class _Prova2ano2004State extends State<Prova2ano2004> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2004_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2004 extends StatefulWidget {
  @override
  _Prova3ano2004State createState() => _Prova3ano2004State();
}

class _Prova3ano2004State extends State<Prova3ano2004> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2004_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2005 extends StatefulWidget {
  @override
  _Prova1ano2005State createState() => _Prova1ano2005State();
}

class _Prova1ano2005State extends State<Prova1ano2005> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2005_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2005 extends StatefulWidget {
  @override
  _Prova2ano2005State createState() => _Prova2ano2005State();
}

class _Prova2ano2005State extends State<Prova2ano2005> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2005_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2005 extends StatefulWidget {
  @override
  _Prova3ano2005State createState() => _Prova3ano2005State();
}

class _Prova3ano2005State extends State<Prova3ano2005> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2005_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2006 extends StatefulWidget {
  @override
  _Prova1ano2006State createState() => _Prova1ano2006State();
}

class _Prova1ano2006State extends State<Prova1ano2006> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2006_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2006 extends StatefulWidget {
  @override
  _Prova2ano2006State createState() => _Prova2ano2006State();
}

class _Prova2ano2006State extends State<Prova2ano2006> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2006_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2006 extends StatefulWidget {
  @override
  _Prova3ano2006State createState() => _Prova3ano2006State();
}

class _Prova3ano2006State extends State<Prova3ano2006> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2006_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2007 extends StatefulWidget {
  @override
  _Prova1ano2007State createState() => _Prova1ano2007State();
}

class _Prova1ano2007State extends State<Prova1ano2007> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2007_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2007 extends StatefulWidget {
  @override
  _Prova2ano2007State createState() => _Prova2ano2007State();
}

class _Prova2ano2007State extends State<Prova2ano2007> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2007_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2007 extends StatefulWidget {
  @override
  _Prova3ano2007State createState() => _Prova3ano2007State();
}

class _Prova3ano2007State extends State<Prova3ano2007> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2007_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2008 extends StatefulWidget {
  @override
  _Prova1ano2008State createState() => _Prova1ano2008State();
}

class _Prova1ano2008State extends State<Prova1ano2008> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2008_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2008 extends StatefulWidget {
  @override
  _Prova2ano2008State createState() => _Prova2ano2008State();
}

class _Prova2ano2008State extends State<Prova2ano2008> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2008_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2008 extends StatefulWidget {
  @override
  _Prova3ano2008State createState() => _Prova3ano2008State();
}

class _Prova3ano2008State extends State<Prova3ano2008> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2008_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2009 extends StatefulWidget {
  @override
  _Prova1ano2009State createState() => _Prova1ano2009State();
}

class _Prova1ano2009State extends State<Prova1ano2009> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2009_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2009 extends StatefulWidget {
  @override
  _Prova2ano2009State createState() => _Prova2ano2009State();
}

class _Prova2ano2009State extends State<Prova2ano2009> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2009_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2009 extends StatefulWidget {
  @override
  _Prova3ano2009State createState() => _Prova3ano2009State();
}

class _Prova3ano2009State extends State<Prova3ano2009> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2009_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2010 extends StatefulWidget {
  @override
  _Prova1ano2010State createState() => _Prova1ano2010State();
}

class _Prova1ano2010State extends State<Prova1ano2010> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2010_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2010 extends StatefulWidget {
  @override
  _Prova2ano2010State createState() => _Prova2ano2010State();
}

class _Prova2ano2010State extends State<Prova2ano2010> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2010_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2010 extends StatefulWidget {
  @override
  _Prova3ano2010State createState() => _Prova3ano2010State();
}

class _Prova3ano2010State extends State<Prova3ano2010> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2010_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2011 extends StatefulWidget {
  @override
  _Prova1ano2011State createState() => _Prova1ano2011State();
}

class _Prova1ano2011State extends State<Prova1ano2011> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2011_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2011 extends StatefulWidget {
  @override
  _Prova2ano2011State createState() => _Prova2ano2011State();
}

class _Prova2ano2011State extends State<Prova2ano2011> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2011_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2011 extends StatefulWidget {
  @override
  _Prova3ano2011State createState() => _Prova3ano2011State();
}

class _Prova3ano2011State extends State<Prova3ano2011> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2011_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2012 extends StatefulWidget {
  @override
  _Prova1ano2012State createState() => _Prova1ano2012State();
}

class _Prova1ano2012State extends State<Prova1ano2012> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2012_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2012 extends StatefulWidget {
  @override
  _Prova2ano2012State createState() => _Prova2ano2012State();
}

class _Prova2ano2012State extends State<Prova2ano2012> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2012_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2012 extends StatefulWidget {
  @override
  _Prova3ano2012State createState() => _Prova3ano2012State();
}

class _Prova3ano2012State extends State<Prova3ano2012> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2012_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2013 extends StatefulWidget {
  @override
  _Prova1ano2013State createState() => _Prova1ano2013State();
}

class _Prova1ano2013State extends State<Prova1ano2013> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2013_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2013 extends StatefulWidget {
  @override
  _Prova2ano2013State createState() => _Prova2ano2013State();
}

class _Prova2ano2013State extends State<Prova2ano2013> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2013_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2013 extends StatefulWidget {
  @override
  _Prova3ano2013State createState() => _Prova3ano2013State();
}

class _Prova3ano2013State extends State<Prova3ano2013> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2013_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2014 extends StatefulWidget {
  @override
  _Prova1ano2014State createState() => _Prova1ano2014State();
}

class _Prova1ano2014State extends State<Prova1ano2014> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2014_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2014 extends StatefulWidget {
  @override
  _Prova2ano2014State createState() => _Prova2ano2014State();
}

class _Prova2ano2014State extends State<Prova2ano2014> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2014_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2014 extends StatefulWidget {
  @override
  _Prova3ano2014State createState() => _Prova3ano2014State();
}

class _Prova3ano2014State extends State<Prova3ano2014> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2014_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2015 extends StatefulWidget {
  @override
  _Prova1ano2015State createState() => _Prova1ano2015State();
}

class _Prova1ano2015State extends State<Prova1ano2015> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2015_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2015 extends StatefulWidget {
  @override
  _Prova2ano2015State createState() => _Prova2ano2015State();
}

class _Prova2ano2015State extends State<Prova2ano2015> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2015_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2015 extends StatefulWidget {
  @override
  _Prova3ano2015State createState() => _Prova3ano2015State();
}

class _Prova3ano2015State extends State<Prova3ano2015> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2015_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2016 extends StatefulWidget {
  @override
  _Prova1ano2016State createState() => _Prova1ano2016State();
}

class _Prova1ano2016State extends State<Prova1ano2016> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2016_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2016 extends StatefulWidget {
  @override
  _Prova2ano2016State createState() => _Prova2ano2016State();
}

class _Prova2ano2016State extends State<Prova2ano2016> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2016_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2016 extends StatefulWidget {
  @override
  _Prova3ano2016State createState() => _Prova3ano2016State();
}

class _Prova3ano2016State extends State<Prova3ano2016> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2016_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2017 extends StatefulWidget {
  @override
  _Prova1ano2017State createState() => _Prova1ano2017State();
}

class _Prova1ano2017State extends State<Prova1ano2017> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2017_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2017 extends StatefulWidget {
  @override
  _Prova2ano2017State createState() => _Prova2ano2017State();
}

class _Prova2ano2017State extends State<Prova2ano2017> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2017_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2017 extends StatefulWidget {
  @override
  _Prova3ano2017State createState() => _Prova3ano2017State();
}

class _Prova3ano2017State extends State<Prova3ano2017> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2017_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2018 extends StatefulWidget {
  @override
  _Prova1ano2018State createState() => _Prova1ano2018State();
}

class _Prova1ano2018State extends State<Prova1ano2018> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2018_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2018 extends StatefulWidget {
  @override
  _Prova2ano2018State createState() => _Prova2ano2018State();
}

class _Prova2ano2018State extends State<Prova2ano2018> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2018_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2018 extends StatefulWidget {
  @override
  _Prova3ano2018State createState() => _Prova3ano2018State();
}

class _Prova3ano2018State extends State<Prova3ano2018> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2018_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2019 extends StatefulWidget {
  @override
  _Prova1ano2019State createState() => _Prova1ano2019State();
}

class _Prova1ano2019State extends State<Prova1ano2019> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2019_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2019 extends StatefulWidget {
  @override
  _Prova2ano2019State createState() => _Prova2ano2019State();
}

class _Prova2ano2019State extends State<Prova2ano2019> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2019_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2019 extends StatefulWidget {
  @override
  _Prova3ano2019State createState() => _Prova3ano2019State();
}

class _Prova3ano2019State extends State<Prova3ano2019> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2019_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}


class Prova1ano2020 extends StatefulWidget {
  @override
  _Prova1ano2020State createState() => _Prova1ano2020State();
}

class _Prova1ano2020State extends State<Prova1ano2020> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2020_1ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova2ano2020 extends StatefulWidget {
  @override
  _Prova2ano2020State createState() => _Prova2ano2020State();
}

class _Prova2ano2020State extends State<Prova2ano2020> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document = await PDFDocument.fromAsset('assets/psc/provas/PSC2020_2ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}

class Prova3ano2020 extends StatefulWidget {
  @override
  _Prova3ano2020State createState() => _Prova3ano2020State();
}

class _Prova3ano2020State extends State<Prova3ano2020> {

  bool _isLoading = true;
  PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    _document =
    await PDFDocument.fromAsset('assets/psc/provas/PSC2020_3ano_prova.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor:
          Colors.white),
      child:
      Center(
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(250, 28, 34, 34),
            ))
            : PDFViewer(
          document: _document,
          zoomSteps: 3,
          showPicker: false,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(250, 28, 34, 34)),
          ),
        ),
      ),
    );
  }
}
