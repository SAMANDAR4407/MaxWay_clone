import 'package:demo_max_way/core/database/entity/order_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class OrderDao {
  @Query('SELECT * FROM OrderEntity')
  Future<List<OrderEntity>> getAllOrders();

  @Query('SELECT * FROM OrderEntity')
  Stream<List<OrderEntity>> streamedData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrder(OrderEntity order);

}