part of 'get_about_cubit.dart';

sealed class GetAboutState extends Equatable {
  const GetAboutState();

  @override
  List<Object> get props => [];
}

final class GetAboutInitial extends GetAboutState {}

class GetAboutSuccess extends GetAboutState {
  final List<About> about;

  const GetAboutSuccess({required this.about});
  @override
  // TODO: implement props
  List<Object> get props => about;
}

class GetAboutFail extends GetAboutState {
  final String error;

  GetAboutFail({required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class getProfileSuccss extends GetAboutState {
 final List<Profile> profileData;

  getProfileSuccss({required this.profileData});
  @override
  // TODO: implement props
  List<Object> get props => profileData;
}

class getProfileFail extends GetAboutState {
  final String error;

  getProfileFail({required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}