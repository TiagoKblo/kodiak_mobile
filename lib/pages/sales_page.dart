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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: BarChartSales(),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    left: 16,
                    right: 16,
                    child: Text(
                      'Produtos mais vendidos',
                      style: TextStyle(
                        color: Color(0xFF143c8c),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: RawScrollbar(
                      thumbVisibility: true,
                      thickness: 8,
                      radius: const Radius.circular(15),
                      thumbColor: const Color(0xFF398cbf),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              padding: const EdgeInsets.all(16),
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
                                      offset: const Offset(0, 3))
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  ...List.generate(
                                      4,
                                      (i) => Text(
                                            'Info ${i + 1}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          )),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
