import 'package:bloc/bloc.dart';
import 'package:bloc_api/Data/respsitory.dart';
import 'package:equatable/equatable.dart';

part 'delete_about_state.dart';

class DeleteAboutCubit extends Cubit<DeleteAboutState> {
  DeleteAboutCubit(this.repo) : super(DeleteAboutInitial());

  final Repository repo;

  void delete(String id){
    emit(DeleteAboutInitial());

    repo.deleteAbout(id).then((value) => emit(DeleteAboutSuccess())).
    catchError((e)=> emit(DeleteAboutFail()));
  }
}
