import 'package:demo_max_way/core/database/entity/address_entity.dart';
import 'package:floor/floor.dart';


@dao
abstract class AddressDao {
  @Query('SELECT * FROM AddressEntity')
  Future<List<AddressEntity>> getAllProducts();

  @Query('SELECT * FROM AddressEntity')
  Stream<List<AddressEntity>> streamedData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAddress(AddressEntity address);

  @delete
  Future<void> deleteAddress(AddressEntity address);

  @Query('DELETE FROM AddressEntity')
  Future<void> deleteAddresses();

  @update
  Future<void> updateAddress(AddressEntity address);
}