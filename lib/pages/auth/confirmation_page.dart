import 'package:demo_max_way/core/pref.dart';
import 'package:demo_max_way/pages/auth/phone_page.dart';
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key, required this.name, required this.number, required this.pageName});
  final String? pageName;
  final String name;
  final String number;

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final pref = PrefHelper();
  final auth = FirebaseAuth.instance;
  User? user;

  var smsCode = '';

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff51267D)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final submittedColor = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xff51267D),
        border: Border.all(color: const Color(0xff51267D)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tasdiqlash kodi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                submittedPinTheme: submittedColor,
                showCursor: true,
                onChanged: (value) {
                  smsCode = value;
                },
              ),
            ),
            Material(
              clipBehavior: Clip.antiAlias,
              color: const Color(0xff51267D),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () async {
                  if (smsCode.length == 6) {
                    try {
                      verifyOTP();
                    } catch (e) {
                      showToast(['$e'], context);
                    }
                  }
                },
                child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: const Center(child: Text('Tasdiqlash', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhonePage.verification, smsCode: smsCode);
    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => widget.pageName != null && widget.pageName == 'cart' ? const HostPage(position: 1) : const HostPage(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "Login failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
    pref.setUserData(widget.name, user!.phoneNumber.toString(),'');
    pref.setHasLogged(true);
  }
}
