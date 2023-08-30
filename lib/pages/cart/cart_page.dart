// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/database/dao/product_dao.dart';
import '../../core/database/database.dart';
import '../../core/database/entity/product_entity.dart';
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
    try {
      widget._productDao.deleteProduct(id);
    } catch (e) {
      showToast(['$e'], context);
    }
    setState(() {});
  }

  Future<ProductDao> _callProducts() async {
    return widget._productDao;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
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
                                  const Text(
                                    'Haqiqatdan ham savatchani bo\'shatmoqchimisiz?', textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Material(
                                            borderRadius: BorderRadius.circular(10),
                                            clipBehavior: Clip.antiAlias,
                                            color: Colors.grey[200],
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                    padding: const EdgeInsets.all(12),
                                                    child: const Center(
                                                        child: Text('Bekor qilish', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                                    padding: const EdgeInsets.all(12),
                                                    child: const Center(
                                                        child: Text('Ha', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.grey,
                    )),
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
                        if (widget.products.length != snapshot.data!.length) {
                          widget.products = snapshot.data!;
                          var cost = 0;

                          for (var product in widget.products) {
                            cost += product.price * product.amount;
                          }
                          finalCost = cost;

                          if (widget.products.isEmpty) {
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
                                        width: MediaQuery.of(context).size.width * 0.23,
                                        height: MediaQuery.of(context).size.width * 0.23,
                                        child: ClipRRect(
                                          clipBehavior: Clip.antiAlias,
                                          borderRadius: BorderRadius.circular(12),
                                          child: CachedNetworkImage(
                                            imageUrl: product.image,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => Image.asset(
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
                                                                const Text(
                                                                  'Haqiqatdan ham mahsulotni ro\'yxatdan olib tashlamoqchimisiz?', textAlign: TextAlign.center,
                                                                  style: TextStyle(fontSize: 14),
                                                                ),
                                                                const Expanded(child: SizedBox()),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                                        child: Material(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          clipBehavior: Clip.antiAlias,
                                                                          color: Colors.grey[200],
                                                                          child: InkWell(
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Container(
                                                                                  padding: const EdgeInsets.all(12),
                                                                                  child: const Center(
                                                                                      child: Text('Bekor qilish', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                                                                  padding: const EdgeInsets.all(12),
                                                                                  child: const Center(
                                                                                      child: Text('Ha', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
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
                                                                if(amount == 1){
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
                                                                              const Text(
                                                                                'Haqiqatdan ham mahsulotni ro\'yxatdan olib tashlamoqchimisiz?', textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 14),
                                                                              ),
                                                                              const Expanded(child: SizedBox()),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                                                                      child: Material(
                                                                                        borderRadius: BorderRadius.circular(10),
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        color: Colors.grey[200],
                                                                                        child: InkWell(
                                                                                            onTap: () {
                                                                                              Navigator.pop(context);
                                                                                            },
                                                                                            child: Container(
                                                                                                padding: const EdgeInsets.all(12),
                                                                                                child: const Center(
                                                                                                    child: Text('Bekor qilish', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                                                                                padding: const EdgeInsets.all(12),
                                                                                                child: const Center(
                                                                                                    child: Text('Ha', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },);
                                                                  return;
                                                                }
                                                                amount--;
                                                                finalCost -= product.price;
                                                                setState(() {});
                                                                widget._productDao.updateProduct(ProductData(
                                                                  productId: product.productId,
                                                                  price: product.price,
                                                                  currency: product.currency,
                                                                  image: product.image,
                                                                  title: product.title,
                                                                  description: product.description,
                                                                  amount: amount
                                                                ));
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
                                                                setState(() {});
                                                                widget._productDao.updateProduct(ProductData(
                                                                    productId: product.productId,
                                                                    price: product.price,
                                                                    currency: product.currency,
                                                                    image: product.image,
                                                                    title: product.title,
                                                                    description: product.description,
                                                                    amount: amount
                                                                ));
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
              }
            },
          ),
        ),
        Container(
          color: widget.products.isEmpty ? Colors.transparent : Colors.white,
          padding: const EdgeInsets.all(15),
          height: widget.products.isEmpty ? MediaQuery.of(context).size.height * 0.10 : MediaQuery.of(context).size.height * 0.16,
          child: widget.products.isNotEmpty
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HostPage()));
                        },
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height*0.065,
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage()));
                    },
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.065,
                        child: const Center(
                            child: Text('Mahsulot qo\'shing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)))),
                  ),
                ),
        )
      ]),
    );
  }
}
