import 'package:demo_max_way/core/database/database.dart';
import 'package:demo_max_way/core/database/entity/order_entity.dart';
import 'package:demo_max_way/utils/setup_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/pref.dart';

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(milliseconds: 1000),
  ));
}

void showToast(List<String> messages, BuildContext context, {Color color = Colors.green, ToastGravity gravity = ToastGravity.BOTTOM}) {
  final fToast = FToast();
  fToast.init(context);

  var toast = Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: messages.length > 1
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(messages[0], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
              Text(
                messages[1],
                style: const TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          )
        : Center(
            child: Text(messages[0], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
          ),
  );

  fToast.showToast(child: toast, gravity: gravity, toastDuration: const Duration(seconds: 1));
}

void updateOrders() async {
  final dao = getIt<AppDatabase>().orderDao;
  final list = await dao.getAllCurrentOrders();
  for (var e in list) {
    final format = '${e.date.substring(6, 10)}-'
        '${e.date.substring(3, 5)}-${e.date.substring(0, 2)} '
        '${e.time}:00';
    if (DateTime.now().difference(DateTime.parse(format)).inMinutes > 20) {
      dao.updateOrder(OrderEntity(
        orderNo: e.orderNo,
        branch: e.branch,
        time: e.time,
        date: e.date,
        payment: e.payment,
        products: e.products,
        price: e.price,
        address: e.address,
        isCompleted: true,
      ));
    }
  }
}

void reOrder(OrderEntity order) async {
  final dao = getIt<AppDatabase>().orderDao;
  final pref = PrefHelper();
  final orderNo = await pref.getOrderNumber();

  final newOrder = OrderEntity(
      orderNo: orderNo,
      branch: order.branch,
      time: '${DateTime.now().hour<10?'0${DateTime.now().hour}':'${DateTime.now().hour}'}:${DateTime.now().minute<10?'0${DateTime.now().minute}':'${DateTime.now().minute}'}',
      date: '${DateTime.now().day<10?'0${DateTime.now().day}':'${DateTime.now().day}'}.${DateTime.now().month<10?'0${DateTime.now().month}':'${DateTime.now().month}'}.${DateTime.now().year}',
      payment: order.payment,
      products: order.products,
      price: order.price,
      address: order.address
  );
  dao.insertOrder(newOrder);
  pref.setOrderNumber(orderNo+1);
}
