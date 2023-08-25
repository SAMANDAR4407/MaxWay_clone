import 'package:demo_max_way/pages/home/home_page.dart';
import 'package:demo_max_way/pages/orders/orders_page.dart';
import 'package:demo_max_way/pages/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cart/cart_page.dart';

class HostPage extends StatefulWidget {
  final int position;
  const HostPage({super.key, this.position = 0});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {

  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = widget.position;
    super.initState();
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    const HomePage(isFirst: true),
    const CartPage(),
    const OrdersPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Asosiy'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'Savatcha'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: 'Buyurtmalar'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profil'),
        ],
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xff51267D),
        unselectedItemColor: Colors.grey[400],
        currentIndex: _selectedIndex,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
