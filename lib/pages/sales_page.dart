import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/components/bar_chart.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 12,
        leadingWidth: 90,
        leading: Container(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Row(
              children: [
                Icon(
                  CupertinoIcons.chevron_left,
                  color: Colors.white,
                ),
                Text(
                  'Voltar',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF143c8c),
                    Color(0xFF398cbf),
                  ]),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 5))
              ]),
        ),
        title: Text(
          'Vendas',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: BarChartSales(),
    );
  }
}
