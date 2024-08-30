
import 'package:flutter/scheduler.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'about.g.dart';
@JsonSerializable()
class About {
  String id;
  String name;
  String address;
  String job;
  int age;
  int phone;

  About(this.name,this.address,this.job,this.age,this.phone,this.id);
  factory About.fromJson(Map<String,dynamic> json) => _$AboutFromJson(json);
  Map<String,dynamic> toJson() => _$AboutToJson(this);
}