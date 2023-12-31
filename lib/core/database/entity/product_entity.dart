import 'package:floor/floor.dart';

@entity
class ProductData {
  @PrimaryKey(autoGenerate: false)
  String productId;
  int price;
  String currency;
  String image;
  String title;
  String description;
  int amount;


  ProductData({
    required this.productId,
    required this.price,
    required this.currency,
    required this.image,
    required this.title,
    required this.description,
    this.amount = 1
  });

  factory ProductData.empty({
    String productId = '',
    int price = 0,
    String currency = '',
    String image = '',
    String title = '',
    String description = '',
    int amount = 0
}) => ProductData(productId: productId, price: price, currency: currency, image: image, title: title, description: description);
}

