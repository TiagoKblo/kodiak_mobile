import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DetailsContainer extends StatelessWidget {
  final String optionSelected;
  final ScrollController scrollController;

  const DetailsContainer(
      {super.key,
      required this.optionSelected,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(darkBlue),
            Color(lightBlue),
          ],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, -1))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          children: [
            _buildDetailsHeader(),
            _buildMostPurchasedProducts(),
            const SizedBox(height: 24.0),
            _buildLatestSales(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sobre:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 4.0),
        Text(
          optionSelected,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                indent: 8,
                endIndent: 8,
              ),
            )
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }

  Widget _buildMostPurchasedProducts() {
    return _buildScrollableContainer(
      title: _buildScrollableContainerTitle(
        icon: CupertinoIcons.cube_fill,
        title: 'Produtos mais comprados',
      ),
      list: Column(
        children: List.generate(8, (index) {
          return ListTile(
            title: Text('Produto ${index + 1}'),
            subtitle: Text('Descrição ${index + 1}'),
          );
        }),
      ),
    );
  }

  Widget _buildLatestSales() {
    return _buildScrollableContainer(
      title: _buildScrollableContainerTitle(
        icon: CupertinoIcons.bag_fill,
        title: 'Últimas compras',
      ),
      list: Column(children: [
        ...List.generate(5, (index) {
          return ListTile(
            title: Text('Compra ${index + 1}'),
            trailing: Text(
              'Valor: R\$${(index + 1) * 1000}',
              style: const TextStyle(fontSize: 14),
            ),
          );
        }),
        const Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 8,
              endIndent: 8,
            ),
          )
        ]),
        const ListTile(
          title: Text('Total comprado:'),
          trailing: Text('Valor: R\$15.000', style: TextStyle(fontSize: 14)),
        ),
      ]),
    );
  }

  Widget _buildScrollableContainer(
      {required Widget title, required Widget list}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 5))
          ],
        ),
        child: RawScrollbar(
          thumbVisibility: true,
          thickness: 8,
          radius: const Radius.circular(15),
          thumbColor: const Color(lightBlue),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  list,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableContainerTitle(
      {required IconData icon, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: const Color(darkBlue),
          size: 18,
        ),
        const SizedBox(width: 8.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(darkBlue),
          ),
        ),
      ],
    );
  }
}
