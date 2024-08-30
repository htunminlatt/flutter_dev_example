import 'dart:convert';

import 'package:get_it_tutorial/domain/models/repomodel.dart';
import 'package:http/http.dart' as http;

class Repo {
  Future<ReopModel> getData() async {
    http.Response response = await http.get(Uri.parse("https://some-random-api.ml/meme"));
    Map<String,dynamic> singleData = jsonDecode(response.body);

    return ReopModel.fromJson(singleData);

  }
}