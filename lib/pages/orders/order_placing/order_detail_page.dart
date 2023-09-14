import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/pages/orders/order_placing/delivery_tab.dart';
import 'package:demo_max_way/pages/orders/order_placing/provider.dart';
import 'package:demo_max_way/pages/orders/order_placing/take_away_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/database/database.dart';
import '../../../core/database/entity/order_entity.dart';
import '../../../core/database/entity/product_entity.dart';
import '../../../core/pref.dart';
import '../../../utils/setup_db.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key, required this.list});

  final List<ProductData> list;

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> with SingleTickerProviderStateMixin{
  var totalPrice = 0;
  final _orderDao = getIt<AppDatabase>().orderDao;
  final _productDao = getIt<AppDatabase>().productDao;
  late TabController tabController;
  final pref = PrefHelper();

  @override
  void initState() {

    for(var data in widget.list){
      totalPrice += data.price * data.amount;
    }

    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Buyurtmani rasmiylashtirish',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width*0.9,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10)),
                        child: TabBar(
                          padding: const EdgeInsets.all(4),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Yetkazib berish")
                                )
                            ),
                            Tab(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Olib ketish")
                                )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: tabController,
                          children: [
                            OrderDeliveryTab(list: widget.list, totalPrice: totalPrice),
                            OrderTakeAwayTab(list: widget.list, totalPrice: totalPrice),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.065,
                )
              )
            ],
          ),
          Column(
            children: [
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xff51267D),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () async {
                      if(totalPrice < 20000){
                        showDialog(context: context, builder: (context) {
                          return Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Container(
                                height: 170,
                                clipBehavior: Clip.antiAlias,
                                margin: const EdgeInsets.all(30),
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Diqqat!',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(height: 8,),
                                    Text(
                                      'Buyurtmangiz narxi: $totalPrice so\'m. Minimal buyurtma narxi 20000 so\'m bo\'lishi kerak.', textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Material(
                                      borderRadius: BorderRadius.circular(10),
                                      clipBehavior: Clip.antiAlias,
                                      color: const Color(0xff51267D),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(12),
                                              child: const Center(
                                                  child: Text('Ok', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },);
                        return;
                      }

                      String products = '';

                      for(int i = 0; i < widget.list.length ; i++){
                        if(i == widget.list.length-1){
                          products += '${widget.list[i].title},${widget.list[i].price},${widget.list[i].amount}';
                          break;
                        }
                        products += '${widget.list[i].title},${widget.list[i].price},${widget.list[i].amount}#';
                      }

                      final orderNo = await pref.getOrderNumber();
                      tabController.index == 0
                          ? _orderDao.insertOrder(OrderEntity(
                          orderNo: orderNo,
                          branch: Provider.of<OrderDetailProvider>(context, listen: false).branch,
                          time: '${DateTime.now().hour<10?'0${DateTime.now().hour}':'${DateTime.now().hour}'}:${DateTime.now().minute<10?'0${DateTime.now().minute}':'${DateTime.now().minute}'}',
                          date: '${DateTime.now().day<10?'0${DateTime.now().day}':'${DateTime.now().day}'}.${DateTime.now().month<10?'0${DateTime.now().month}':'${DateTime.now().month}'}.${DateTime.now().year}',
                          payment: Provider.of<OrderDetailProvider>(context, listen: false).paymentMethod,
                          products: products,
                          price: totalPrice,
                          address: Provider.of<OrderDetailProvider>(context, listen: false).address
                        ))
                          : _orderDao.insertOrder(OrderEntity(
                            orderNo: orderNo,
                            branch: Provider.of<OrderDetailProvider>(context, listen: false).branch,
                            time: '${DateTime.now().hour<10?'0${DateTime.now().hour}':'${DateTime.now().hour}'}:${DateTime.now().minute<10?'0${DateTime.now().minute}':'${DateTime.now().minute}'}',
                            date: '${DateTime.now().day<10?'0${DateTime.now().day}':'${DateTime.now().day}'}.${DateTime.now().month<10?'0${DateTime.now().month}':'${DateTime.now().month}'}.${DateTime.now().year}',
                            payment: Provider.of<OrderDetailProvider>(context, listen: false).paymentMethod,
                            products: products,
                            price: totalPrice,
                            address: Provider.of<OrderDetailProvider>(context, listen: false).address
                        ));
                      pref.setOrderNumber(orderNo+1);
                      _productDao.deleteProducts();
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const HostPage()));
                    },
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.065,
                        child: const Center(
                            child: Text('Buyurtmani rasmiylashtirish', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)))),
                  ),
                ),
              )
            ],
          )
      ]),
    );
  }
}
