
import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/Data/profile.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'apiservice.g.dart';
@RestApi(baseUrl: 'https://656956d8de53105b0dd6ebdb.mockapi.io/api/')
abstract class Apiservice {
  factory Apiservice(Dio dio, {String baseUrl}) = _Apiservice;

  @GET('about')
  Future<List<About>> getAbout();
   @GET('profile')
  Future<List<Profile>> getProfile();

  @PUT('about/{id}')
  Future<About> update(@Path() String id, @Body() About task);
  
  @DELETE('about/{id}')
  Future<void> delete(@Path() String id);
  
  @POST('about')
  Future<About> create(@Body() About task);
}