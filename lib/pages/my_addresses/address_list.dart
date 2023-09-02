// ignore_for_file: must_be_immutable

import 'package:demo_max_way/core/database/entity/address_entity.dart';
import 'package:demo_max_way/pages/map/add_address_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/database/dao/address_dao.dart';
import '../../core/database/database.dart';
import '../../utils/setup_db.dart';


class AddressListPage extends StatefulWidget {
  AddressListPage({Key? key}) : super(key: key);

  final _addressDao = getIt<AppDatabase>().addressDao;
  List<AddressEntity> addresses = [];
  @override
  State<AddressListPage> createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {

  Future<AddressDao> _callAddresses() async {
    return widget._addressDao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey[300],
        backgroundColor: Colors.white,
        scrolledUnderElevation: 1,
        title: const Text(
          'Mening manzillarim',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder(
              future: _callAddresses(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                  return const Center(child: CupertinoActivityIndicator());
                } else {
                  return StreamBuilder(
                      stream: snapshot.data!.streamedData(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                          return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 20,
                                color: Color(0xff51267D),
                              ));
                        } else {
                          if (snapshot.data!.isEmpty) {
                            return Center(child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(height: 120,'assets/images/place_holder.png'),
                                const SizedBox(height: 20),
                                const Text("Sizda manzillar yo'q",style: TextStyle(color: Colors.grey),),
                                const SizedBox(height: 50,)
                              ],
                            ));
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Material(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => const Divider(height: 1, indent: 20),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, i) {
                                  final address = snapshot.data![i];
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Icon(CupertinoIcons.placemark),
                                        const SizedBox(width: 15,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(address.title, maxLines: 1, style: TextStyle(color: Colors.grey[500], overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),),
                                              Text(address.locationName, maxLines: 2, style: const TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(context: context, builder: (context) {
                                              return Center(
                                                child: Container(
                                                  margin: const EdgeInsets.all(30),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                  padding: const EdgeInsets.all(15),
                                                  height: 150,
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
                                                      const Text(
                                                        'Bu manzilni o\'chirib tashlamoqchimisiz?',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(fontSize: 14),
                                                      ),
                                                      const Expanded(child: SizedBox()),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Material(
                                                              borderRadius: BorderRadius.circular(10),
                                                              clipBehavior: Clip.antiAlias,
                                                              color: Colors.grey[200],
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                      padding: const EdgeInsets.all(15),
                                                                      child: const Center(
                                                                          child: Text('Yo\'q', style: TextStyle(
                                                                              color: Colors.black, fontWeight: FontWeight.bold))))),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 10),
                                                          Expanded(
                                                            child: Material(
                                                              borderRadius: BorderRadius.circular(10),
                                                              clipBehavior: Clip.antiAlias,
                                                              color: const Color(0xff51267D),
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    widget._addressDao.deleteAddress(address);
                                                                    Navigator.pop(context);
                                                                    setState(() {});
                                                                  },
                                                                  child: Container(
                                                                      padding: const EdgeInsets.all(15),
                                                                      child: const Center(
                                                                          child: Text('Ha', style: TextStyle(
                                                                              color: Colors.white, fontWeight: FontWeight.bold))))),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },);
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      });
                }
              },
          ),
          Column(
            children: [
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xff51267D),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddAddressMapPage()));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.065,
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_rounded, color: Colors.white,),
                            SizedBox(width: 10),
                            Text('Manzil qo\'shing', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ]),
    );
  }
}
