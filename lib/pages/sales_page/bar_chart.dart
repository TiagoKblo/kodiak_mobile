import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/http/sales_by_day_of_the_last_week.dart';
import 'package:kodiak/models/sales_by_day_of_the_last_week.dart';

class BarChartSales extends StatefulWidget {
  const BarChartSales({super.key});

  @override
  State<BarChartSales> createState() => _BarChartSalesState();
}

class _BarChartSalesState extends State<BarChartSales> {
  late List<BarChartGroupData> rawBarGroups = [];
  late List<BarChartGroupData> showingBarGroups = [];
  late List<String> weekDays = [];
  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    fetchSalesData();
  }

  Future<void> fetchSalesData() async {
    try {
      SalesByDayOfTheLastWeek salesData = await getSalesByDayOfTheLastWeek();
      setState(() {
        weekDays = salesData.salesByDayOfTheLastWeek
            .map((sales) => sales.dayOfWeek)
            .toList();
        showingBarGroups = salesData.salesByDayOfTheLastWeek
            .asMap()
            .entries
            .map((entry) =>
                makeGroupData(entry.key, entry.value.salesCount.toDouble()))
            .toList()
            .reversed
            .toList();
      });
    } catch (e) {
      print('Erro ao carregar dados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF143c8c),
                    Color(0xFF398cbf),
                  ]),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 5))
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Vendas',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 38),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        barTouchData: barTouchData,
                        titlesData: titlesData,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: showingBarGroups,
                        gridData: const FlGridData(show: false),
                        alignment: BarChartAlignment.spaceAround,
                        maxY: showingBarGroups.isNotEmpty
                            ? showingBarGroups
                                    .map((group) => group.barRods[0].toY)
                                    .reduce((a, b) => a > b ? a : b) *
                                1.3
                            : 500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12)
                ],
              ),
            ),
          )),
    );
  }

  FlTitlesData get titlesData {
    double maxSales = showingBarGroups.isNotEmpty
        ? showingBarGroups
            .map((group) => group.barRods[0].toY)
            .reduce((a, b) => a > b ? a : b)
        : 0;

    double intervals = 100;
    double interval = (maxSales / intervals).ceil().toDouble();

    return FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: bottomTitles,
          reservedSize: 42,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 28,
          interval: intervals,
          getTitlesWidget: (value, meta) => leftTitles(value, meta, intervals),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta, double interval) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    if (value % interval == 0) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 0,
        child: Text(value.toInt().toString(), style: style),
      );
    }

    return Container();
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    if (value.toInt() < weekDays.length) {
      String title = weekDays[value.toInt()].substring(0, 3);

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16, //margin top
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );
    }

    return Container();
  }
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (group) => Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (BarChartGroupData group, int groupIndex,
            BarChartRodData rod, int rodIndex) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

BarChartGroupData makeGroupData(int x, double y1) {
  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(toY: y1, color: Colors.white, width: 16),
    ],
    showingTooltipIndicators: [0],
  );
}
