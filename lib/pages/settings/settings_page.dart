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

                    showDialog(context: context, builder: (context) {
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width*0.13,
                            vertical: MediaQuery.of(context).size.height*0.38
                        ),
                        child: Material(
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Text(
                                    'Diqqat!',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const Text(
                                  'Profildan chiqishni xohlaysizmi?', textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                ),
                                const Expanded(child: SizedBox()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Material(
                                          borderRadius: BorderRadius.circular(10),
                                          clipBehavior: Clip.antiAlias,
                                          color: Colors.grey[200],
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                  padding: const EdgeInsets.all(12),
                                                  child: const Center(
                                                      child: Text('Bekor qilish', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Material(
                                          borderRadius: BorderRadius.circular(10),
                                          clipBehavior: Clip.antiAlias,
                                          color: const Color(0xff51267D),
                                          child: InkWell(
                                              onTap: () {
                                                pref.setHasLogged(false);
                                                pref.setUserData('','');
                                                _signOut().then((value){
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage()));
                                                });
                                              },
                                              child: Container(
                                                  padding: const EdgeInsets.all(12),
                                                  child: const Center(
                                                      child: Text('Ha', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
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
