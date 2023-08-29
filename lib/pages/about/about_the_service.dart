

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_us.dart';

class AboutTheService extends StatelessWidget {
  const AboutTheService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Xizmat haqida",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => const AboutUs()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  child: const Row(
                    children: [
                      Expanded(child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Biz haqimizda", style: TextStyle(fontWeight: FontWeight.bold))
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
