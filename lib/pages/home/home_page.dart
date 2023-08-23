import 'package:demo_max_way/core/food_api.dart';
import 'package:demo_max_way/pages/home/product_bloc.dart';
import 'package:demo_max_way/widgets/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/category.dart';
import '../../widgets/shimmer.dart';
import '../map/map_page.dart';

class HomePage extends StatefulWidget {
  final bool isFirst;

  const HomePage({super.key, required this.isFirst});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = ProductBloc(FoodApi());
  final controller = TextEditingController();
  final _node = FocusNode();
  late SharedPreferences pref;
  bool isClicked = false;
  int index = 0;
  bool? isFirst;
  String? location;

  Future<void> load() async {
    pref = await SharedPreferences.getInstance();
    isFirst = pref.getBool('isFirst') ?? true;
    location = pref.getString('location') ?? '';
  }

  @override
  void initState() {
    load();
    bloc.add(ProductEvent.loadData());
    controller.addListener(() {
      if (controller.text.isEmpty) {
        bloc.add(ProductEvent.loadData());
      } else {
        bloc.add(ProductEvent.search(query: controller.text));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (location!.isEmpty) {
    //   setState(() {
    //     location = pref.getString('location');
    //   });
    // }
    if (widget.isFirst) {
      setState(() {});
    } else {
      setState(() {});
    }
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFEFEFEF),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Asosiy'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'Savatcha'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Buyurtmalar'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profil'),
          ],
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(color: Colors.deepPurple, fontSize: 12),
            unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            currentIndex: 0,
            showUnselectedLabels: true,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: isFirst == true
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return const MapPage();
                        },
                      ));
                    },
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.placemark,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Manzilni qo\'shing',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 24,
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Yetkazib berish',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context) {
                              return const MapPage();
                            },
                          ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.placemark,
                              size: 17,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text(
                                location ?? '',
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF3F3F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: TextField(
                        focusNode: _node,
                        controller: controller,
                        onTapOutside: (event) {
                          _node.unfocus();
                          setState(() {});
                        },
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Qidiruv',
                          suffixIcon: controller.text.isNotEmpty
                              ? IconButton(
                              onPressed: () {
                                controller.clear();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ))
                              : null,
                          prefixIcon: const Icon(CupertinoIcons.search,
                              color: Colors.grey),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Builder(
                        builder: (context) {
                          final catNames = state.categoryNames;
                          if(state.status == EnumStatus.loading && state.categories.isEmpty){
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              itemBuilder: (__, i) {
                                return Container(
                                  height: 40,
                                  width: 150,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.withOpacity(0.1),
                                    highlightColor: Colors.grey.withOpacity(0.3),
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                              itemCount: 10,
                            );
                          }
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            itemBuilder: (__, i) {
                              return InkWell(
                                onTap: () {
                                  isClicked = true;
                                  index = i;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isClicked && index == i
                                          ? const Color(0xff51267D)
                                          : const Color(0xFFEFEFEF),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Text(
                                        catNames[i],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: isClicked && index == i
                                                ? Colors.white
                                                : Colors.black),
                                      )),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: 10,),
                            itemCount: catNames.length,
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Builder(builder: (context) {
                    if (controller.text.isNotEmpty &&
                        state.products.isNotEmpty) {
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return ProductItem(product: product);
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 10,
                        ),
                      );
                    }
                    if (state.status == EnumStatus.loading &&
                        state.categories.isEmpty) {
                      return const ShimmerView();
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      separatorBuilder: (__, _) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: state.categories.length,
                      itemBuilder: (_, i) {
                        final category = state.categories[i];
                        return CategoryItem(
                          category: category,
                          isFirst: isFirst!,
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
