import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title.uz,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Text(product.description.uz.trim(),
                    maxLines: 2,
                    style: TextStyle(fontSize: 13,overflow: TextOverflow.ellipsis, color: Colors.grey[600])),
                const SizedBox(height: 4,),
                Text(
                  "${product.price} so'm",
                  style: const TextStyle(
                      color: Color(0xff51267D), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.24,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  imageUrl: product.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Image.asset('assets/images/placeholder.png', color: Colors.grey[400], fit: BoxFit.cover,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
