import 'package:demo_max_way/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  Future<void> next() async {
    await Future.delayed(const Duration(milliseconds: 2000));
  }

  @override
  void initState() {
    next().then((value) {
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => const HomePage(isFirst: true)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF51267D),
      body: Center(
        child: SizedBox(
            height: 200,
            child: Image.asset('assets/images/icon.png')
        ),
      ),
    );
  }
}
