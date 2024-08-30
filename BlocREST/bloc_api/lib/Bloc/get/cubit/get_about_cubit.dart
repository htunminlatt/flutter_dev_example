import 'package:bloc/bloc.dart';
import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/Data/profile.dart';
import 'package:bloc_api/Data/respsitory.dart';
import 'package:equatable/equatable.dart';

part 'get_about_state.dart';

class GetAboutCubit extends Cubit<GetAboutState> {
  GetAboutCubit(this.repo) : super(GetAboutInitial()){
    getAbout();
  }

  final Repository repo;
  void getAbout() {
    emit(GetAboutInitial());
    repo
        .getAbout()
        .then((value) => emit(GetAboutSuccess(about: value)))
        .catchError((e) => GetAboutFail(error: "error"));
  }

  void getProfile() {
    emit(GetAboutInitial());
    repo
        .getPrifile()
        .then((value) => emit(getProfileSuccss(profileData: value)))
        .catchError((err) => getProfileFail(error: "Error"));
  }

void delete(String id){
  emit(GetAboutInitial());
    repo.deleteAbout(id).then((value) => getAbout()).
    catchError((e)=> emit((GetAboutFail(error: "Cannot delete!"))));
}

}
