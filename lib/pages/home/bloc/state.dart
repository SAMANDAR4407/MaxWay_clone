part of 'bloc.dart';

@immutable
class FoodState {
  final List<Category> categories;
  final List<Product> products;
  final List<String> categoryNames;
  final EnumStatus status;
  final String message;

  const FoodState({
    this.categories = const [],
    this.products = const [],
    this.categoryNames = const [],
    this.status = EnumStatus.initial,
    this.message = '',
  });

  FoodState copyWith({
      List<Category>? categories,
      List<Product>? products,
      List<String>? categoryNames,
      EnumStatus? status,
      String? message
  }) {
    return FoodState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      categoryNames: categoryNames ?? this.categoryNames,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

enum EnumStatus{ loading, initial, success, fail }
