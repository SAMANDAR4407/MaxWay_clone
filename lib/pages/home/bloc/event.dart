part of 'bloc.dart';

@immutable
abstract class FoodEvent{}

class LoadData extends FoodEvent{}

class Search extends FoodEvent{
  final String? query;
  Search(this.query);
}
class FilterCategory extends FoodEvent{
  final List<String>? titles;
  FilterCategory(this.titles);
}