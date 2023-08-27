import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api/food_api.dart';
import '../../../model/branch_models.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final FoodApi _api;
  BranchBloc(this._api) : super(const BranchState()) {
    on<BranchEvent>((event, emit) async {
      switch(event){
        case LoadBranches():
          await _onLoadData(event, emit);
          break;
      }
    });
  }

  Future<void> _onLoadData(BranchEvent event, Emitter<BranchState> emit) async {
    if(state.status == BranchStatus.loading) return;
    emit(state.copyWith(status: BranchStatus.loading));
    try{
      emit(state.copyWith(status: BranchStatus.success, branches: await _api.getBranches()));
    }catch(e){
      emit(state.copyWith(status: BranchStatus.fail, message: '$e'));
    }
  }
}
