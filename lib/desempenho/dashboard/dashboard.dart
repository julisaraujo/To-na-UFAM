import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

class DashBoard extends StatefulWidget {
  DashBoard(
      {Key key,
      this.primarycolor,
      this.secondarycolor,
      this.materia,
      this.percent1,
      this.percent2,
      this.percent3,
      this.variant,
      this.rendimento,
      this.x1,
      this.x2,
      this.x3,
      this.x4,
      this.x5,
      this.x6,
      this.x7,
      this.x8,
      this.x9,
      this.x10})
      : super(key: key);

  final Color primarycolor;
  final Color secondarycolor;
  final String materia;
  final double percent1;
  final double percent2;
  final double percent3;
  final double variant;
  final int rendimento;
  final double x1;
  final double x2;
  final double x3;
  final double x4;
  final double x5;
  final double x6;
  final double x7;
  final double x8;
  final double x9;
  final double x10;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(widget.materia,
              style: TextStyle(color: Colors.white, fontSize: 17)),
          backgroundColor: Color.fromARGB(150, 42, 46, 50),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        ),
        backgroundColor: Color.fromARGB(100, 42, 46, 50),
        body: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(
                  horizontal: 30
                ),
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromARGB(250, 28, 34, 34),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Matérias",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white60),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularPercentIndicator(
                          radius: 70,
                          lineWidth: 7.0,
                          animation: true,
                          percent: widget.percent1,
                          center: Text(
                            "${(widget.percent1 * 100).round()}%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          footer: Text(
                            "1º ano",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white60),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: widget.primarycolor,
                        ),
                        CircularPercentIndicator(
                          radius: 70,
                          lineWidth: 7.0,
                          animation: true,
                          percent: widget.percent2,
                          center: Text(
                            "${(widget.percent2 * 100).round()}%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          footer: Text(
                            "2º ano",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white60),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: widget.primarycolor,
                        ),
                        CircularPercentIndicator(
                          radius: 70,
                          lineWidth: 7.0,
                          animation: true,
                          percent: widget.percent3,
                          center: Text(
                            "${(widget.percent3 * 100).round()}%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          footer: Text(
                            "3º ano",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white60),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: widget.primarycolor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                height: 120,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(250, 28, 34, 34),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${(widget.variant).round()}%",
                                  style: TextStyle(
                                      color: widget.primarycolor, fontSize: 23),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Variação",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(250, 28, 34, 34),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${(widget.rendimento).round()}%",
                              style:
                                  TextStyle(color: widget.primarycolor, fontSize: 23),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Rendimento",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 3, right: 3, top: 15, bottom: 0),
                margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Color.fromARGB(250, 28, 34, 34),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Comparativo gráfico de resultados",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white60),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                        horizontal: 5
                      ),
                      color: Colors.transparent,
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(
                            touchCallback: (LineTouchResponse touchResponse) {},
                            enabled: true,
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: Colors.transparent,
                                    strokeWidth: 0.5,
                                  ),
                                  FlDotData(
                                    show: false,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                      radius: 0,
                                      color: Colors.transparent,
                                      strokeWidth: 2,
                                      strokeColor: Colors.transparent,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Colors.transparent,
                              tooltipRoundedRadius: 25,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    lineBarSpot.y.toString(),
                                    TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            drawHorizontalLine: true,
                            horizontalInterval: 10
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 12,
                              margin: 4,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return '1';
                                  case 1:
                                    return '2';
                                  case 2:
                                    return '3';
                                  case 3:
                                    return '4';
                                  case 4:
                                    return '5';
                                  case 5:
                                    return '6';
                                  case 6:
                                    return '7';
                                  case 7:
                                    return '8';
                                  case 8:
                                    return '9';
                                  case 9:
                                    return '10';
                                }
                                return '';
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 25,
                              margin: 1,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return '0%';
                                  case 10:
                                    return '10%';
                                  case 20:
                                    return '20%';
                                  case 30:
                                    return '30%';
                                  case 40:
                                    return '40%';
                                  case 50:
                                    return '50%';
                                  case 60:
                                    return '60%';
                                  case 70:
                                    return '70%';
                                  case 80:
                                    return '80%';
                                  case 90:
                                    return '90%';
                                  case 100:
                                    return '100%';
                                }
                                return '';
                              },
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          minX: 0,
                          maxX: 9,
                          minY: 0,
                          maxY: 101,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, widget.x1),
                                FlSpot(1, widget.x2),
                                FlSpot(2, widget.x3),
                                FlSpot(3, widget.x4),
                                FlSpot(4, widget.x5),
                                FlSpot(5, widget.x6),
                                FlSpot(6, widget.x7),
                                FlSpot(7, widget.x8),
                                FlSpot(8, widget.x9),
                                FlSpot(9, widget.x10),
                              ],
                              isCurved: false,
                              colors: [widget.primarycolor],
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                                getDotPainter:
                                    (spot, percent, barData, index) =>
                                        FlDotCirclePainter(
                                  radius: 3,
                                  color: Colors.white,
                                  strokeWidth: 0,
                                ),
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [
                                  widget.primarycolor,
                                  widget.secondarycolor,
                                ],
                                gradientColorStops: [0.5, 1.0],
                                gradientFrom: const Offset(0, 0),
                                gradientTo: const Offset(0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(250, 28, 34, 34),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      )),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      ),
                    child: ExpansionTile(
                      trailing: Icon(Icons.keyboard_arrow_down_sharp,
                          color: Colors.white60),
                      backgroundColor: Color.fromARGB(250, 28, 34, 34),
                      title: Row(
                        children: [
                          Icon(Icons.info_outline,
                              size: 25,
                              color: Colors.white60
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Legenda",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white60),
                          )
                        ],
                      ),
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: 'Matérias: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white60)),
                                      TextSpan(text: 'porcentagem de toda a matéria estudada do 1º, 2º e 3º ano respectivamente.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white60)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: 'Variação: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white60)),
                                      TextSpan(text: 'diferença percentual de acertos entre o último e penúltimo resultados adicionados.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white60)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: 'Rendimento: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white60)),
                                      TextSpan(text: 'percentual de todas as questões corretas de todos os simulados.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white60)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: 'Comparativo gráfico de resultados: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white60)),
                                      TextSpan(text: 'gráfico com todos os últimos dez resultados adicionados.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white60)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  )
                )
              )
            ],
          ),
        ));
  }
}

