import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/utils/constants.dart';

class DetailsContainer extends StatelessWidget {
  final String selectedCalculation;
  final ScrollController scrollController;
  final double quantity;
  final double costPerUnit;
  final double sellingPricePerUnit;
  final Function(double, double, double) onValueChanged;

  const DetailsContainer({
    Key? key,
    required this.selectedCalculation,
    required this.scrollController,
    required this.quantity,
    required this.costPerUnit,
    required this.sellingPricePerUnit,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedCalculation,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildInputField(
              context: context,
              label: 'Quantidade',
              initialValue: quantity.toString(),
              onChanged: (value) {
                onValueChanged(
                  double.tryParse(value) ?? 0.0,
                  costPerUnit,
                  sellingPricePerUnit,
                );
              },
            ),
            _buildInputField(
              context: context,
              label: 'Custo por Unidade',
              initialValue: costPerUnit.toString(),
              onChanged: (value) {
                onValueChanged(
                  quantity,
                  double.tryParse(value) ?? 0.0,
                  sellingPricePerUnit,
                );
              },
            ),
            _buildInputField(
              context: context,
              label: 'Preço de Venda por Unidade',
              initialValue: sellingPricePerUnit.toString(),
              onChanged: (value) {
                onValueChanged(
                  quantity,
                  costPerUnit,
                  double.tryParse(value) ?? 0.0,
                );
              },
            ),
            const SizedBox(height: 24.0),
            _buildCalculationResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required BuildContext context,
    required String label,
    required String initialValue,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: Colors.white10,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,
        controller: TextEditingController(text: initialValue),
      ),
    );
  }

  Widget _buildCalculationResult() {
    double margin = 0.0;
    if (selectedCalculation == 'Margem de Contribuição') {
      margin = sellingPricePerUnit - costPerUnit;
    } else if (selectedCalculation == 'Margem de Lucro') {
      margin = (sellingPricePerUnit - costPerUnit) / costPerUnit * 100;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resultado: ${selectedCalculation == 'Margem de Lucro' ? '${margin.toStringAsFixed(2)}%' : 'R\$${margin.toStringAsFixed(2)}'}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
