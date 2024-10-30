import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CostumerPage extends StatefulWidget {
  const CostumerPage({super.key});

  @override
  _CostumerPageState createState() => _CostumerPageState();
}

class _CostumerPageState extends State<CostumerPage> {
  String _optionSelected = 'Selecionar uma opção';
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height / 12,
          leadingWidth: 90,
          leading: Container(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Row(
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
              ],
            ),
          ),
          title: const Text(
            'Clientes',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showOptions(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Color(0xffe4e4e7)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              _optionSelected,
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
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: _showDetails ? 90 : MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF143c8c),
                        Color(0xFF398cbf),
                      ]),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, -1))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 24.0),
                  child: Column(
                    children: [
                      Expanded(
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sobre:',
                                        style: TextStyle(
                                          color: Color(0xFF143c8c),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        _optionSelected,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
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
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                CupertinoIcons.cube_fill,
                                                color: Color(0xFF143c8c),
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              Text(
                                                'Produtos mais comprados',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF143c8c),
                                                ),
                                              ),
                                            ],
                                          ),
                                          ListTile(
                                            title: Text('Produto 1'),
                                            subtitle: Text('Descrição 1'),
                                          ),
                                          ListTile(
                                            title: Text('Produto 2'),
                                            subtitle: Text('Descrição 2'),
                                          ),
                                          ListTile(
                                            title: Text('Produto 3'),
                                            subtitle: Text('Descrição 3'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Expanded(
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: const SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                CupertinoIcons.bag_fill,
                                                color: Color(0xFF143c8c),
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              Text(
                                                'Últimas compras',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF143c8c),
                                                ),
                                              ),
                                            ],
                                          ),
                                          ListTile(
                                            title: Text('Compra 1'),
                                            trailing: Text(
                                              'Valor: R\$2.000',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text('Compra 2'),
                                            trailing: Text(
                                              'Valor: R\$5.500',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text('Compra 3'),
                                            trailing: Text(
                                              'Valor: R\$3.000',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Divider(
                                                  color: Colors.grey,
                                                  thickness: 1,
                                                  indent: 8,
                                                  endIndent: 8,
                                                ),
                                              )
                                            ],
                                          ),
                                          ListTile(
                                            title: Text('Total comprado:'),
                                            trailing: Text(
                                              'Valor: R\$10.500',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
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
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF143c8c),
                          Color(0xFF398cbf),
                        ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      options[index],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    trailing: Icon(
                      _optionSelected == options[index]
                          ? CupertinoIcons.check_mark_circled
                          : CupertinoIcons.circle,
                      color: Colors.white,
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
