import 'package:dio/dio.dart';

import '../model/models.dart';

class FoodApi{
  final _dio = Dio(BaseOptions(baseUrl: 'https://run.mocky.io/v3/',
    validateStatus: (status) => true,));

  Future<List<Category>> getCategories() async {
    final response =  await _dio.get('1084bc88-24e4-4d5f-8b1e-e148136f157f');
    return (response.data['categories'] as List).map((e) => Category.fromJson(e)).toList();
  }
}