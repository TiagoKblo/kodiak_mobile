import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/components/app_bar.dart';
import 'package:kodiak/http/get_all_customers.dart';
import 'package:kodiak/models/all_customers.dart';
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
<<<<<<< HEAD
  late Future<List<String>> _allCustomersFuture;
  List<String> _allCustomers = [];
  List<String> _filteredOptions = [];
  String _searchQuery = "";
=======
  late Future<List<Customer>> _allCustomersFuture;
  List<Customer> _allCustomers = [];
  List<Customer> _filteredOptions = [];
  String _searchQuery = "";
  int _idCustomer = 0;
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b

  @override
  void initState() {
    super.initState();
    _allCustomersFuture = handleAllCustomers();
  }

<<<<<<< HEAD
  Future<List<String>> handleAllCustomers() async {
    final AllCustomers allCustomers = await getAllCustomers();
    _allCustomers = allCustomers.allCustomers
        .map((customer) => customer.companyName)
        .toList();
=======
  Future<List<Customer>> handleAllCustomers() async {
    final AllCustomers allCustomers = await getAllCustomers();
    _allCustomers = allCustomers.allCustomers;
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
    _filteredOptions = List.from(_allCustomers);
    return _allCustomers;
  }

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
<<<<<<< HEAD
                optionSelected: _optionSelected,
                scrollController: _scrollController,
=======
                scrollController: _scrollController,
                idCustomer: _idCustomer,
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
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
    await _allCustomersFuture;

<<<<<<< HEAD
    showModalBottomSheet<String>(
=======
    showModalBottomSheet<Customer>(
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
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
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setModalState(() {
                        _searchQuery = value;
                        _filteredOptions = _allCustomers
<<<<<<< HEAD
                            .where((customer) => customer
=======
                            .where((customer) => customer.companyName
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
                                .toLowerCase()
                                .contains(_searchQuery.toLowerCase()))
                            .toList();
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar...',
                      prefixIcon:
                          Icon(CupertinoIcons.search, color: Color(darkBlue)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      filled: true,
                      fillColor: Color(white),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredOptions.length,
                      itemBuilder: (context, index) {
<<<<<<< HEAD
=======
                        final customer = _filteredOptions[index];
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 2.0),
                          decoration: const BoxDecoration(
                            color: Color(white),
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
<<<<<<< HEAD
                              _filteredOptions[index],
=======
                              customer.companyName,
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
                              style: const TextStyle(
                                color: Color(darkBlue),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Icon(
<<<<<<< HEAD
                              _optionSelected == _filteredOptions[index]
=======
                              _optionSelected == customer.companyName
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
                                  ? CupertinoIcons.check_mark_circled
                                  : CupertinoIcons.circle,
                              color: const Color(darkBlue),
                              size: 18,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
<<<<<<< HEAD
                            onTap: () =>
                                Navigator.pop(context, _filteredOptions[index]),
=======
                            onTap: () => Navigator.pop(context, customer),
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    ).then((selectedOption) {
      setState(() {
        _searchQuery = "";
        _filteredOptions = List.from(_allCustomers);
      });

      if (selectedOption != null) {
        setState(() {
<<<<<<< HEAD
          _optionSelected = selectedOption;
=======
          _optionSelected = selectedOption.companyName;
          _idCustomer = selectedOption.idCustomer;
>>>>>>> 1b761c1d20bb69739a6dc90e39b00c7287d1b64b
          _showDetails = true;
        });
      }
    });
  }
}
