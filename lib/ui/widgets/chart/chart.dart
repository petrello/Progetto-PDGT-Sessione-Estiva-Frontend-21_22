import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('1', style: style);
        break;
      case 1:
        text = const Text('2', style: style);
        break;
      case 2:
        text = const Text('3', style: style);
        break;
      case 3:
        text = const Text('4', style: style);
        break;
      case 4:
        text = const Text('5', style: style);
        break;
      case 5:
        text = const Text('6', style: style);
        break;
      case 6:
        text = const Text('7', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
  return text;
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
   var style = TextStyle(
    color: const Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 12.sp,
   );

   return Text('', style: style);
}

LineChartData chart(
    bool isHomePage,
    List<FlSpot> spots,
    double minY,
    double maxY,
    bool profit,
    ) {
  List<Color> greenColors = [
    Colors.green.shade900,
    Colors.green.shade700,
  ];
  List<Color> redColors = [
    Colors.red.shade900,
    Colors.red.shade700,
  ];

  return LineChartData(
    backgroundColor: Colors.black,
    gridData: FlGridData(
      show: !isHomePage,
      drawVerticalLine: !isHomePage,
      drawHorizontalLine: true,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: isHomePage
      ? FlTitlesData(show: false)
      : FlTitlesData(
      show: true,
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),),
      bottomTitles: AxisTitles(sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 28,
        //interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      ),),
      leftTitles: AxisTitles(sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,
        getTitlesWidget: leftTitleWidgets,
        ),),
    ),
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              return LineTooltipItem(
                flSpot.y
                    .toStringAsFixed(2)
                    .replaceFirst('.', ',')
                    .replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.'),
                GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  letterSpacing: 0.5,
                ),
              );
            }).toList();
          }),
    ),
    /*minX: 0,
    maxX: 6,
    minY: minY,
    maxY: maxY,*/
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        gradient: LinearGradient(
          colors: profit ? greenColors : redColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: profit
                ? greenColors.map((color) => color.withOpacity(0.3)).toList()
                : redColors.map((color) => color.withOpacity(0.3)).toList(),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    ],
  );
}
