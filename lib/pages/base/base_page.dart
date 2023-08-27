import 'package:demo_max_way/core/database/database.dart';
import 'package:demo_max_way/pages/auth/phone_page.dart';
import 'package:demo_max_way/pages/home/home_page.dart';
import 'package:demo_max_way/pages/orders/orders_page.dart';
import 'package:demo_max_way/pages/profile/profile_page.dart';
import 'package:demo_max_way/utils/setup_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/pref.dart';
import '../cart/cart_page.dart';

class HostPage extends StatefulWidget {
  final int position;

  const HostPage({super.key, this.position = 0});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  final pref = PrefHelper();
  bool hasLogged = false;
  bool isEmpty = true;
  int _selectedIndex = 0;
  var list = [];

  @override
  void initState() {
    load();
    if (list.isNotEmpty) {
      isEmpty = false;
    }
    _selectedIndex = widget.position;
    setState(() {});
    super.initState();
  }

  Future<void> load() async {
    hasLogged = await pref.hasLogged();
    list = await getIt<AppDatabase>().productDao.getAllProducts();
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (list.isNotEmpty) {
      setState(() {});
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Asosiy'),
          BottomNavigationBarItem(
              icon: Badge(
                label: Text('${list.length}'),
                child: const Icon(CupertinoIcons.cart),
              ),
              label: 'Savatcha'),
          const BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: 'Buyurtmalar'),
          const BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profil'),
        ],
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xff51267D),
        unselectedItemColor: Colors.grey[400],
        currentIndex: _selectedIndex,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomePage(isFirst: true),
          CartPage(),
          const OrdersPage(),
          hasLogged ? const ProfilePage() : const PhonePage(page: 'profil'),
        ],
      ),
    );
  }
}
