import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String name;
  String avatar;
  String address;
  int phone;
  String job;
  Profile(this.name,this.avatar,this.address,this.phone,this.job);

  factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
  Map<String,dynamic> toJson() => _$ProfileToJson(this);
}