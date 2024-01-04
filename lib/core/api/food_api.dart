import 'package:dio/dio.dart';

import '../../model/branch_models.dart';
import '../../model/models.dart';

class FoodApi{
  final _dio = Dio(BaseOptions(baseUrl: 'https://run.mocky.io/v3/',
    validateStatus: (status) => true,));

  Future<List<Category>> getCategories() async {
    final response =  await _dio.get('396abad0-5633-44ad-acac-657ca1ea7c83');
    return (response.data['categories'] as List).map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Product>> getQuery(String query) async {
    final response =  await _dio.get('396abad0-5633-44ad-acac-657ca1ea7c83');
    final categories = (response.data['categories'] as List).map((e) => Category.fromJson(e)).toList();
    final products = <Product>[];
    for(var category in categories){
      for(var product in category.products){
        if(product.title.uz.toLowerCase().contains(query)){
          products.add(product);
        }
      }
    }
    return products;
  }
  
  Future<List<Branch>> getBranches() async {
    final response = await _dio.get('f7786fcb-eff5-47a4-8831-13e63be027e7');
    return (response.data['branches'] as List).map((e) => Branch.fromJson(e)).toList();
  }
}