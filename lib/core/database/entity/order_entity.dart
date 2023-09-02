import 'package:floor/floor.dart';

@entity
class OrderEntity {
  @PrimaryKey(autoGenerate: false)
  String orderNo;
  String branch;
  String time;
  String date;
  String payment;
  String product;
  int amount;
  int price;

  OrderEntity({
    required this.orderNo,
    required this.branch,
    required this.time,
    required this.date,
    required this.payment,
    required this.product,
    required this.amount,
    required this.price,
  });

  factory OrderEntity.empty({
    String orderNo = '',
    String branch = '',
    String time = '',
    String date = '',
    String payment = '',
    String product = '',
    int amount = 0,
    int price = 0,
  }) => OrderEntity(orderNo: orderNo, branch: branch, time: time, date: date, payment: payment, product: product, amount: amount, price: price);
}