part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent{
  factory ProductEvent.loadData() = _loadData;

  factory ProductEvent.search({
    @Default(null) String? query
  }) = _search;
}
