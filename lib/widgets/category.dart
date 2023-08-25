import 'package:demo_max_way/pages/map/map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';
import '../pages/detail/detail_page.dart';
import 'product.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.isFirst,
  });

  final Category category;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white70
            ),
            // height: 670,
            height: category.products.length * 90 + (category.products.length-1)*12 + 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.title.uz, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                SizedBox(
                  height: category.products.length * 90 + (category.products.length-1)*12,
                  // height: 610,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: category.products.length,
                    separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1,height: 8),
                    itemBuilder: (_, ind) {
                      final product = category.products[ind];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => isFirst
                                    ? const MapPage() : DetailPage(product: product),));
                          },
                          child: ProductItem(product: product)
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}