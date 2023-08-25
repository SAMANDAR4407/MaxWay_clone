import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'name_page.dart';

class PhonePage extends StatefulWidget {
  final String page;
  const PhonePage({super.key, required this.page});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final _text = TextEditingController();
  var valid = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Telefon raqami', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Telefon raqami', style: TextStyle(fontSize: 17),),
                TextField(
                  maxLength: 9,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  keyboardType: TextInputType.number,
                  controller: _text,
                  onChanged: (value) {
                    setState(() {
                      valid = true;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: const Color(0xff51267D),
                    prefixText: '+998 ',
                    prefixStyle: const TextStyle(color: Colors.black, fontSize: 20),
                    errorText: valid ? null : 'kirishda xatolik',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),),
                      borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _text.text.isEmpty || _text.text.length != 9 ? valid = false : valid = true;
                });
                print('object');
                valid ? Navigator.push(context, CupertinoPageRoute(builder: (context) => NamePage(page: widget.page,))): null;
                // Navigator.push(context, CupertinoPageRoute(builder: (context) => const NamePage(),));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff51267D),
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: const Center(
                      child: Text('Davom eting',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)
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
