import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:flutter/material.dart';

import '../../core/pref.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key, required this.page});
  final String page;

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final pref = PrefHelper();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              if(widget.page == 'profil'){
                pref.setHasLogged(true);
                Future.delayed(const Duration(milliseconds: 200));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage(position: 3,),));
              }
              if(widget.page == 'order'){
                pref.setHasLogged(true);
                Future.delayed(const Duration(milliseconds: 200));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage(position: 2,),));
              }
            },
            child: Text('next'),
          )
        ],
      ),
    );
  }
}
