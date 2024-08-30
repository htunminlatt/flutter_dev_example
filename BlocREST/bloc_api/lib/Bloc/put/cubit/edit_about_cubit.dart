import 'package:bloc/bloc.dart';
import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/Data/respsitory.dart';
import 'package:equatable/equatable.dart';

part 'edit_about_state.dart';

class EditAboutCubit extends Cubit<EditAboutState> {
  EditAboutCubit(this.repo) : super(EditAboutInitial());

  final Repository repo;

  void updateAbout(String id,About data) {
    emit(EditAboutLoading());
    repo.updateAbout(id, data).then((value) => emit(EditAboutSuccess())).
    catchError((e)=> emit(EditAboutFail()));
  }
}
