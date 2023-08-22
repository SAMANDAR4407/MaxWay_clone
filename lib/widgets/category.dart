import 'package:demo_max_way/pages/map/map_page.dart';
import 'package:flutter/cupertino.dart';

import '../model/models.dart';
import 'product.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              category.title.uz.contains('Panini')? '🧈Panini': category.title.uz,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 350,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10,),
              scrollDirection: Axis.horizontal,
              itemCount: category.products.length,
              itemBuilder: (_, ind) {
                final product = category.products[ind];
                if(ind == 0){
                  return Row(
                    children: [
                      const SizedBox(width: 20,),
                      ProductItem(onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const MapPage();
                          },
                        ));
                      }, product: product)
                    ],
                  );
                }
                if(ind == category.products.length-1){
                  return Row(
                    children: [
                      ProductItem(onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const MapPage();
                          },
                        ));
                      }, product: product),
                      const SizedBox(width: 20,),
                    ],
                  );
                }
                return ProductItem(
                  product: product,
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context) {
                        return const MapPage();
                      },
                    ));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
