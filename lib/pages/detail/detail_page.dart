import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../utils/utils.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var productCount = 1;

  void inc() {
    productCount++;
    setState(() {});
  }

  void dec() {
    productCount--;
    setState(() {});
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            showSnackBar('Share app', context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.share),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,)
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedNetworkImage(imageUrl: widget.product.image, fit: BoxFit.cover,),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ), Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ), Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ), Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ), Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ), Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ), Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ), Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(widget.product.description.uz.trim(), style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                            ],
                          ),
                        ),
                      ],
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
                height: MediaQuery.of(context).size.height * 0.18,
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
                                  MediaQuery.of(context).size.height * 0.005),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 0.8,
                                  strokeAlign: BorderSide.strokeAlignOutside)),
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
                          // showSnackBar(
                          //     'Savatga qo\'shildi ${productCount * widget.product.price}');
                        },
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.065,
                            child: const Center(
                                child: Text('Qo\'shish',
                                    style: TextStyle(
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
        )
      ]),
    );
  }
}
