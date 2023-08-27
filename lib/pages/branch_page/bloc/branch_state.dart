part of 'branch_bloc.dart';

@immutable
class BranchState {
  final BranchStatus status;
  final List<Branch> branches;
  final String message;

  const BranchState({
    this.status = BranchStatus.initial,
    this.branches = const [],
    this.message = '',
  });

  BranchState copyWith({
    BranchStatus? status,
    List<Branch>? branches,
    String? message
}){
    return BranchState(
      status: status ?? this.status,
      branches: branches ?? this.branches,
      message: message ?? this.message
    );
}
}

enum BranchStatus { initial, loading, success, fail }
