import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_max_way/core/food_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../model/models.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FoodApi _api;
  ProductBloc(this._api) : super(ProductState.state()) {
    on<ProductEvent>((event, emit) async {
      switch(event){
        case _loadData():
          await _onLoadData(event, emit);
          break;
        case _search():
          await _onSearchData(event, emit, event.query);
          break;
      }
    });
  }

  Future<void> _onLoadData(_loadData event, Emitter<ProductState> emit) async {
    if(state.status == EnumStatus.loading) return;
    emit(_state(status: EnumStatus.loading));

    var list = <String>[];
    var categories = await _api.getCategories();
    for(Category cat in categories){
      list.add(cat.title.uz);
    }
    try{
      emit(_state(status: EnumStatus.success, categories: await _api.getCategories(), categoryNames: list));
    }catch(e){
      emit(_state(status: EnumStatus.fail, message: '$e'));
    }
  }

  Future<void> _onSearchData(_search event, Emitter<ProductState> emit, String? query) async {
    if(state.status == EnumStatus.loading) return;
    emit(_state(status: EnumStatus.loading));
    var list = <String>[];
    var categories = await _api.getCategories();
    for(Category cat in categories){
      list.add(cat.title.uz);
    }
    try{
      if(query!=null){
        emit(_state(status: EnumStatus.success, products: await _api.getQuery(query), categoryNames: list));
      }
    }catch(e){
      emit(_state(status: EnumStatus.fail, message: '$e'));
    }
  }
}
