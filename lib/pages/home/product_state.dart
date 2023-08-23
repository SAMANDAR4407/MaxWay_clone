part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState{
  factory ProductState.state({
    @Default('') String message,
    @Default(EnumStatus.initial) EnumStatus status,
    @Default([]) List<Category> categories,
    @Default([]) List<Product> products,
    @Default([]) List<String> categoryNames,
}) = _state;
}

enum EnumStatus{ loading, initial, success, fail }
