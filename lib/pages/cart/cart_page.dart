import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/database/dao/dao.dart';
import '../../core/database/database.dart';
import '../../core/database/entity/entity.dart';
import '../../utils/setup_db.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  final _productDao = getIt<AppDatabase>().productDao;
  List<ProductData> products = [];

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  bool isEmpty = true;

  var finalCost = 0;

  void _delete(String id) {
    try{
      widget._productDao.deleteProduct(id);
    }catch(e){
      showToast(['$e'], context);
    }
    setState(() {});
  }

  Future<ProductDao> _callProducts() async {
    return widget._productDao;
  }

  @override
  Widget build(BuildContext context) {


    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      setState(() {});
    });
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Savatcha',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: isEmpty ? [] : [
          IconButton(onPressed: () {
                widget._productDao.deleteProducts();
                setState(() {});
            }, icon: const Icon(Icons.delete_outline, color: Colors.grey,)),
          const SizedBox(width: 10,)
        ],
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: _callProducts(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StreamBuilder(
                    stream: snapshot.data!.streamedData(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (widget.products.length != snapshot.data!.length) {
                          widget.products = snapshot.data!;
                          var cost = 0;

                          for(var product in widget.products){
                            cost += product.price*product.amount;
                          }
                          finalCost = cost;

                          if(widget.products.isEmpty){ isEmpty = true; }
                          else { isEmpty = false; }
                        }
                        if (snapshot.data!.isEmpty) {
                          return Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 110,child: SvgPicture.asset('assets/images/bag.svg')),
                              const SizedBox(height: 30),
                              const Text('Savatda hali mahsulot yo\'q'),
                            ],
                          ));
                        }
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(height: 10,),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(snapshot.data![index].title),
                                subtitle: Text(
                                  snapshot.data![index].description,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                trailing: SizedBox(
                                  width: 50,
                                  child: IconButton(
                                    onPressed: () {
                                      _delete(snapshot.data![index].productId);
                                    },
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                    );
              }
            },
          ),
        ),
        Container(
          color: widget.products.isEmpty ? Colors.transparent : Colors.white,
          padding: const EdgeInsets.all(15),
          height: widget.products.isEmpty ? MediaQuery.of(context).size.height * 0.10 : MediaQuery.of(context).size.height * 0.16,
          child:  widget.products.isNotEmpty
          ? Column(
            children: [
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Buyurtma narxi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '$finalCost so\'m',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  )),
              Material(
                clipBehavior: Clip.antiAlias,
                color: const Color(0xff51267D),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage()));
                  },
                  child: const SizedBox(
                      height: 54,
                      child: Center(
                          child: Text(
                              'Buyurtmani rasmiylashtirish',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white)))),
                ),
              )
            ],
          )
          : Material(
            clipBehavior: Clip.antiAlias,
            color: const Color(0xff51267D),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage()));
              },
              child: const SizedBox(
                  height: 54,
                  child: Center(
                      child: Text(
                          'Mahsulot qo\'shing',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)))),
            ),
          ),
        )
      ]),
    );
  }
}
