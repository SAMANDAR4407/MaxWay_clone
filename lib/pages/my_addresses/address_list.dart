import 'package:demo_max_way/pages/map/add_address_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressListPage extends StatefulWidget {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  State<AddressListPage> createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
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
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(height: 120,'assets/images/place_holder.png'),
              const SizedBox(height: 20),
              const Text("Sizda manzillar yo\'q",style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 50,)
            ],
          )),
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
