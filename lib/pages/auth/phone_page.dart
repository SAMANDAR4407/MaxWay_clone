import 'package:demo_max_way/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'name_page.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  static String verification = '';

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final _text = TextEditingController();
  var valid = true;
  String phone = '';
  final node = FocusNode();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    _text.text = '+998';
    super.initState();
  }
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
                  inputFormatters: [LengthLimitingTextInputFormatter(13)],
                  focusNode: node,
                  onTapOutside: (event) {
                    node.unfocus();
                    setState(() {});
                  },
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.phone,
                  controller: _text,
                  onChanged: (value) {
                    setState(() {
                      valid = true;
                    });
                  },
                  decoration: InputDecoration(
                    errorText: valid ? null : 'kirishda xatolik',
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
                    _text.text.isEmpty || _text.text.length != 13 ? valid = false : valid = true;
                  });
                  valid
                      ? await auth.verifyPhoneNumber(
                    phoneNumber: _text.text,
                    verificationCompleted: (PhoneAuthCredential credential) async {
                      await auth.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      showToast(['Xatolik', '$e'], context, color: Colors.redAccent);
                      print(e.message);
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      PhonePage.verification = verificationId;
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => NamePage(number: _text.text,)));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},)
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
