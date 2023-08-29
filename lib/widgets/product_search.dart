import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class ProductSearchItem extends StatelessWidget {
  const ProductSearchItem({
    super.key,
    required this.product, required this.onTap,
  });

  final Function() onTap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(10),
          height: 70,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 0.6,strokeAlign: BorderSide.strokeAlignOutside)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset('assets/images/placeholder.png', color: Colors.grey[400], fit: BoxFit.cover,),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.title.uz, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text("${product.price} so'm", style: const TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
