import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Biz haqimizda",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 220,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Biz mijozlarimizni xursand qilamiz",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                    "MaxWay kompaniyasining tarixi O\'zbekiston Respublikasining jadal rivojlanayotgan bozorida ishlaydi va o\'sib borayotgan bozor talabini qondirishga qaratilgan. So\'nggi 4 yil ichida kompaniya ajoyib natijalarni namoyish etdi va asosiy faoliyati: Oziq-ovqat va ichimliklar orqali barqaror rivojlanib bormoqda.",
                                    style: TextStyle(fontSize: 15))),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}
