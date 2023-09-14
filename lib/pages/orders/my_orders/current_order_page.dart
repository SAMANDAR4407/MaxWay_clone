import 'package:flutter/material.dart';

import '../../../core/database/entity/order_entity.dart';

class CurrentOrderPage extends StatefulWidget {

  final OrderEntity _orderEntity;
  final bool? isReady;

  const CurrentOrderPage({super.key, required OrderEntity orderEntity, this.isReady}) : _orderEntity = orderEntity;

  @override
  State<CurrentOrderPage> createState() => _CurrentOrderPageState();
}

class _CurrentOrderPageState extends State<CurrentOrderPage> {
  @override
  Widget build(BuildContext context) {

    List<String> products = widget._orderEntity.products.split("#");

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Amaldagi buyurtma',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),

          Material(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Buyurtma № ${widget._orderEntity.orderNo}',
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue[50]
                        ),
                        child: Text(widget.isReady! ? 'Buyurtma tayyor': 'Buyurtma rasmiylashtirildi', style: const TextStyle(color: Colors.blue, fontSize: 13)),
                      )
                    ],
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(color: const Color(0xff51267D), borderRadius: BorderRadius.circular(50) ),
                        child: const Center(child: Icon(Icons.check, color: Colors.white)),
                      ),
                      const Expanded(child: Divider(thickness: 2, color: Color(0xff51267D),)),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: const Color(0xff51267D),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Image.asset('assets/images/chef_hat.png', color: Colors.white),
                        )),
                      ),
                      Expanded(child: Divider(thickness: 2, color: widget.isReady! ? const Color(0xff51267D) : const Color(0xFFF6F6F6))),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color:  widget.isReady! ? const Color(0xff51267D) : const Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Image.asset('assets/images/flag.png',
                              color: widget.isReady! ? Colors.white : const Color(0xff51267D)),
                        )),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20,),

                  Builder(
                    builder: (context) {
                      if(widget._orderEntity.branch.isNotEmpty){
                        return Row(
                          children: [
                            const Icon(Icons.location_on_outlined,color: Colors.grey,),
                            const SizedBox(width: 10,),
                            const Text('Filial', style: TextStyle(fontSize: 14,color: Colors.grey)),
                            const Spacer(),
                            SizedBox(width: 270, child: Text(widget._orderEntity.branch, maxLines: 2, textAlign: TextAlign.right, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))),
                          ],
                        );
                      }
                      return Row(
                        children: [
                          const Icon(Icons.location_on_outlined,color: Colors.grey,),
                          const SizedBox(width: 10,),
                          const Text('Manzil', style: TextStyle(fontSize: 14,color: Colors.grey)),
                          const Spacer(),
                          SizedBox(width: 270, child: Text(widget._orderEntity.address, maxLines: 2, textAlign: TextAlign.right, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))),
                        ],
                      );
                    }
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      const Icon(Icons.access_time,color: Colors.grey,),
                      const SizedBox(width: 10,),
                      const Text('Vaqt', style: TextStyle(fontSize: 14,color: Colors.grey)),
                      const Spacer(),
                      Text(widget._orderEntity.time, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      const Icon(Icons.date_range,color: Colors.grey,),
                      const SizedBox(width: 10,),
                      const Text('Sana', style: TextStyle(fontSize: 14,color: Colors.grey)),
                      const Spacer(),
                      Text(widget._orderEntity.date, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      const Icon(Icons.payment,color: Colors.grey,),
                      const SizedBox(width: 10,),
                      const Text("To'lov usuli", style: TextStyle(fontSize: 14,color: Colors.grey)),
                      const Spacer(),
                      Text(widget._orderEntity.payment, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20,),

          Container(
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Chek', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                SizedBox(
                    height: products.length * 30,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 10,),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final data = products[index];

                        final product = data.split(",");

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product[0], style: const TextStyle(color: Colors.grey, height: 1)),
                            Text("${product[2]} x ${product[1]}", style: const TextStyle(color: Colors.grey, height: 1)),
                          ],
                        );
                      },
                    )),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Umumiy narx', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    Text('${widget._orderEntity.price} so\'m', style: const TextStyle(fontSize: 17,color: Colors.grey))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
