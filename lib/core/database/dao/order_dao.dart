import 'package:demo_max_way/core/database/entity/order_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class OrderDao {
  @Query('SELECT * FROM OrderEntity where isCompleted = 0')
  Future<List<OrderEntity>> getAllCurrentOrders();

  @Query('SELECT * FROM OrderEntity where isCompleted = 0')
  Stream<List<OrderEntity>> streamedDataCurrent();

  @Query('SELECT * FROM OrderEntity where isCompleted = 1')
  Future<List<OrderEntity>> getAllHistoryOrders();

  @Query('SELECT * FROM OrderEntity where isCompleted = 1')
  Stream<List<OrderEntity>> streamedDataHistory();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrder(OrderEntity order);

  @update
  Future<void> updateOrder(OrderEntity order);

}