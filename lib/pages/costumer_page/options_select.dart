import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/http/get_all_customers.dart';
import 'package:kodiak/models/all_customers.dart';

class OptionsSelect extends StatefulWidget {
  final String optionSelected;
  final Function() onTap;

  const OptionsSelect({
    super.key,
    required this.optionSelected,
    required this.onTap,
  });

  @override
  State<OptionsSelect> createState() => _OptionsSelectState();
}

class _OptionsSelectState extends State<OptionsSelect> {
  late Future<AllCustomers> _allCustomers;

  @override
  void initState() {
    super.initState();
    _allCustomers = getAllCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _allCustomers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          AllCustomers allCustomers = snapshot.data!;
          return GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: const Color(0xffe4e4e7)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      widget.optionSelected,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          );
        }

        return const Center(child: Text('Nenhum cliente encontrado.'));
      },
    );
  }
}
