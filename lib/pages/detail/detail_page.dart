import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_max_way/core/database/database.dart';
import 'package:demo_max_way/core/database/entity/entity.dart';
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:demo_max_way/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../model/models.dart';
import '../../utils/setup_db.dart';
import '../../widgets/recommend.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  final Category? deserts;

  const DetailPage({super.key, required this.product, this.deserts});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var productCount = 1;
  bool isAdded = false;
  List<ProductData> list = [];
  late ProductData lastAddedProduct;

  final dao = getIt<AppDatabase>().productDao;

  Future<void> load() async {
    list = await dao.getAllProducts();
  }

  @override
  void initState() {
    load().then((value){
      for(var product in list){
        if(product.title == widget.product.title.uz){
          lastAddedProduct = product;
          productCount = product.amount;
          isAdded = true;
        }
      }
      setState(() {});
    });
    super.initState();
  }

  void inc() {
    productCount++;
    if(isAdded){
      if(productCount > lastAddedProduct.amount){
        isAdded = false;
      }
    }
    setState(() {});
  }

  void dec() {
    productCount--;
    if(isAdded){
      if(productCount < lastAddedProduct.amount){
        isAdded = false;
      }
    }
    setState(() {});
  }

  Future<void> shareApp() async {
    const String appLink = 'https://play.google.com/store/apps/details?id=com.example.demo_max_way';
    const String message = 'Check out my new app:';
    await FlutterShare.share(title: 'Share App', text: message, linkUrl: appLink);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0,
                    expandedHeight: 260,
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: BackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                    ),
                    actions: [
                      Material(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () async {
                            await shareApp();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Tooltip(
                                message: 'Share',
                                child: Icon(Icons.share)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,)
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        imageUrl: widget.product.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Image.asset('assets/images/placeholder.png', color: Colors.grey[400], fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: const Color(0xFFF6F6F6),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product.title.uz,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),),
                                const SizedBox(height: 10,),
                                Text(widget.product.description.uz.trim(),
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 15),),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product.title.uz,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),),
                                const SizedBox(height: 10,),
                                Text(widget.product.description.uz.trim(),
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 15),),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product.title.uz,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),),
                                const SizedBox(height: 10,),
                                Text(widget.product.description.uz.trim(),
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 15),),
                              ],
                            ),
                          ),
                          Recommendation(deserts: widget.deserts!),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(height: MediaQuery.of(context).size.height * 0.18,)
          ],
        ),
        Column(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Material(
              color: Colors.white,
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(15),
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.18,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.005),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: Colors.grey[300]!,
                                      width: 0.8,
                                      strokeAlign: BorderSide
                                          .strokeAlignOutside)),
                              child: Row(
                                children: [
                                  IconButton(
                                      padding: const EdgeInsets.all(5),
                                      onPressed: productCount > 1 ? dec : null,
                                      icon: const Icon(Icons.remove)),
                                  SizedBox(
                                    width: 20,
                                    child: Center(
                                        child: Text(
                                          '$productCount',
                                          style: const TextStyle(fontSize: 17),
                                        )),
                                  ),
                                  IconButton(
                                      padding: EdgeInsets.all(5),
                                      onPressed: inc,
                                      icon: const Icon(Icons.add)),
                                ],
                              ),
                            ),
                            Text(
                              '${widget.product.price * productCount} so\'m',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: const Color(0xff51267D),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          if(isAdded){
                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const HostPage(position: 1,)));
                          } else {
                            // dao.deleteProduct(lastAddedProduct.productId);
                            dao.insertProduct(ProductData(
                                productId: widget.product.id,
                                price: widget.product.price,
                                currency: widget.product.currency,
                                image: widget.product.image,
                                title: widget.product.title.uz,
                                description: widget.product.description.uz,
                                amount: productCount)
                            ).then((value) {
                              showToast(['Buyurtmangiz savatga qo\'shildi', 'Savatni tekshirishingiz mumkin'], context, gravity: ToastGravity.TOP);
                            });
                            isAdded = true;
                            setState(() {});
                          }
                        },
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.065,
                            child: Center(
                                child: Text(
                                    isAdded ? 'Savatga' : 'Qo\'shish',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white)))),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
