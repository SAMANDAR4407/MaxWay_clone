import 'package:demo_max_way/core/pref.dart';
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/widgets/settings_bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final auth = FirebaseAuth.instance;
  final pref = PrefHelper();

  Future<void> _signOut() async {
    auth.signOut();
  }

  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(context: context, builder: (context) => const CustomBottomSheet());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.language_rounded,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                                'Til',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.notifications_none,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: Text(
                              'Xabarlar',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        CupertinoSwitch(
                          value: light,
                          activeColor: const Color(0xff51267D),
                          onChanged: (value) {
                            light = !light;
                            setState(() {});
                          },
                          dragStartBehavior: DragStartBehavior.start,
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                child: InkWell(
                  onTap: (){
                    showCupertinoDialog(context: context, builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Diqqat!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        content: const Text('Profildan chiqishni xohlaysizmi?', style: TextStyle(fontSize: 14),),
                        actions: [
                          TextButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: const Text('Bekor qilish', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
                          TextButton(onPressed: () {
                            pref.setHasLogged(false);
                            pref.setUserData('','');
                            _signOut().then((value){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage()));
                            });
                          }, child: const Text('Ha', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)))
                        ],
                      );
                    },);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: Text('Chiqish', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
