import 'package:demo_max_way/core/pref.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final pref = PrefHelper();
  bool hasLogged = false;

  Future<void> load() async {
    hasLogged = await pref.hasLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
          title: const Text(
            'Buyurtmalarim',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
      ),
      body: Builder(
          builder: (context) {
            if(hasLogged){
              return const Scaffold(backgroundColor: Colors.green,);
            }
            return const Scaffold(
              body: Center(
                child: Text('Sign in to proceed', style: TextStyle(fontSize: 20),),
              ),
            );
          },
      ),
    );
  }
}
