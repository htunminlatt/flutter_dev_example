import 'package:get_it_tutorial/domain/models/repomodel.dart';

class RepoController {
  Future<ReopModel> getRepo() async {
    return await ReopModel();
  }
}