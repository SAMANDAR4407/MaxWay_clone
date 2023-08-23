import 'package:flutter/material.dart';

import '../model/models.dart';

class ProductSearchItem extends StatelessWidget {
  final Function() onTap;
  const ProductSearchItem({
    super.key,
    required this.onTap,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 350,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Center(
                  child: Image.network(
            product.image,
          ))),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.title.uz,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          product.description.uz.isNotEmpty
              ? Text(
                  product.description.uz.trim(),
                  maxLines: 2,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                )
              : const SizedBox(),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Text(
                  "${product.price} ",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(product.currency,),
                Expanded(child: Container()),
                InkWell(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                        'Qo\'shish',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
