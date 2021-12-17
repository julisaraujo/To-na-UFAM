import 'package:flutter/material.dart';

class InfoPSC extends StatefulWidget {
  @override
  _InfoPSCState createState() => _InfoPSCState();
}

class _InfoPSCState extends State<InfoPSC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 14,
        title: Text("Informações",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Text(
            "Informações sobre PSC",
            style: TextStyle(color: Colors.white, fontSize: 25),
            maxLines: 2,
          ),
          CardInfoPSC(
            "Como é calculada a nota do PSC?",
            "Cada etapa (ano) é composta de uma prova com 54 (cinquenta e quatro) questões, todas valendo 1 (um) ponto cada, com peso 3 (três) e uma Prova de Redação valendo 9 (nove) pontos, com peso 6 (seis) totalizando 540 pontos.\n"
                "Por exemplo: João fez as provas do PSC durante os anos de 2014,2015 e 2016. Em 2014 acertou 25 questões, em 2015 acertou 23 e em 2016 acertou 26 questões e tirou 6 pontos em sua redação. Qual será a nota de João?\n"
                "Nota de João = (25x3) + (23x3) + (26x3) + (6x9) = 75+ 69 + 78 + 54 = 276\n"
                "João tirou 276 pontos no PSC.",
          ),
          CardInfoPSC(
              "Em que cota me encaixo?",
              "Primeiro é necessário saber em que rede de ensino você cursou o ensino médio. Se você cursou parcial ou integralmente em rede particular, você automaticamente concorre a vagas pelo PSC na ampla concorrência.\n"
                  "Já para os alunos que cursaram INTEGRALMENTE em rede pública é necessário saber a renda de sua família e a cor com qual se identifica. Abaixo estão as cotas e suas respectivas definições:\n"
                  "PPI1 – Candidatos que se autodeclararam pretos, pardos ou indígenas, e com renda familiar bruta igual ou inferior a 1,5(um, vírgula cinco) salários mínimos per capita.\n"
                  "NDC1 - Candidatos que  NÃO se autodeclararam pretos, pardos ou indígenas, e com renda familiar bruta igual ou inferior a 1,5(um, vírgula cinco) salários mínimos per capita.\n"
                  "PPI2 – Candidatos que se autodeclararam pretos, pardos ou indígenas, independentemente de renda.\n"
                  "NDC2 - Candidatos que NÃO se autodeclararam pretos, pardos ou indígenas, independentemente de renda."),
          CardInfoPSC(
              "Já sei em que cota me encaixo, mas não sei como funciona o cálculo da renda per capita",
              "Essa é uma questão que muitas vezes deixa os alunos enrolados na hora de fazer a matrícula, mas é bem simples de se resolver. O cálculo é feito somando a renda das pessoas que trabalham em sua residência dividido pelo número total de pessoas que a habitam.\n"
                  "Para explicar vamos tomar como exemplo novamente o João:\n"
                  "Além de João, em sua casa mora seu pai, sua mãe e mais dois irmãos mais novos totalizando 5 pessoas. Na residência de João somente seu pai e sua mãe trabalham, onde ele recebe mensalmente R\$ 1.000,00 (mil reais) e ela recebe R\$ 1.500,00 (mil e quinhentos reais) totalizando R\$ 2.500,00 (dois mil e quinhentos reais).\n"
                  "O cálculo da renda per capita da família de João é:\n"
                  "2500/5 = 500.\n"
                  "Como atualmente o salário mínimo está orçado em R\$1.100(mil e cem reais), 1,5 salários mínimos é igual a R\$1.650 (mil seiscentos e cinquenta reais).\n"
                  "Ou seja, como 500 é menor que 1650, a renda per capita da família de João se encaixa nas cotas PPI1 e NDC1 (as cotas que precisam de comprovação de renda)."),
          CardInfoPSC(
              "Consultei as informações do curso que desejo e a relação candidatos/vagas dos últimos anos é muito alta, e agora?",
              "Calma, não se desespere. Nem sempre cursos com alta competitividade por vagas significa que todos os candidatos possuem notas suficientes para estar figurando entre os primeiros colocados depois dos aprovados. Além das relações candidatos/vagas que é consultada no aplicativo, busque sempre ver as listas de aprovados dos anos anteriores disponíveis no site da COMPEC. Vamos ver um exemplo:\n"
                  "Em 2017 o curso de Arquitetura e Urbanismo ofereceu 12 vagas para a ampla concorrência e tínhamos 146 candidatos concorrendo por essas vagas. Ou seja, relação de 146/12.\n"
                  "Analisando a lista de aprovados, vemos que o 12º colocado obteve 276 pontos. Ou seja, aparentemente essa foi a nota de corte do curso nesse ano. Mas se analisarmos um pouco mais a fundo, desconsiderando os aprovados (12 primeiros), vê-se que apenas 5 notas foram superiores a 260 pontos (13º ao 17º colocado). Esses 5 candidatos ainda estariam aptos a serem aprovados caso houvesse 2ª chamada, visto que suas notas não foram muito inferiores aos primeiros colocados."),
          CardInfoPSC(
              "Fiquei de fora da lista de aprovados, e agora?",
              "Relaxe, ainda não é hora de cogitar fazer um novo vestibular. Todas as vagas do PSC nunca são preenchidas na primeira chamada de matrículas. Muitos alunos também passam para o curso que desejam na UFAM através do Enem e optam por fazer a matrícula através desse vestibular. Outros que fizeram o PSC, também prestaram os vestibulares que a UEA oferece (SIS e Macro)  foram aprovados e optaram por cursar sua graduação nela, além de outros motivos que levam o aluno a desistir de sua matrícula através do PSC.\n"
                  "Por isso, caso você esteja figurando entre os primeiros colocados depois dos aprovados e acha que sua nota vai ser suficiente para ser aprovado, sempre fique de olho nas próximas chamadas que a UFAM pode ter (2ª, 3ª, 4ª... podem ser inúmeras chamadas).\n"
                  "Relembrando o exemplo da questão anterior, dos 5 alunos que estavam com notas superiores a 260 pontos, os 4 primeiros foram chamados na 2ª chamada da UFAM."),
          CardInfoPSC(
              "Entrei na UFAM mas não é o curso que eu gostaria, o que eu faço?",
              "Internamente a UFAM possui o Processo Seletivo Extramacro (PSE) que oferta vagas ociosas dos seus cursos de graduação para algumas modalidades de alunos. Uma dessas modalidades é interessante a você que deseja mudar de curso já dentro da UFAM. Ela é chamada de Reopção de Curso (RC), que consiste na movimentação acadêmica, dentro da UFAM, do aluno regular de um curso de graduação para outro na MESMA ÁREA DE CONHECIMENTO. Por exemplo, caso você tenha passado para Engenharia Produção e deseja cursar Engenharia de Civil, você deve fazer o PSE optando por essa modalidade.\n"
                  "Mas de onde surgem essas vagas? Elas são oriundas da desistência, jubilamento (quando o aluno não conclui o curso no tempo máximo proposto pela universidade), óbito, transferência ou exclusão por processo disciplinar. Consequentemente o número de vagas ofertadas por curso a cada ano é bem variante. Temos como exemplo disso o curso de Medicina: em 2018 foram ofertadas apenas 2 vagas e em 2019 foram 7 vagas."),
          Text(
            "Informações sobre o aplicativo",
            style: TextStyle(color: Colors.white, fontSize: 25),
            maxLines: 2,
          ),
          CardInfoPSC(
              "Como é calculada a projeção de questões do aplicativo?",
              "Agora que já vimos como é calculada a nota do PSC, vamos ver como é calculada a projeção de questões do aplicativo. Antes de tudo é importante saber que a nota da redação é fixada em 7. Visto isso vamos ao que importa.\n"
              "Após a escolha do curso desejado, é identificado qual é a maior nota de corte entre os anos de 2014 e 2020. Subtraímos desta nota 54. Mas porque 54? É a multiplicação entre o peso e a nota da redação (7x9=54). O resultado dessa subtração é dividido por 9 Mas porque 9? A multiplicação entre o peso das questões e quantidade de etapas do PSC (3x3=9).\n"
                  "O resultado dessa expressão é a média de questões anuais a serem acertadas. Vamos a um exemplo para ficar mais claro:\n"
                  "Temos a ampla concorrência do curso de medicina com as notas 342, 378, 321,357, 357,366 e 378 para os anos de 2014, 2015, 2016, 2017, 2018, 2019 e 20220, respectivamente.\n"
                  "A maior nota dessas é 378. Utilizando os cálculos anteriores temos: 378-54= 324. 324/9= 36.\n"
                  "É necessário acertar 36 questões por ano e tirar nota 7 na redação.\n"
                  "*Como o próprio nome diz, a projeção de notas é apenas uma projeção e não algo concreto. Ela é baseada nas notas de corte dos anteriores do PSC e essas notas variam com o decorrer das próximas provas. Além disso, existem inúmeras combinações possíveis para realizar o cálculo da projeção de questões, no aplicativo em questão foi utilizada a combinação em que a nota de redação foi 7.\n"
                  "Portanto, o desenvolvedor se ausenta de quaisquer diferenças na comparação entre a projeção de questões e as futuras notas de corte do PSC."
          ),
          CardInfoPSC(
              "Cursos de Engenharia de Software e Sistema de Informação.",
              "Em 2018 o curso de Sistema de Informações foi substituído pelo curso de Engenharia de Software. Portanto, ao selecionar Engenharia de Software (independente da cota), de 2014 a 2017 as notas são referentes ao curso de Sistema de Informações e de 2018 a 2020 referentes a Engenharia de Software."
          )
        ],
      ),
    );
  }
}

class CardInfoPSC extends StatelessWidget {
  final String title;
  final String body;

  CardInfoPSC(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(150, 42, 46, 50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            body,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
