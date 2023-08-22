import 'package:demo_max_way/core/food_api.dart';
import 'package:demo_max_way/model/models.dart';
import 'package:flutter/material.dart';

import '../widgets/category.dart';
import '../widgets/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _api = FoodApi();
  var list = <Category>[];
  bool loading = false;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    if (loading) return;
    loading = true;
    list = await _api.getCategories();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text(
          'Max Way',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8F8F8),
      ),
      body: Builder(builder: (context) {
        if (loading && list.isEmpty) {
          return const ShimmerView();
        }
        return ListView.separated(
          padding: const EdgeInsets.only(bottom: 10),
          separatorBuilder: (__, _) => const SizedBox(height: 10,),
          itemCount: list.length,
          itemBuilder: (_, i) {
            final category = list[i];
            return CategoryItem(category: category);
          },
        );
      }),
    );
  }
}
