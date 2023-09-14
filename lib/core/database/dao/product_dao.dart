import 'package:floor/floor.dart';

import '../entity/product_entity.dart';


@dao
abstract class ProductDao {
  @Query('SELECT * FROM ProductData')
  Future<List<ProductData>> getAllProducts();

  @Query('SELECT * FROM ProductData')
  Stream<List<ProductData>> streamedData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProduct(ProductData product);

  @Query('DELETE FROM ProductData where productId = :id')
  Future<void> deleteProduct(String id);

  @Query('DELETE FROM ProductData')
  Future<void> deleteProducts();

  @update
  Future<void> updateProduct(ProductData productData);
}