import 'package:demo_max_way/core/food_api.dart';
import 'package:demo_max_way/core/pref.dart';
import 'package:demo_max_way/pages/home/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/category.dart';
import '../../widgets/product_search.dart';
import '../../widgets/shimmer.dart';
import '../map/map_page.dart';

class HomePage extends StatefulWidget {
  final bool isFirst;

  const HomePage({super.key, required this.isFirst});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = FoodBloc(FoodApi());
  final controller = TextEditingController();
  final _node = FocusNode();
  final pref = PrefHelper();
  bool isFirst = true;
  String? location;

  Future<void> load() async {
    isFirst = await pref.isFirst();
    location = await pref.getLocation();
  }

  @override
  void initState() {
    load();
    bloc.add(LoadData());
    controller.addListener(() {
      if (controller.text.isEmpty) {
        bloc.add(LoadData());
      } else {
        bloc.add(Search(controller.text));
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

  var selectedCategories = <String>[];

  @override
  Widget build(BuildContext context) {

    if (widget.isFirst) {
      setState(() {});
    } else {
      setState(() {});
    }

    return BlocBuilder<FoodBloc, FoodState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          appBar: AppBar(
            scrolledUnderElevation: 0,
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
                    height: MediaQuery.of(context).size.height * 0.136,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.05,
                          margin: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
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
                              isCollapsed: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
                                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                                itemCount: state.categoryNames.length,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                itemBuilder: (__, i) {
                                  final category = state.categoryNames[i];
                                  return GestureDetector(
                                    onTap: () {
                                      if(selectedCategories.contains(category)){
                                        selectedCategories.remove(category);
                                      } else {
                                        selectedCategories.add(category);
                                      }

                                      setState(() {});

                                      if(selectedCategories.isEmpty){
                                        bloc.add(LoadData());
                                      }
                                      bloc.add(FilterCategory(selectedCategories));

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: selectedCategories.contains(category)
                                              ? const Color(0xff51267D)
                                              : const Color(0xFFEFEFEF),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: Text(
                                            category,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: selectedCategories.contains(category)
                                                    ? Colors.white
                                                    : Colors.black),
                                          )),
                                    ),
                                  );
                                },
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Builder(builder: (context) {
                      if (controller.text.isNotEmpty &&
                          state.products.isNotEmpty) {
                        return ListView.separated(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return ProductSearchItem(product: product);
                          },
                          separatorBuilder: (_, __) => const SizedBox(height: 10,),
                        );
                      }
                      if (state.status == EnumStatus.loading) {
                        return const SingleChildScrollView(child: ShimmerView());
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
                            isFirst: isFirst,
                          );
                        },
                      );
                    }),
                  ),
                ],
              )
        );
      },
    );
  }
}
