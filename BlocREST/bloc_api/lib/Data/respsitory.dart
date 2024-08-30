import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/Data/profile.dart';
import 'package:bloc_api/Model/apiservice.dart';

class Repository {
  final Apiservice _apiservice;

  Repository({required Apiservice apiservice}) : _apiservice = apiservice;

  Future<List<About>> getAbout() => _apiservice.getAbout();
  Future<About> addAbout(About about) => _apiservice.create(about);
  Future<About> updateAbout(String id,About about) => _apiservice.update(id, about);
  Future<void> deleteAbout(String id) => _apiservice.delete(id);

  Future<List<Profile>> getPrifile() => _apiservice.getProfile();
}