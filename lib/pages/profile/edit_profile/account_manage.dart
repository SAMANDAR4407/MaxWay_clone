import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountManagement extends StatefulWidget {
  const AccountManagement({super.key});

  @override
  State<AccountManagement> createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Shaxsiy hisobni boshqarish',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            Material(
              color: const Color(0xFFF6F6F6),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                height: 540,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      Image.asset('assets/images/maxway.png',height: 150, width: 150,),
                      const SizedBox(height: 15,),
                      const Text("Umid qilamizki, siz hisobingizni o'chirish uchun bu yerda emassiz.", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,),
                      const SizedBox(height: 15,),
                      const Text("Ketayotganingizdan afsusdamiz. Agar davom etishni tanlasangiz, bu keyingi qadamlar:", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      const SizedBox(height: 15,),
                      const Text("- Tasdiqlaganingizdan so'ng, ro'yxatdan o'tgan manzillaringiz va to'lov ma'lumotlaringiz o'chiriladi.", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                      const SizedBox(height: 15,),
                      const Text("- Agar siz MaxWay hisobingizni o'chirishni tanlasangiz, hisob qaydnomangiz ro'yxatga olish ma'lumotlaringiz, oldingi buyurtmalaringiz va sevimlilaringiz o'chiriladi.", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                      const SizedBox(height: 15,),
                      const Text("- Esda tutingki, agar siz MaxWay hisobingizni o'chirishni tanlasangiz, MaxWay ilovasidagi boshqa xizmatlardan foydalana olmaysiz.", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
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
                          return Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.all(30),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                                padding: const EdgeInsets.all(15),
                                height: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Diqqat!',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(height: 8,),
                                    const Text(
                                      'Haqiqatdan ham shaxsiy hisobni o\'chirishingizga ishonchingiz komilmi?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Material(
                                            borderRadius: BorderRadius.circular(10),
                                            clipBehavior: Clip.antiAlias,
                                            color: Colors.grey[200],
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                    padding: const EdgeInsets.all(15),
                                                    child: const Center(
                                                        child: Text('Bekor qilish', style: TextStyle(
                                                            color: Colors.black, fontWeight: FontWeight.bold))))),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Material(
                                            borderRadius: BorderRadius.circular(10),
                                            clipBehavior: Clip.antiAlias,
                                            color: const Color(0xff51267D),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage()));
                                                },
                                                child: Container(
                                                    padding: const EdgeInsets.all(15),
                                                    child: const Center(
                                                        child: Text('Ha', style: TextStyle(
                                                            color: Colors.white, fontWeight: FontWeight.bold))))),
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
                        child: Center(child: Text('Shaxsiy hisobni o\'chirish', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
                      )
                  )
              ),
            )
          ],
        ));
  }
}
