import 'package:floor/floor.dart';

@entity
class AddressEntity{
  @PrimaryKey(autoGenerate: false)
  String locationName;
  String title;
  String apartment;
  String floor;
  String entrance;
  double lat;
  double long;

  AddressEntity({
    required this.locationName,
    required this.title,
    required this.apartment,
    required this.floor,
    required this.entrance,
    required this.lat,
    required this.long,
  });

  factory AddressEntity.empty({
    String locationName = '',
    String title = '',
    String apartment = '',
    String floor = '',
    String entrance = '',
    double lat = 0,
    double long = 0,
  }) => AddressEntity(locationName: locationName, title: title, apartment: apartment, floor: floor, entrance: entrance, lat: lat, long: long);
}