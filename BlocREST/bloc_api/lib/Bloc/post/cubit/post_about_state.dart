part of 'post_about_cubit.dart';

sealed class PostAboutState extends Equatable {
  const PostAboutState();

  @override
  List<Object> get props => [];
}

final class PostAboutInitial extends PostAboutState {}

class PostAboutDataloading extends PostAboutState {}

class PostAboutDataSuccess extends PostAboutState {
  
}

class PostAboutDataFail extends PostAboutState{
  final String error;

  PostAboutDataFail({required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
} 
