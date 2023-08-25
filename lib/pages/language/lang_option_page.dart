import 'package:demo_max_way/core/pref.dart';
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LangOptionPage extends StatelessWidget {
  const LangOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pref = PrefHelper();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.asset('assets/images/maxway.png'),
            ),
            const SizedBox(height: 60,),
            const Text('Выберите язык:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            const SizedBox(height: 14,),
            Material(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  pref.setLang('uz');
                  pref.setHasLang(true);
                  showSnackBar('Language : uz', context);
                  Future.delayed(const Duration(milliseconds: 200));
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => const HostPage()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(
                            'assets/images/uzb.png',
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "O'zbekcha",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14,),
            Material(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  pref.setLang('ru');
                  pref.setHasLang(true);
                  showSnackBar('Language : ru', context);
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => const HostPage()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(
                            'assets/images/rus.png',
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Русский",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14,),
            Material(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  pref.setLang('en');
                  pref.setHasLang(true);
                  showSnackBar('Language : en', context);
                  Future.delayed(const Duration(milliseconds: 200));
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => const HostPage()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(
                            'assets/images/eng.png',
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "English",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
