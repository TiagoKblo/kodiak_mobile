import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/components/app_bar.dart';
import 'package:kodiak/pages/calculator_page/details_container.dart';
import 'package:kodiak/utils/constants.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _selectedCalculation = 'Selecionar cálculo';
  bool _showDetails = false;
  final ScrollController _scrollController = ScrollController();
  double _quantity = 0.0;
  double _costPerUnit = 0.0;
  double _sellingPricePerUnit = 0.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Calculadora',
          onBackPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        body: Stack(
          children: [
            _buildOptionsSelect(),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: _showDetails ? 90 : MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              bottom: 0,
              child: DetailsContainer(
                selectedCalculation: _selectedCalculation,
                scrollController: _scrollController,
                quantity: _quantity,
                costPerUnit: _costPerUnit,
                sellingPricePerUnit: _sellingPricePerUnit,
                onValueChanged: (quantity, cost, sellingPrice) {
                  setState(() {
                    _quantity = quantity;
                    _costPerUnit = cost;
                    _sellingPricePerUnit = sellingPrice;
                  });
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildOptionsSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              _showOptions(context);
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                _selectedCalculation,
                style: const TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(darkBlue),
                Color(lightBlue),
              ],
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Margem de Lucro',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.pop(context, 'Margem de Contribuição');
                },
              ),
              ListTile(
                title: const Text(
                  'Markup',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.pop(context, 'Margem de Lucro');
                },
              ),
            ],
          ),
        );
      },
    ).then((selectedOption) {
      if (selectedOption != null) {
        setState(() {
          _selectedCalculation = selectedOption;
          _showDetails = true;
        });
      }
    });
  }
}
