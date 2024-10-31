import 'package:flutter/material.dart';
import 'package:kodiak/utils/constants.dart';

class MostPurchasedProducts extends StatelessWidget {
  const MostPurchasedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                color: Color(darkBlue),
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
              thumbColor: const Color(lightBlue),
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
                            colors: [Color(darkBlue), Color(lightBlue)]),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(white),
                            ),
                          ),
                          ...List.generate(
                            4,
                            (i) => Text(
                              'Info ${i + 1}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(white),
                              ),
                            ),
                          ),
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
    );
  }
}
