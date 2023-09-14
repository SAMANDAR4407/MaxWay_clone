import 'package:demo_max_way/pages/auth/confirmation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key, required this.number, required this.pageName});
  final String? pageName;
  final String number;

  static String verification = '';

  @override
  State<NamePage> createState() => _NamePageState();
}


class _NamePageState extends State<NamePage> {
  final _text = TextEditingController();
  var valid = true;
  final node = FocusNode();
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _text.text = 'Samandar Kamalov';
    super.initState();
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
                  focusNode: node,
                  onTapOutside: (event) {
                    node.unfocus();
                    setState(() {});
                  },
                  onChanged: (value) {
                    setState(() {
                      valid = true;
                    });
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 17, overflow: TextOverflow.ellipsis),
                  controller: _text,
                  decoration: InputDecoration(
                    prefixStyle: const TextStyle(color: Colors.black, fontSize: 20),
                    errorText: valid ? null : 'Ism xato',
                    hintText: 'Ismingizni kiriting',
                    hintStyle: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),),
                        borderSide: BorderSide(color: Color(0xff51267D))
                    )
                  ),
                ),
              ],
            ),
            Material(
              clipBehavior: Clip.antiAlias,
              color: const Color(0xff51267D),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    _text.text.isEmpty ? valid = false : valid = true;
                  });

                  valid
                      ? Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => ConfirmationPage(name: _text.text,number: widget.number,pageName: widget.pageName)))
                      : null;
                },
                child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: const Center(
                        child: Text('Davom eting',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white)
                        )
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
