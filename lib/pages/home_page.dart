import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: const Color(0xFFf1faee),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1d4ed8),
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
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.arrow_right_to_line,
                      size: 30,
                      color: const Color(0xFFf1faee),
                    ),
                  )),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(140.0),
          child: Container(
            padding: const EdgeInsets.only(left: 30.0, bottom: 30.0),
            child: Row(
              children: [
                const Stack(
                  children: [
                    CircleAvatar(
                      radius: 56.0,
                      backgroundColor: const Color(0xFFf1faee),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.name ?? 'Usuário',
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFf1faee)),
                      ),
                      Text(
                        user?.tradeName ?? 'Empresa',
                        style: const TextStyle(fontSize: 16, color: Color(0xFFf1faee)),
                      ),
                      Text(
                        user?.position ??'Vendedor',
                        style: const TextStyle(fontSize: 16, color: Color(0xFFf1faee)),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSquareButton(CupertinoIcons.bag_fill, 'Vendas', () {}),
                    buildSquareButton(CupertinoIcons.bag_fill, 'Vendas', () {})
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSquareButton(CupertinoIcons.bag_fill, 'Vendas', () {}),
                    buildSquareButton(CupertinoIcons.bag_fill, 'Vendas', () {})
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSquareButton(CupertinoIcons.bag_fill, 'Vendas', () {}),
                    buildSquareButton(CupertinoIcons.bag_fill, 'Vendas', () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     height: 80,
      //     decoration: BoxDecoration(
      //       color: Color(0xFF1d4ed8),
      //       borderRadius: BorderRadius.all(Radius.circular(30))),
      //     child: Row(
      //       children: [
      //         Expanded(child: InkWell(
      //           onTap: () {},
      //           child: Icon(
      //             CupertinoIcons.book_fill,
      //             color: Colors.white,
      //           ),
      //         ),),
      //         Expanded(child: InkWell(
      //           onTap: () {},
      //           child: Icon(
      //             CupertinoIcons.person_crop_circle,
      //             color: Colors.white,
      //           ),
      //         ),),
      //         Expanded(child: InkWell(
      //           onTap: () {},
      //           child: Icon(
      //             CupertinoIcons.arrow_right_to_line,
      //             color: Colors.white,
      //           ),
      //         ),),
      //       ],
      //     ),
      //     ),
      // ),
    );
  }
}

Widget buildSquareButton(IconData icon, String label, VoidCallback onPressed) {
  return Expanded(
      child: AspectRatio(
    aspectRatio: 1,
    child: GestureDetector(
        onTap: onPressed,
        child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF143c8c),
                      Color(0xFF398cbf),
                    ]),
                color: const Color(0xFF1d4ed8),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 5))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 80,
                  color: const Color(0xFFf1faee),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  label,
                  style: const TextStyle(color: const Color(0xFFf1faee), fontSize: 24),
                )
              ],
            ))),
  ));
}
