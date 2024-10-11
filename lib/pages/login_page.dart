import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _loginAnimationController;
  bool animated = false;
  bool showlogo = false;
  bool showForm = false;

  @override
  void initState() {
    super.initState();

    _loginAnimationController = AnimationController(vsync: this);

    _loginAnimationController.addListener(() {
      if (_loginAnimationController.value > 0.7) {
        _loginAnimationController.stop();

        animated = true;

        setState(() {
          Future.delayed(const Duration(milliseconds: 700), () {
            showlogo = true;

            setState(() {});
          });
        });

        setState(() {
          Future.delayed(const Duration(milliseconds: 1500), () {
            showForm = true;

            setState(() {});
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: showlogo ? screenHeight / 2 : screenHeight,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF1d4ed8), Color(0xFF3b82f6)]),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(animated ? 40.0 : 0.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Visibility(
                    visible: !animated,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Lottie.asset('assets/loading.json',
                                controller: _loginAnimationController,
                                onLoaded: (composition) {
                                  _loginAnimationController
                                    ..duration = composition.duration
                                    ..forward();
                                }, height: 120.0, width: 120.0),
                          )
                      ),
                    ),
                  ),
                  Visibility(
                    visible: animated,
                    child: AnimatedOpacity(
                      opacity: animated ? 1.0 : 0.0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 230,
                            height: 230,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset('assets/kodiak_logo.png',
                                  height: 190.0, width: 190.0),
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),

            Visibility(
              visible: showForm,
              child: AnimatedOpacity(
                opacity: showForm ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 62),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenHeight / 2,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        padding: const EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 5)
                            ]
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              hintText: 'E-mail'
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        margin: const EdgeInsets.only(top: 32),
                        padding: const EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 5)
                            ]
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.grey,
                              ),
                              hintText: 'Senha'
                          ),
                        ),
                      ),

                      const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16, right: 32
                          ),
                          child: Text(
                            'Esqueceu a senha ?',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                      ),

                      Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: const EdgeInsets.only(top: 20.0),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xFF1d4ed8), Color(0xFF3b82f6)]
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Center(
                            child: Text(
                              'Login'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
