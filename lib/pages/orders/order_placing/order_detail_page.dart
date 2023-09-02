import 'package:demo_max_way/pages/orders/order_placing/delivery_tab.dart';
import 'package:demo_max_way/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../core/database/entity/product_entity.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key, required this.list});

  final List<ProductData> list;

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> with SingleTickerProviderStateMixin{
  var totalPrice = 0;
  late TabController tabController;

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
                          padding: const EdgeInsets.all(3),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                            Scaffold(backgroundColor: Colors.purple)
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
                    onTap: () {
                      if(totalPrice < 20000){
                        showDialog(context: context, builder: (context) {
                          return Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width*0.13,
                                vertical: MediaQuery.of(context).size.height*0.38
                            ),
                            child: Material(
                              color: Colors.white,
                              child: Container(
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Material(
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
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },);
                        return;
                      }
                      showToast(['Buyurtma narxi: $totalPrice so\'m'], context);
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