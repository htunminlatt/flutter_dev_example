part of 'newtest_bloc.dart';

sealed class NewtestState extends Equatable {
  const NewtestState();
  
  @override
  List<Object> get props => [];
}

final class NewtestInitial extends NewtestState {}
