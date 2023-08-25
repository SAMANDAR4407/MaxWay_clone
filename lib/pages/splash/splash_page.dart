import 'package:demo_max_way/core/pref.dart';
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/pages/language/lang_option_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final pref = PrefHelper();
  bool hasLang = false;

  Future<void> next() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    hasLang = await pref.hasLang();
  }

  @override
  void initState() {
    next().then((value) {
      if(hasLang){
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) =>  const HostPage()));
      } else {
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) =>  const LangOptionPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF51267D),
      body: Center(
        child: SizedBox(
            height: 300,
            child: Image.asset('assets/images/icon.png')
        ),
      ),
    );
  }
}
