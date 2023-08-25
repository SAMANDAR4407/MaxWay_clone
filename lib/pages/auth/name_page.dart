import 'package:demo_max_way/pages/auth/confirmation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key, required this.page});
  final String page;

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
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
            const Text('Ism familiya', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ism familiya', style: TextStyle(fontSize: 17),),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      valid = true;
                    });
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                  controller: _text,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    prefixStyle: const TextStyle(color: Colors.black, fontSize: 20),
                    errorText: valid ? null : 'Ism xato',
                    hintText: 'Ismingizni kiriting',
                    hintStyle: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        borderSide: BorderSide(color: Color(0xff51267D))
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _text.text.isEmpty ? valid = false : valid = true;
                });
                valid ? Navigator.push(context, CupertinoPageRoute(builder: (context) => ConfirmationPage(page: widget.page,))): null;
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
