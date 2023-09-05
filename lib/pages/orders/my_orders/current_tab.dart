import 'package:demo_max_way/utils/setup_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/database/dao/order_dao.dart';
import '../../../core/database/database.dart';

class Tab1 extends StatelessWidget {
  Tab1({Key? key}) : super(key: key);

  final _dao = getIt<AppDatabase>().orderDao;

  Future<OrderDao> _callDao() async {
    return _dao;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _callDao(),
      builder: (context,snapshot) {
        return StreamBuilder(
            stream: snapshot.data?.streamedData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                return const Center(
                    child: CupertinoActivityIndicator()
                );
              } else {
                if (snapshot.data!.isEmpty) {
                  return Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(height: 120,'assets/images/place_holder.png'),
                      const SizedBox(height: 20),
                      const Text("Buyurtma mavjud emas",style: TextStyle(color: Colors.grey),),
                      const SizedBox(height: 50,)
                    ],
                ));
                }
                return Scaffold(
                  backgroundColor: const Color(0xFFF6F6F6),
                  body: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return Material(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            height: 140,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Buyurtma №${snapshot.data![index].orderNo}',
                                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.lightBlue[50]
                                      ),
                                      child: const Text('Buyurtma rasmiylashtirildi', style: TextStyle(color: Colors.blue, fontSize: 13)),
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff51267D),
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: const Center(child: Icon(Icons.check, color: Colors.white,)),
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
                                    const Expanded(child: Divider(thickness: 2, color: Color(0xff51267D),)),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFF6F6F6),
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: Center(child: Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: Image.asset('assets/images/flag.png', color: const Color(0xff51267D)),
                                      )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }
          );
      }
    );
  }
}
