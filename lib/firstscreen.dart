import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_na_ufam/page_view/home_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool check = false;
  List tags = [];
  List tagsfile = [
    {
      "tagsinformation": "tags",
      "tagsname": "Português",
      "colorsnumber": [59, 38, 186]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"Matemática",
      "colorsnumber":[253, 110, 33]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"Química",
      "colorsnumber":[255, 20, 151]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"Física",
      "colorsnumber":[255, 255, 10]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"Biologia",
      "colorsnumber":[19, 203, 147]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"Geografia",
      "colorsnumber":[57, 186, 255]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"História",
      "colorsnumber":[130, 253, 0]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"Literatura",
      "colorsnumber":[174, 59, 241]
    },
    {
      "tagsinformation": "tags",
      "tagsname":"Redação",
      "colorsnumber":[227, 4, 37]
    },
  ];

  List bio1encode = [];
  List fis1encode = [];
  List geo1encode = [];
  List hist1encode = [];
  List lit1encode = [];
  List mat1encode = [];
  List port1encode = [];
  List quim1encode = [];

  List bio2encode = [];
  List fis2encode = [];
  List geo2encode = [];
  List hist2encode = [];
  List lit2encode = [];
  List mat2encode = [];
  List port2encode = [];
  List quim2encode = [];

  List bio3encode = [];
  List fis3encode = [];
  List geo3encode = [];
  List hist3encode = [];
  List lit3encode = [];
  List mat3encode = [];
  List port3encode = [];
  List quim3encode = [];

  List bio1 = [];
  List fis1 = [];
  List geo1 = [];
  List hist1 = [];
  List lit1 = [];
  List mat1 = [];
  List port1 = [];
  List quim1 = [];

  List bio2 = [];
  List fis2 = [];
  List geo2 = [];
  List hist2 = [];
  List lit2 = [];
  List mat2 = [];
  List port2 = [];
  List quim2 = [];

  List bio3 = [];
  List fis3 = [];
  List geo3 = [];
  List hist3 = [];
  List lit3 = [];
  List mat3 = [];
  List port3 = [];
  List quim3 = [];

  Future<String> loadJsonData() async {
    var jsonStringbio1 =
        await rootBundle.loadString('assets/assuntos/1ano/bio1.json');
    setState(() {
      this.bio1 = jsonDecode(jsonStringbio1);
    });
    var jsonStringfis1 =
        await rootBundle.loadString('assets/assuntos/1ano/fis1.json');
    setState(() {
      this.fis1 = jsonDecode(jsonStringfis1);
    });
    var jsonStringgeo1 =
        await rootBundle.loadString('assets/assuntos/1ano/geo1.json');
    setState(() {
      this.geo1 = jsonDecode(jsonStringgeo1);
    });
    var jsonStringhist1 =
        await rootBundle.loadString('assets/assuntos/1ano/hist1.json');
    setState(() {
      this.hist1 = jsonDecode(jsonStringhist1);
    });
    var jsonStringlit1 =
        await rootBundle.loadString('assets/assuntos/1ano/lit1.json');
    setState(() {
      this.lit1 = jsonDecode(jsonStringlit1);
    });
    var jsonStringmat1 =
        await rootBundle.loadString('assets/assuntos/1ano/mat1.json');
    setState(() {
      this.mat1 = jsonDecode(jsonStringmat1);
    });
    var jsonStringport1 =
        await rootBundle.loadString('assets/assuntos/1ano/port1.json');
    setState(() {
      this.port1 = jsonDecode(jsonStringport1);
    });
    var jsonStringquim1 =
        await rootBundle.loadString('assets/assuntos/1ano/quim1.json');
    setState(() {
      this.quim1 = jsonDecode(jsonStringquim1);
    });

    var jsonStringbio2 =
        await rootBundle.loadString('assets/assuntos/2ano/bio2.json');
    setState(() {
      this.bio2 = jsonDecode(jsonStringbio2);
    });
    var jsonStringfis2 =
        await rootBundle.loadString('assets/assuntos/2ano/fis2.json');
    setState(() {
      this.fis2 = jsonDecode(jsonStringfis2);
    });
    var jsonStringgeo2 =
        await rootBundle.loadString('assets/assuntos/2ano/geo2.json');
    setState(() {
      this.geo2 = jsonDecode(jsonStringgeo2);
    });
    var jsonStringhist2 =
        await rootBundle.loadString('assets/assuntos/2ano/hist2.json');
    setState(() {
      this.hist2 = jsonDecode(jsonStringhist2);
    });
    var jsonStringlit2 =
        await rootBundle.loadString('assets/assuntos/2ano/lit2.json');
    setState(() {
      this.lit2 = jsonDecode(jsonStringlit2);
    });
    var jsonStringmat2 =
        await rootBundle.loadString('assets/assuntos/2ano/mat2.json');
    setState(() {
      this.mat2 = jsonDecode(jsonStringmat2);
    });
    var jsonStringport2 =
        await rootBundle.loadString('assets/assuntos/2ano/port2.json');
    setState(() {
      this.port2 = jsonDecode(jsonStringport2);
    });
    var jsonStringquim2 =
        await rootBundle.loadString('assets/assuntos/2ano/quim2.json');
    setState(() {
      this.quim2 = jsonDecode(jsonStringquim2);
    });

    var jsonStringbio3 =
        await rootBundle.loadString('assets/assuntos/3ano/bio3.json');
    setState(() {
      this.bio3 = jsonDecode(jsonStringbio3);
    });
    var jsonStringfis3 =
        await rootBundle.loadString('assets/assuntos/3ano/fis3.json');
    setState(() {
      this.fis3 = jsonDecode(jsonStringfis3);
    });
    var jsonStringgeo3 =
        await rootBundle.loadString('assets/assuntos/3ano/geo3.json');
    setState(() {
      this.geo3 = jsonDecode(jsonStringgeo3);
    });
    var jsonStringhist3 =
        await rootBundle.loadString('assets/assuntos/3ano/hist3.json');
    setState(() {
      this.hist3 = jsonDecode(jsonStringhist3);
    });
    var jsonStringlit3 =
        await rootBundle.loadString('assets/assuntos/3ano/lit3.json');
    setState(() {
      this.lit3 = jsonDecode(jsonStringlit3);
    });
    var jsonStringmat3 =
        await rootBundle.loadString('assets/assuntos/3ano/mat3.json');
    setState(() {
      this.mat3 = jsonDecode(jsonStringmat3);
    });
    var jsonStringport3 =
        await rootBundle.loadString('assets/assuntos/3ano/port3.json');
    setState(() {
      this.port3 = jsonDecode(jsonStringport3);
    });
    var jsonStringquim3 =
        await rootBundle.loadString('assets/assuntos/3ano/quim3.json');
    setState(() {
      this.quim3 = jsonDecode(jsonStringquim3);
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
    _readDatabio1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          bio1encode = jsonDecode(mystring);
        }
      });
    });
    _readDatafis1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          fis1encode = jsonDecode(mystring);
        }
      });
    });
    _readDatageo1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          geo1encode = jsonDecode(mystring);
        }
      });
    });
    _readDatahist1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          hist1encode = jsonDecode(mystring);
        }
      });
    });
    _readDatalit1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          lit1encode = jsonDecode(mystring);
        }
      });
    });
    _readDatamat1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          mat1encode = jsonDecode(mystring);
        }
      });
    });
    _readDataport1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          port1encode = jsonDecode(mystring);
        }
      });
    });
    _readDataquim1().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          quim1encode = jsonDecode(mystring);
        }
      });
    });

    _readDatabio2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          bio2encode = jsonDecode(mystring);
        }
      });
    });
    _readDatafis2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          fis2encode = jsonDecode(mystring);
        }
      });
    });
    _readDatageo2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          geo2encode = jsonDecode(mystring);
        }
      });
    });
    _readDatahist2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          hist2encode = jsonDecode(mystring);
        }
      });
    });
    _readDatalit2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          lit2encode = jsonDecode(mystring);
        }
      });
    });
    _readDatamat2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          mat2encode = jsonDecode(mystring);
        }
      });
    });
    _readDataport2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          port2encode = jsonDecode(mystring);
        }
      });
    });
    _readDataquim2().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          quim2encode = jsonDecode(mystring);
        }
      });
    });

    _readDatabio3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          bio3encode = jsonDecode(mystring);
        }
      });
    });
    _readDatafis3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          fis3encode = jsonDecode(mystring);
        }
      });
    });
    _readDatageo3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          geo3encode = jsonDecode(mystring);
        }
      });
    });
    _readDatahist3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          hist3encode = jsonDecode(mystring);
        }
      });
    });
    _readDatalit3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          lit3encode = jsonDecode(mystring);
        }
      });
    });
    _readDatamat3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          mat3encode = jsonDecode(mystring);
        }
      });
    });
    _readDataport3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          port3encode = jsonDecode(mystring);
        }
      });
    });
    _readDataquim3().then((mystring) {
      setState(() {
        if (mystring.isNotEmpty) {
          quim3encode = jsonDecode(mystring);
        }
      });
    });
    _readDatatags().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          tags = jsonDecode(value);
        }
      });
    });
  }

  void _add() {
    setState(() {
      bio1encode.addAll(bio1);
      _saveDatabio1();
    });
    setState(() {
      fis1encode.addAll(fis1);
      _saveDatafis1();
    });
    setState(() {
      geo1encode.addAll(geo1);
      _saveDatageo1();
    });
    setState(() {
      hist1encode.addAll(hist1);
      _saveDatahist1();
    });
    setState(() {
      lit1encode.addAll(lit1);
      _saveDatalit1();
    });
    setState(() {
      mat1encode.addAll(mat1);
      _saveDatamat1();
    });
    setState(() {
      port1encode.addAll(port1);
      _saveDataport1();
    });
    setState(() {
      quim1encode.addAll(quim1);
      _saveDataquim1();
    });

    setState(() {
      bio2encode.addAll(bio2);
      _saveDatabio2();
    });
    setState(() {
      fis2encode.addAll(fis2);
      _saveDatafis2();
    });
    setState(() {
      geo2encode.addAll(geo2);
      _saveDatageo2();
    });
    setState(() {
      hist2encode.addAll(hist2);
      _saveDatahist2();
    });
    setState(() {
      lit2encode.addAll(lit2);
      _saveDatalit2();
    });
    setState(() {
      mat2encode.addAll(mat2);
      _saveDatamat2();
    });
    setState(() {
      port2encode.addAll(port2);
      _saveDataport2();
    });
    setState(() {
      quim2encode.addAll(quim2);
      _saveDataquim2();
    });

    setState(() {
      bio3encode.addAll(bio3);
      _saveDatabio3();
    });
    setState(() {
      fis3encode.addAll(fis3);
      _saveDatafis3();
    });
    setState(() {
      geo3encode.addAll(geo3);
      _saveDatageo3();
    });
    setState(() {
      hist3encode.addAll(hist3);
      _saveDatahist3();
    });
    setState(() {
      lit3encode.addAll(lit3);
      _saveDatalit3();
    });
    setState(() {
      mat3encode.addAll(mat3);
      _saveDatamat3();
    });
    setState(() {
      port3encode.addAll(port3);
      _saveDataport3();
    });
    setState(() {
      quim3encode.addAll(quim3);
      _saveDataquim3();
    });
    setState(() {
      tags.addAll(tagsfile);
      _saveDatatags();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Bem-vindo(a) ao Tô na UFAM",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
      ),
      body: Center(
        child: SimpleDialog(
          backgroundColor: Color.fromARGB(150, 42, 46, 50),
          elevation: 0,
          title: Text("Termos de uso e política de privacidade",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          children: [
            Container(
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.4,
              color: Color.fromARGB(250, 42, 46, 50),
              child: ListView(
                padding: EdgeInsets.all(5),
                children: [
                  Text(
                      "Este aplicativo foi desenvolvido por Julis Figueira de Araújo através do Programa Institucional de Bolsas de Desenvolvimento Tecnológico e Inovação (PIBITI/CNPq/UFAM) e com orientação do Prof. Dr. Horácio Antônio Braga Fernandes de Oliveira.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Sobre o aplicativo e o fim ao que se destina",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Este aplicativo foi desenvolvido com o intuito de prestar auxílio aos alunos do ensino médio que desejam ingressar na UFAM através do Processo Seletivo Contínuo (PSC). Por meio desse aplicativo será possível com que o usuário organize seus estudos e tenha informações sobre o curso que deseja ingressar.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Sobre as informações presentes no aplicativo",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Todas as informações que constam nesse aplicativo referindo-se ao PSC foram retiradas dos sites: https://antigocompec.ufam.edu.br/ , https://compec.ufam.edu.br/ e https://www.idaam.com.br/atlantic/noticia/3074-UFAM-PSC-Banco-de-Provas-e-Gabarito \n O desenvolvedor se ausenta da responsabilidade de eventuais erros, ausência ou trocas de informações que possam ocorrer entre as notas de corte e provas do PSC.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Sobre os dados armazenados",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "O desenvolvedor não possui acesso a nenhum dos dados inseridos neste aplicativo, sendo armazenados estes no dispositivo do usuário.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Avisos gerais",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "O desenvolvedor se ausenta da responsabilidade de eventual dano causado no aparelho do usuário devido a má uso do aplicativo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Política de Privacidade",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Julis Araújo construiu o aplicativo Tô na Ufam como um aplicativo Ad Supported. Este SERVIÇO é prestado por Julis Araújo sem nenhum custo e deve ser utilizado no estado em que se encontra.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Esta página é usada para informar os visitantes sobre minhas políticas de coleta, uso e divulgação de Informações Pessoais, caso alguém decida usar meu Serviço.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Se você optar por usar meu Serviço, você concorda com a coleta e uso de informações em relação a esta política. As Informações Pessoais que recolho são utilizadas para fornecer e melhorar o Serviço. Não vou usar ou compartilhar suas informações com ninguém, exceto conforme descrito nesta Política de Privacidade.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Os termos utilizados nesta Política de Privacidade têm os mesmos significados que em nossos Termos e Condições, que podem ser acessados na Tô na Ufam, a menos que definido de outra forma nesta Política de Privacidade.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Coleta e uso de informações",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Para uma melhor experiência, ao usar nosso Serviço, posso solicitar que você nos forneça certas informações de identificação pessoal. As informações que solicito serão retidas em seu dispositivo e não serão coletadas por mim de forma alguma.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "O aplicativo usa serviços de terceiros que podem coletar informações usadas para identificá-lo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Link para a política de privacidade de provedores de serviços terceirizados usados pelo aplicativo",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "-Serviços do Google Play",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "-AdMob",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "-Google Analytics para Firebase",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "-Firebase Crashlytics",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Dados de registro",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Quero informar que sempre que você utiliza o meu Serviço, em caso de erro no aplicativo, eu coleto dados e informações (por meio de produtos de terceiros) no seu telefone chamado Log Data. Estes dados de registro podem incluir informações como endereço de protocolo de Internet do dispositivo, nome do dispositivo, versão do sistema operacional, configuração do aplicativo ao utilizar meu serviço, hora e data de uso do serviço e outras estatísticas.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Cookies",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Cookies são arquivos com uma pequena quantidade de dados que são comumente usados como identificadores exclusivos anônimos. Eles são enviados para o seu navegador a partir dos sites que você visita e são armazenados na memória interna do seu dispositivo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Este Serviço não usa esses “cookies” explicitamente. No entanto, o aplicativo pode usar código de terceiros e bibliotecas que usam “cookies” para coletar informações e melhorar seus serviços. Você tem a opção de aceitar ou recusar esses cookies e saber quando um cookie está sendo enviado para o seu dispositivo. Se você optar por recusar nossos cookies, pode não ser capaz de usar algumas partes deste Serviço.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Provedores de serviço",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Posso empregar empresas terceirizadas e indivíduos pelos seguintes motivos:",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• Para facilitar nosso serviço;",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• Para fornecer o Serviço em nosso nome;",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• Executar serviços relacionados com o serviço;",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• Para nos ajudar a analisar como nosso serviço é usado.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Desejo informar aos usuários deste Serviço que esses terceiros têm acesso às suas Informações Pessoais. O motivo é realizar as tarefas atribuídas a eles em nosso nome. No entanto, eles são obrigados a não divulgar ou usar as informações para qualquer outra finalidade.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Segurança",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Valorizo sua confiança em nos fornecer suas informações pessoais, portanto, estamos nos empenhando para usar meios comercialmente aceitáveis de protegê-las. Mas lembre-se que nenhum método de transmissão pela internet, ou método de armazenamento eletrônico é 100% seguro e confiável, e não posso garantir sua segurança absoluta.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Links para outros sites",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Este serviço pode conter links para outros sites. Se você clicar em um link de terceiros, será direcionado a esse site. Observe que esses sites externos não são operados por mim. Portanto, recomendo fortemente que você reveja a Política de Privacidade desses sites. Não tenho controle e não assumo nenhuma responsabilidade pelo conteúdo, políticas de privacidade ou práticas de quaisquer sites ou serviços de terceiros.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Privacidade das crianças",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Esses serviços não se dirigem a ninguém com menos de 13 anos. Não recolho intencionalmente informações de identificação pessoal de crianças com menos de 13 anos. No caso de eu descobrir que uma criança menor de 13 anos me forneceu informações pessoais, eu as apago imediatamente de nossos servidores. Se você é um pai ou responsável e sabe que seu filho nos forneceu informações pessoais, entre em contato comigo para que eu possa tomar as medidas necessárias.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Mudanças nesta Política de Privacidade",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Posso atualizar nossa Política de Privacidade de tempos em tempos. Portanto, é recomendável revisar esta página periodicamente para verificar quaisquer alterações. Irei notificá-lo de quaisquer alterações, postando a nova Política de Privacidade nesta página.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Esta política entra em vigor em 18/06/2021",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  Text("Termos e Condições",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Ao baixar ou usar o aplicativo, estes termos se aplicam automaticamente a você - portanto, certifique-se de lê-los com atenção antes de usar o aplicativo. Você não tem permissão para copiar ou modificar o aplicativo, qualquer parte do aplicativo ou nossas marcas registradas de forma alguma. Você não tem permissão para tentar extrair o código-fonte do aplicativo e também não deve tentar traduzir o aplicativo para outros idiomas ou fazer versões derivadas. O aplicativo em si, e todas as marcas, direitos autorais, direitos de banco de dados e outros direitos de propriedade intelectual relacionados a ele, ainda pertencem a Julis Araújo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Julis Araújo tem o compromisso de garantir que o aplicativo seja o mais útil e eficiente possível. Por esse motivo, nos reservamos o direito de fazer alterações no aplicativo ou cobrar por seus serviços, a qualquer momento e por qualquer motivo. Nunca cobraremos pelo aplicativo ou seus serviços sem deixar bem claro para você exatamente o que você está pagando.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "O aplicativo Tô na Ufam armazena e processa os dados pessoais que você nos forneceu, a fim de prestar o meu Serviço. É sua responsabilidade manter o seu telefone e o acesso a aplicativos seguros. Portanto, recomendamos que você não faça jailbreak ou root em seu telefone, que é o processo de remoção de restrições e limitações de software impostas pelo sistema operacional oficial de seu dispositivo. Isso pode tornar o seu telefone vulnerável a malware / vírus / programas maliciosos, comprometer os recursos de segurança do seu telefone e pode significar que o aplicativo Tô na Ufam não funcionará corretamente ou não funcionará de todo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "O aplicativo usa serviços de terceiros que declaram seus próprios Termos e Condições.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Link para os Termos e Condições de provedores de serviços terceirizados usados pelo aplicativo",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• Serviços do Google Play",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• AdMob",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• Google Analytics para Firebase",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "• Firebase Crashlytics",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Você deve estar ciente de que há certas coisas pelas quais Julis Araújo não se responsabiliza. Certas funções do aplicativo exigirão que o aplicativo tenha uma conexão ativa com a Internet. A conexão pode ser wi-fi, ou fornecida pelo seu provedor de rede móvel, mas Julis Araújo não pode se responsabilizar pelo aplicativo não funcionar em todas as suas funções se você não tiver acesso a wi-fi e nem sua cota de dados restante.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Se você estiver usando o aplicativo fora de uma área com Wi-Fi, lembre-se de que os termos do contrato com seu provedor de rede móvel ainda se aplicam. Como resultado, você pode ser cobrado por sua operadora de celular pelo custo dos dados durante a conexão ao acessar o aplicativo ou outras cobranças de terceiros. Ao usar o aplicativo, você aceita a responsabilidade por quaisquer cobranças, incluindo taxas de roaming de dados, se usar o aplicativo fora de seu território (ou seja, região ou país) sem desligar o roaming de dados. Se você não for o pagador de contas do dispositivo no qual está usando o aplicativo, esteja ciente de que presumimos que você recebeu permissão do pagador de contas para usar o aplicativo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Na mesma linha, Julis Araújo nem sempre pode se responsabilizar pela maneira como você usa o aplicativo, ou seja, você precisa se certificar de que seu dispositivo permaneça carregado - se ficar sem bateria e você não conseguir ligá-lo para aproveitar o Serviço, Julis Araújo não pode assumir responsabilidades.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Com relação à responsabilidade de Julis Araújo pelo uso que você faz do aplicativo, quando estiver usando o aplicativo, é importante ter em mente que embora nos esforcemos para que esteja sempre atualizado e correto, contamos com terceiros para forneça informações para que possamos disponibilizá-las para você. Julis Araújo não se responsabiliza por qualquer perda, direta ou indireta, que você experimente como resultado de confiar totalmente nesta funcionalidade do aplicativo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Em algum momento, podemos desejar atualizar o aplicativo. O aplicativo está atualmente disponível no Android - os requisitos do sistema (e para quaisquer sistemas adicionais para os quais decidirmos estender a disponibilidade do aplicativo) podem mudar e você precisará baixar as atualizações se quiser continuar usando o aplicativo. Julis Araújo não promete que sempre atualizará o aplicativo para que seja relevante para você e / ou funcione com a versão Android que você instalou no seu dispositivo. No entanto, você promete sempre aceitar as atualizações do aplicativo quando oferecidas a você. Também podemos desejar interromper o fornecimento do aplicativo e pode encerrar o uso dele a qualquer momento sem aviso prévio de encerramento. A menos que informemos o contrário, em caso de rescisão, (a) os direitos e licenças concedidos a você nestes termos serão encerrados; (b) você deve parar de usar o aplicativo e (se necessário) excluí-lo do dispositivo.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Mudanças nestes Termos e Condições",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Posso atualizar nossos Termos e Condições de tempos em tempos. Portanto, é recomendável revisar esta página periodicamente para verificar quaisquer alterações. Irei notificá-lo de quaisquer alterações, publicando os novos Termos e Condições nesta página.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Estes termos e condições entraram em vigor em 18/06/2021",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text("Contate-Nos",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  SizedBox(height: 5),
                  Text(
                      "Se você tiver dúvidas ou sugestões sobre a minha Política de Privacidade e/ou Termos de Condições, não hesite em entrar em contato comigo pelo e-mail tonaufam@gmail.com.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 13, color: Colors.white60)),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Checkbox(
                    value: check,
                    onChanged: (newValue) {
                      setState(() {
                        check = newValue;
                      });
                    },
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                          "Li e aceito os termos de uso e política de privacidade",
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(fontSize: 13, color: Colors.white60)),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: check == true
                    ? IconButton(
                        icon: Icon(
                          Icons.check_circle_outline,
                          color: Color(0xff13d38e),
                          size: 30,
                        ),
                        onPressed: () {
                          _add();
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: HomeScreen()));
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.check_circle_outline,
                          color: Colors.grey,
                          size: 30,
                        ),
                        onPressed: () {},
                      )),
          ],
        ),
      ),
    );
  }

  Future<File> _getFilebio1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/primeiroanobiologia/primeiroanobiologia.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatabio1() async {
    try {
      final file = await _getFilebio1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatabio1() async {
    String stringlist = json.encode(bio1encode);
    final file = await _getFilebio1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilefis1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/primeiroanofisica/primeiroanofisica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatafis1() async {
    try {
      final file = await _getFilefis1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatafis1() async {
    String stringlist = json.encode(fis1encode);
    final file = await _getFilefis1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilegeo1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/primeiroanogeografia/primeiroanogeografia.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatageo1() async {
    try {
      final file = await _getFilegeo1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatageo1() async {
    String stringlist = json.encode(geo1encode);
    final file = await _getFilegeo1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilehist1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/primeiroanohistoria/primeiroanohistoria.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatahist1() async {
    try {
      final file = await _getFilehist1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatahist1() async {
    String stringlist = json.encode(hist1encode);
    final file = await _getFilehist1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilelit1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/primeiroanoliteratura/primeiroanoliteratura.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatalit1() async {
    try {
      final file = await _getFilelit1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatalit1() async {
    String stringlist = json.encode(lit1encode);
    final file = await _getFilelit1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilemat1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/primeiroanomatematica/primeiroanomatematica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatamat1() async {
    try {
      final file = await _getFilemat1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatamat1() async {
    String stringlist = json.encode(mat1encode);
    final file = await _getFilemat1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFileport1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/primeiroanoportugues/primeiroanoportugues.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataport1() async {
    try {
      final file = await _getFileport1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDataport1() async {
    String stringlist = json.encode(port1encode);
    final file = await _getFileport1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilequim1() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/primeiroanoquimica/primeiroanoquimica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataquim1() async {
    try {
      final file = await _getFilequim1();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDataquim1() async {
    String stringlist = json.encode(quim1encode);
    final file = await _getFilequim1();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilebio2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/segundoanobiologia/segundoanobiologia.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatabio2() async {
    try {
      final file = await _getFilebio2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatabio2() async {
    String stringlist = json.encode(bio2encode);
    final file = await _getFilebio2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilefis2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/segundoanofisica/segundoanofisica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatafis2() async {
    try {
      final file = await _getFilefis2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatafis2() async {
    String stringlist = json.encode(fis2encode);
    final file = await _getFilefis2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilegeo2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/segundoanogeografia/segundoanogeografia.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatageo2() async {
    try {
      final file = await _getFilegeo2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatageo2() async {
    String stringlist = json.encode(geo2encode);
    final file = await _getFilegeo2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilehist2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/segundoanohistoria/segundoanohistoria.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatahist2() async {
    try {
      final file = await _getFilehist2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatahist2() async {
    String stringlist = json.encode(hist2encode);
    final file = await _getFilehist2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilelit2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/segundoanoliteratura/segundoanoliteratura.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatalit2() async {
    try {
      final file = await _getFilelit2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatalit2() async {
    String stringlist = json.encode(lit2encode);
    final file = await _getFilelit2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilemat2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/segundoanomatematica/segundoanomatematica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatamat2() async {
    try {
      final file = await _getFilemat2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatamat2() async {
    String stringlist = json.encode(mat2encode);
    final file = await _getFilemat2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFileport2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/segundoanoportugues/segundoanoportugues.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataport2() async {
    try {
      final file = await _getFileport2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDataport2() async {
    String stringlist = json.encode(port2encode);
    final file = await _getFileport2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilequim2() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/segundoanoquimica/segundoanoquimica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataquim2() async {
    try {
      final file = await _getFilequim2();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDataquim2() async {
    String stringlist = json.encode(quim2encode);
    final file = await _getFilequim2();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilebio3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/terceiroanobiologia/terceiroanobiologia.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatabio3() async {
    try {
      final file = await _getFilebio3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatabio3() async {
    String stringlist = json.encode(bio3encode);
    final file = await _getFilebio3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilefis3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/terceiroanofisica/terceiroanofisica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatafis3() async {
    try {
      final file = await _getFilefis3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatafis3() async {
    String stringlist = json.encode(fis3encode);
    final file = await _getFilefis3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilegeo3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/terceiroanogeografia/terceiroanogeografia.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatageo3() async {
    try {
      final file = await _getFilegeo3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatageo3() async {
    String stringlist = json.encode(geo3encode);
    final file = await _getFilegeo3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilehist3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/terceiroanohistoria/terceiroanohistoria.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatahist3() async {
    try {
      final file = await _getFilehist3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatahist3() async {
    String stringlist = json.encode(hist3encode);
    final file = await _getFilehist3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilelit3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/terceiroanoliteratura/terceiroanoliteratura.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatalit3() async {
    try {
      final file = await _getFilelit3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatalit3() async {
    String stringlist = json.encode(lit3encode);
    final file = await _getFilelit3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilemat3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/terceiroanomatematica/terceiroanomatematica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDatamat3() async {
    try {
      final file = await _getFilemat3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDatamat3() async {
    String stringlist = json.encode(mat3encode);
    final file = await _getFilemat3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFileport3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File(
        "${directory.path}/terceiroanoportugues/terceiroanoportugues.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataport3() async {
    try {
      final file = await _getFileport3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDataport3() async {
    String stringlist = json.encode(port3encode);
    final file = await _getFileport3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFilequim3() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest =
        File("${directory.path}/terceiroanoquimica/terceiroanoquimica.json");
    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<String> _readDataquim3() async {
    try {
      final file = await _getFilequim3();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveDataquim3() async {
    String stringlist = json.encode(quim3encode);
    final file = await _getFilequim3();
    return file.writeAsString(stringlist);
  }

  Future<File> _getFiletags() async {
    final directory = await getApplicationDocumentsDirectory();
    final directoryfoldertest = File("${directory.path}/tagfolder/tag.json");

    if (await directoryfoldertest.exists()) {
      return directoryfoldertest.absolute;
    } else {
      final File directoryfoldertest2 =
          await directoryfoldertest.create(recursive: true);
      return directoryfoldertest2.absolute;
    }
  }

  Future<File> _saveDatatags() async {
    String tag = json.encode(tags);

    final file = await _getFiletags();
    return file.writeAsString(tag);
  }

  Future<String> _readDatatags() async {
    try {
      final file = await _getFiletags();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
