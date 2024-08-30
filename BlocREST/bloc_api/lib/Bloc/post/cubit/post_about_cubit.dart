import 'package:bloc/bloc.dart';
import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/Data/respsitory.dart';
import 'package:equatable/equatable.dart';

part 'post_about_state.dart';

class PostAboutCubit extends Cubit<PostAboutState> {
  PostAboutCubit(this.repo) : super(PostAboutInitial());

  final Repository repo;
  void addPostSuccess(About data) {
    emit(PostAboutDataloading());
    repo.addAbout(data).then((value) => emit (PostAboutDataSuccess()))
    .catchError((e) => emit(PostAboutDataFail(error: "Error")));
  }

 
}
