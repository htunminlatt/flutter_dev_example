// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['name'] as String,
      json['avatar'] as String,
      json['address'] as String,
      json['phone'] as int,
      json['job'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'address': instance.address,
      'phone': instance.phone,
      'job': instance.job,
    };
