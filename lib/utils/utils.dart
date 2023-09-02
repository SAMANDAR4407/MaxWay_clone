import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(milliseconds: 1000),
  ));
}

void showToast(List<String> messages, BuildContext context, {Color color = Colors.green, ToastGravity gravity = ToastGravity.BOTTOM}){
  final fToast = FToast();
  fToast.init(context);

  var toast = Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10)
    ),
    child: messages.length > 1 ? Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(messages[0], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
        Text(messages[1], style: const TextStyle(fontSize: 14, color: Colors.white),)
      ],
    )
    : Center(
      child: Text(messages[0], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: gravity,
    toastDuration: const Duration(seconds: 1)
  );
}
