// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_max_way/pages/auth/phone_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/database/dao/product_dao.dart';
import '../../core/database/database.dart';
import '../../core/database/entity/product_entity.dart';
import '../../core/pref.dart';
import '../../utils/setup_db.dart';
import '../orders/order_placing/order_detail_page.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  final _productDao = getIt<AppDatabase>().productDao;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final pref = PrefHelper();
  bool isEmpty = true;
  bool hasLogged = false;
  var finalCost = 0;

  var products = <ProductData>[];

  void load() async {
    hasLogged = await pref.hasLogged();
  }

  Future<ProductDao> _callProducts() async {
    return widget._productDao;
  }

  void check() {

  }

  @override
  void initState() {
    // load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10)).then((value) async {
      hasLogged = await pref.hasLogged();
      setState(() {});
    });
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 1,
        centerTitle: true,
        title: const Text(
          'Savatcha',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: isEmpty
            ? []
            : [
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
                      height: 160,
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
                            'Haqiqatdan ham savatchani bo\'shatmoqchimisiz?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
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
                                              child: Text('Bekor qilish', style: TextStyle(
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
                                        widget._productDao.deleteProducts();
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
              icon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset('assets/images/delete.svg', width: 20, height: 20),
              )
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: _callProducts(),
            builder: (context, snapshot) {
              return StreamBuilder(
                  stream: snapshot.data?.streamedData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                      return const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.red,
                          )
                      );
                    } else {
                      if (products.length != snapshot.data!.length) {
                        products = snapshot.data!;
                        // print('hashcode before => ${products.hashCode}');
                        var cost = 0;

                        for (var product in snapshot.data!) {
                          cost += product.price * product.amount;
                        }
                        finalCost = cost;

                        if (snapshot.data!.isEmpty) {
                          isEmpty = true;
                        } else {
                          isEmpty = false;
                        }
                      }
                      if (snapshot.data!.isEmpty) {
                        return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 110, child: SvgPicture.asset('assets/images/bag.svg')),
                                const SizedBox(height: 30),
                                const Text('Savatda hali mahsulot yo\'q'),
                              ],
                            ));
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const Divider(height: 1, indent: 20, endIndent: 20),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, i) {
                              final product = snapshot.data![i];
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.23,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.23,
                                      child: ClipRRect(
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: product.image,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Image.asset(
                                                'assets/images/placeholder.png',
                                                color: Colors.grey[400],
                                                fit: BoxFit.cover,
                                              ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                                    const Text(
                                                        'Sample product Sample product Sample product Sample product Sample product Sample product Sample product',
                                                        style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                                                          height: 170,
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
                                                                'Haqiqatdan ham mahsulotni ro\'yxatdan olib tashlamoqchimisiz?',
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
                                                                                  child: Text('Bekor qilish', style: TextStyle(
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
                                                                            widget._productDao.deleteProduct(product.productId);
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
                                                  icon: Icon(Icons.close_rounded, color: Colors.grey[400])),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('${product.amount * product.price} so\'m', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey[300]!, width: 1), borderRadius: BorderRadius.circular(6)),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Material(
                                                        clipBehavior: Clip.antiAlias,
                                                        borderRadius: BorderRadius.circular(15),
                                                        color: Colors.white,
                                                        child: InkWell(
                                                            onTap: () {
                                                              var amount = product.amount;
                                                              if (amount == 1) {
                                                                showDialog(context: context, builder: (context) {
                                                                  return Center(
                                                                    child: Container(
                                                                      margin: const EdgeInsets.all(30),
                                                                      clipBehavior: Clip.antiAlias,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                                      padding: const EdgeInsets.all(15),
                                                                      height: 170,
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
                                                                            'Haqiqatdan ham mahsulotni ro\'yxatdan olib tashlamoqchimisiz?',
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
                                                                                              child: Text('Bekor qilish', style: TextStyle(
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
                                                                                        widget._productDao.deleteProduct(product.productId);
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
                                                                return;
                                                              }
                                                              amount--;
                                                              finalCost -= product.price;
                                                              widget._productDao.updateProduct(ProductData(
                                                                  productId: product.productId,
                                                                  price: product.price,
                                                                  currency: product.currency,
                                                                  image: product.image,
                                                                  title: product.title,
                                                                  description: product.description,
                                                                  amount: amount
                                                              ));
                                                              products = snapshot.data!;
                                                              for(var a in products){
                                                                print('product: ${a.title}\n${a.amount}\n${a.price*a.amount}');
                                                              }
                                                              // print('hashcode after => ${products.hashCode}');
                                                              setState(() {});
                                                            },
                                                            child: const Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.remove_rounded)))),
                                                    SizedBox(width: 20, child: Center(child: Text("${product.amount}"))),
                                                    Material(
                                                        clipBehavior: Clip.antiAlias,
                                                        borderRadius: BorderRadius.circular(15),
                                                        color: Colors.white,
                                                        child: InkWell(
                                                            onTap: () {
                                                              var amount = product.amount;
                                                              amount++;
                                                              finalCost += product.price;
                                                              widget._productDao.updateProduct(ProductData(
                                                                  productId: product.productId,
                                                                  price: product.price,
                                                                  currency: product.currency,
                                                                  image: product.image,
                                                                  title: product.title,
                                                                  description: product.description,
                                                                  amount: amount
                                                              ));
                                                              products = snapshot.data!;
                                                              for(var a in products){
                                                                print('product: \n${a.title}\n${a.amount}\n${a.price*a.amount}');
                                                              }
                                                              setState(() {});
                                                            },
                                                            child: const Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.add_rounded)))),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  });
            },
          ),
        ),
        Container(
          color: products.isEmpty ? Colors.transparent : Colors.white,
          padding: const EdgeInsets.all(15),
          height: products.isEmpty
              ? MediaQuery.of(context).size.height * 0.10
              : MediaQuery.of(context).size.height * 0.16,
          child: products.isNotEmpty
              ? Column(
            children: [
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Buyurtma narxi',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '$finalCost so\'m',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  )),
              Material(
                clipBehavior: Clip.antiAlias,
                color: const Color(0xff51267D),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => hasLogged ? OrderDetailPage(list: products) : const PhonePage(pageName: 'cart',)));
                    // for(var a in products){
                    //   print('product: \n${a.title}\n${a.amount}\n${a.price*a.amount}');
                    // }
                    // print('hashcode after => ${products.hashCode}');
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.065,
                      child: const Center(
                          child: Text('Buyurtmani rasmiylashtirish',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)))),
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
                Navigator.pop(context);
              },
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                  child: const Center(
                      child: Text('Mahsulot qo\'shing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)))),
            ),
          ),
        )
      ]),
    );
  }
}
