
import 'package:flutter/material.dart';

import '../core/pref.dart';
class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final pref = PrefHelper();
  var language = '';

  void load() async {
    language = await pref.getLang();
  }

  bool isRusClicked = false;
  bool isUzClicked = false;
  bool isEngClicked = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      load();
      setState(() {});
    });
    isUzClicked = language == 'uz'? true: false;
    isRusClicked = language == 'ru'? true: false;
    isEngClicked = language == 'en'? true: false;
    return WillPopScope(
      onWillPop: () async {
        if(isUzClicked){
          pref.setLang('uz');
        }
        if(isRusClicked){
          pref.setLang('ru');
        }
        if(isEngClicked){
          pref.setLang('en');
        }
        return true;
      },
      child: Container(
          height: MediaQuery.of(context).size.height*0.35,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              color: Colors.white
          ),
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10,left: 20,bottom: 10),
                  child: Text("Til",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                const Divider(
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isUzClicked = false;
                      isRusClicked = true;
                      isEngClicked = false;
                      pref.setLang('ru');
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.08,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20, // Image radius
                          backgroundImage: AssetImage(
                            'assets/images/rus.png',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: Text(
                              'Русский',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                            child: isRusClicked ? const Icon(
                              Icons.check,
                              size: 25,
                            ) : null
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isUzClicked = true;
                      isRusClicked = false;
                      isEngClicked = false;
                      pref.setLang('uz');
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.08,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20, // Image radius
                          backgroundImage: AssetImage(
                            'assets/images/uzb.png',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: Text(
                              "O'zbekcha",
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                            child: isUzClicked ? const Icon(
                              Icons.check,
                              size: 25,
                            ) : null
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isRusClicked = false;
                      isUzClicked = false;
                      isEngClicked = true;
                      pref.setLang('en');
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.08,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20, // Image radius
                          backgroundImage: AssetImage(
                            'assets/images/eng.png',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: Text(
                              'English',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                            child: isEngClicked ? const Icon(
                              Icons.check,
                              size: 25,
                            ) : null
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
              ],
            ),
          )
      ),
    );
  }
}