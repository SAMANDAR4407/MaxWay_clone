import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(height: 120,'assets/images/place_holder.png'),
          const SizedBox(height: 20),
          const Text("Buyurtma mavjud emas",style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 50,)
        ],
      )),
    );
  }
}
