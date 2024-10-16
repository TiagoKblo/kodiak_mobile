import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d4ed8),
        centerTitle: true,
        // title: const Text('Kodiak', style: TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0))),
        // leading: InkWell(
        //   onTap: () {},
        //   child: const Icon(
        //     Icons.subject,
        //     color: Colors.white,
        //   ),
        // ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: const Padding(padding: EdgeInsets.all(8.0),
        //     child: Icon(
        //       Icons.notifications,
        //       size: 20,
        //     ),),
        //   )
        // ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: Container(
            padding: const EdgeInsets.only(left: 30.0, bottom: 30.0),
            child: Row(
              children: [
                const Stack(
                  children: [
                    CircleAvatar(
                      radius: 32.0,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person_outline_rounded),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Usuário',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        'usuario@email.com',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text(
                        'Vendedor',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 64.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 5)
                            ]),
                        child: Stack(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 64.0,
                                  height: 64.0,
                                  alignment: Alignment.centerLeft,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF1d4ed8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Icon(CupertinoIcons.bag_fill, color: Colors.white,)),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Vendas",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox.expand(
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  onTap: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 64.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 5)
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF1d4ed8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Icon(CupertinoIcons.bag_fill, color: Colors.white,)),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Vendas",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox.expand(
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 64.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 5)
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF1d4ed8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Icon(CupertinoIcons.bag_fill, color: Colors.white,)),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Vendas",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox.expand(
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 64.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 5)
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF1d4ed8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Icon(CupertinoIcons.bag_fill, color: Colors.white,)),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Vendas",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox.expand(
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 64.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 5)
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF1d4ed8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Icon(CupertinoIcons.bag_fill, color: Colors.white,)),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Vendas",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox.expand(
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 64.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 5)
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF1d4ed8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Icon(CupertinoIcons.bag_fill, color: Colors.white,)),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Vendas",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox.expand(
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 64.0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, blurRadius: 5)
                                ]),
                            child: Stack(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF1d4ed8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Icon(CupertinoIcons.bag_fill, color: Colors.white,)),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Vendas",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox.expand(
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF1d4ed8),
            borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: [
              Expanded(child: InkWell(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.book_fill,
                  color: Colors.white,
                ),
              ),),
              Expanded(child: InkWell(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.person_crop_circle,
                  color: Colors.white,
                ),
              ),),
              Expanded(child: InkWell(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.arrow_right_to_line,
                  color: Colors.white,
                ),
              ),),
            ],
          ),
          ),
      ),
    );
  }
}
