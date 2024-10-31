import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/components/app_bar.dart';
import 'package:kodiak/pages/costumer_page/datails_container.dart';
import 'package:kodiak/pages/costumer_page/options_select.dart';
import 'package:kodiak/utils/constants.dart';

class CostumerPage extends StatefulWidget {
  const CostumerPage({super.key});

  @override
  _CostumerPageState createState() => _CostumerPageState();
}

class _CostumerPageState extends State<CostumerPage> {
  String _optionSelected = 'Selecionar uma opção';
  bool _showDetails = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Clientes',
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
                optionSelected: _optionSelected,
                scrollController: _scrollController,
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
          child: OptionsSelect(
              optionSelected: _optionSelected,
              onTap: () {
                _showOptions(context);
              }),
        ),
      ],
    );
  }

  void _showOptions(BuildContext context) async {
    final options = [
      'Cliente 1',
      'Cliente 2',
      'Cliente 3',
      'Cliente 4',
      'Cliente 5',
      'Cliente 6',
      'Cliente 7',
      'Cliente 8',
    ];

    final option = await showModalBottomSheet<String>(
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
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 2.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 1))
                    ],
                  ),
                  child: ListTile(
                    leading: const Icon(
                      CupertinoIcons.building_2_fill,
                      color: Color(darkBlue),
                    ),
                    title: Text(
                      options[index],
                      style: const TextStyle(
                        color: Color(darkBlue),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(
                      _optionSelected == options[index]
                          ? CupertinoIcons.check_mark_circled
                          : CupertinoIcons.circle,
                      color: const Color(darkBlue),
                      size: 18,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 24.0),
                    onTap: () => Navigator.pop(context, options[index]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );

    if (option != null) {
      setState(() {
        _optionSelected = option;
        _showDetails = true;
      });
    }
  }
}
