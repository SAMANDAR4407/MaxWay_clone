import 'package:demo_max_way/core/database/entity/order_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class OrderDao {
  @Query('SELECT * FROM AddressEntity')
  Future<List<OrderEntity>> getAllOrders();

  @Query('SELECT * FROM OrderEntity')
  Stream<List<OrderEntity>> streamedData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrder(OrderEntity order);

  @delete
  Future<void> deleteOrder(OrderEntity order);

  @Query('DELETE FROM OrderEntity')
  Future<void> deleteOrders();

  @update
  Future<void> updateOrder(OrderEntity order);
}