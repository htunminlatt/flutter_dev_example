part of 'delete_about_cubit.dart';

sealed class DeleteAboutState extends Equatable {
  const DeleteAboutState();

  @override
  List<Object> get props => [];
}

final class DeleteAboutInitial extends DeleteAboutState {}
class DeleteAboutloading extends DeleteAboutState {}
class DeleteAboutSuccess extends DeleteAboutState{}
class DeleteAboutFail extends DeleteAboutState{
  String error = 'error';
  @override
  // TODO: implement props
  List<Object> get props => [error];

}
