
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/food_api.dart';
import '../../../model/models.dart';

part 'event.dart';
part 'state.dart';

class FoodBloc extends Bloc<FoodEvent,FoodState>{
  final FoodApi _api;
  FoodBloc(this._api) : super(const FoodState()){
    on<FoodEvent>((event, emit) async {
      switch(event) {
        case LoadData():
          await _onLoadData(event, emit);
          break;
        case Search():
          await _onSearch(event, emit, event.query);
          break;
        case FilterCategory():
          await _onFilter(event, emit, event.titles);
          break;
      }
    });
  }

  Future<void> _onLoadData(FoodEvent event, Emitter<FoodState> emit) async {
    if(state.status == EnumStatus.loading) return;
    emit(state.copyWith(status: EnumStatus.loading));
    final categoryNames = <String>[];
    final categories = await _api.getCategories();
    for(Category category in categories){
      categoryNames.add(category.title.uz);
    }
    try{
      emit(state.copyWith(status: EnumStatus.success, categoryNames: categoryNames, categories: categories));
    }catch(e){
      emit(state.copyWith(status: EnumStatus.fail, message: '$e'));
    }
  }

  Future<void> _onSearch(FoodEvent event, Emitter<FoodState> emit, String? query) async {
    if(state.status == EnumStatus.loading) return;
    emit(state.copyWith(status: EnumStatus.loading));
    try{
      if(query!=null){
        emit(state.copyWith(status: EnumStatus.success, products: await _api.getQuery(query)));
      }
    }catch(e){
      emit(state.copyWith(status: EnumStatus.fail, message: '$e'));
    }
  }

  Future<void> _onFilter(FoodEvent event, Emitter<FoodState> emit, List<String>? titles) async {
    if(state.status == EnumStatus.loading) return;
    emit((state.copyWith(status: EnumStatus.loading)));
    final result = <Category>[];
    final categories = await _api.getCategories();
    try{
      if(titles!=null){
        for(Category category in categories){
          for(String title in titles){
            if(title == category.title.uz){
              result.add(category);
            }
          }
        }
        emit(state.copyWith(status: EnumStatus.success, categories: result));
      }
    }catch(e){
      emit(state.copyWith(status: EnumStatus.fail, message: '$e'));
    }
  }
}