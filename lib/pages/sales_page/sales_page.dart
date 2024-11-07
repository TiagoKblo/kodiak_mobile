import 'package:flutter/material.dart';
import 'package:kodiak/components/app_bar.dart';
import 'package:kodiak/pages/sales_page/bar_chart.dart';

import 'most_purchased_products.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Vendas',
        onBackPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 1,
            child: BarChartSales(),
          ),
          Expanded(
            flex: 1,
            child: MostPurchasedProducts(),
          ),
        ],
      ),
    );
  }
}
