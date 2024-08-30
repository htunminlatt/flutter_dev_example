part of 'edit_about_cubit.dart';

sealed class EditAboutState extends Equatable {
  const EditAboutState();

  @override
  List<Object> get props => [];
}

final class EditAboutInitial extends EditAboutState {}

final class EditAboutLoading extends EditAboutState {}

final class EditAboutSuccess extends EditAboutState {}

final class EditAboutFail extends EditAboutState {
  String error = "error";
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