class DashBoardRedacao extends StatefulWidget {
  DashBoardRedacao(
      {Key key,
      this.primarycolor,
      this.secondarycolor,
      this.materia,
      this.percent3,
      this.variant,
      this.rendimento,
      this.x1,
      this.x2,
      this.x3,
      this.x4,
      this.x5,
      this.x6,
      this.x7,
      this.x8,
      this.x9,
      this.x10})
      : super(key: key);

  final Color primarycolor;
  final Color secondarycolor;
  final String materia;
  final double percent3;
  final double variant;
  final double rendimento;
  final double x1;
  final double x2;
  final double x3;
  final double x4;
  final double x5;
  final double x6;
  final double x7;
  final double x8;
  final double x9;
  final double x10;

  @override
  _DashBoardRedacaoState createState() => _DashBoardRedacaoState();
}

class _DashBoardRedacaoState extends State<DashBoardRedacao> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(widget.materia,
              style: TextStyle(color: Colors.white, fontSize: 17)),
          backgroundColor: Color.fromARGB(150, 42, 46, 50),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        ),
        backgroundColor: Color.fromARGB(100, 42, 46, 50),
        body: Container(
          child: ListView(
            children: [
              Container(
                margin:
                EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                height: 120,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(250, 28, 34, 34),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 70,
                              lineWidth: 7.0,
                              animation: true,
                              percent: widget.percent3,
                              center: Text(
                                "${(widget.percent3 * 100).round()}%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white),
                              ),
                              footer: Text(
                                "3º ano",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white60),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: widget.primarycolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(250, 28, 34, 34),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${(widget.variant).round()}%",
                                  style: TextStyle(
                                      color: widget.primarycolor, fontSize: 23),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Variação",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(250, 28, 34, 34),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${(widget.rendimento).round()}%",
                              style:
                              TextStyle(color: widget.primarycolor, fontSize: 23),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Rendimento",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 3, right: 3, top: 15, bottom: 0),
                margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Color.fromARGB(250, 28, 34, 34),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Comparativo gráfico de resultados",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white60),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                          horizontal: 5
                      ),
                      color: Colors.transparent,
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(
                            touchCallback: (LineTouchResponse touchResponse) {},
                            enabled: true,
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: Colors.transparent,
                                    strokeWidth: 0.5,
                                  ),
                                  FlDotData(
                                    show: false,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                        FlDotCirclePainter(
                                          radius: 0,
                                          color: Colors.transparent,
                                          strokeWidth: 2,
                                          strokeColor: Colors.transparent,
                                        ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Colors.transparent,
                              tooltipRoundedRadius: 25,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    lineBarSpot.y.toString(),
                                    TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            drawHorizontalLine: true,
                            horizontalInterval: 10
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 15,
                              margin: 5,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return '1';
                                  case 1:
                                    return '2';
                                  case 2:
                                    return '3';
                                  case 3:
                                    return '4';
                                  case 4:
                                    return '5';
                                  case 5:
                                    return '6';
                                  case 6:
                                    return '7';
                                  case 7:
                                    return '8';
                                  case 8:
                                    return '9';
                                  case 9:
                                    return '10';
                                }
                                return '';
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 25,
                              margin: 1,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return '0%';
                                  case 10:
                                    return '10%';
                                  case 20:
                                    return '20%';
                                  case 30:
                                    return '30%';
                                  case 40:
                                    return '40%';
                                  case 50:
                                    return '50%';
                                  case 60:
                                    return '60%';
                                  case 70:
                                    return '70%';
                                  case 80:
                                    return '80%';
                                  case 90:
                                    return '90%';
                                  case 100:
                                    return '100%';
                                }
                                return '';
                              },
                            )
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          minX: 0,
                          maxX: 9,
                          minY: 0,
                          maxY: 101,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, widget.x1),
                                FlSpot(1, widget.x2),
                                FlSpot(2, widget.x3),
                                FlSpot(3, widget.x4),
                                FlSpot(4, widget.x5),
                                FlSpot(5, widget.x6),
                                FlSpot(6, widget.x7),
                                FlSpot(7, widget.x8),
                                FlSpot(8, widget.x9),
                                FlSpot(9, widget.x10),
                              ],
                              isCurved: false,
                              colors: [widget.primarycolor],
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                                getDotPainter:
                                    (spot, percent, barData, index) =>
                                    FlDotCirclePainter(
                                      radius: 3,
                                      color: Colors.white,
                                      strokeWidth: 0,
                                    ),
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [
                                  widget.primarycolor,
                                  widget.secondarycolor,
                                ],
                                gradientColorStops: [0.5, 1.0],
                                gradientFrom: const Offset(0, 0),
                                gradientTo: const Offset(0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding:
                  EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(250, 28, 34, 34),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                        )),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                        ),
                      child: ExpansionTile(
                        trailing: Icon(Icons.keyboard_arrow_down_sharp,
                            color: Colors.white60),
                        backgroundColor: Color.fromARGB(250, 28, 34, 34),
                        title: Row(
                          children: [
                            Icon(Icons.info_outline,
                                size: 25,
                                color: Colors.white60
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Legenda",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white60),
                            )
                          ],
                        ),
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10
                              ),
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: '3º ano: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white60)),
                                        TextSpan(text: 'porcentagem de toda a matéria estudada do  3º ano .',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white60)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Variação: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white60)),
                                        TextSpan(text: 'diferença percentual de acertos entre o último e penúltimo resultados adicionados.',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white60)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Rendimento: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white60)),
                                        TextSpan(text: 'percentual de todas as questões corretas de todos os simulados.',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white60)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Comparativo gráfico de resultados: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.white60)),
                                        TextSpan(text: 'gráfico com todos os últimos dez resultados adicionados.',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white60)),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  )
              )
            ],
          ),
        ));
  }
}
