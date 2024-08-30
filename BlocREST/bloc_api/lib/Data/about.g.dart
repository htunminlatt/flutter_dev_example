// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) => About(
      json['name'] as String,
      json['address'] as String,
      json['job'] as String,
      json['age'] as int,
      json['phone'] as int,
      json['id'] as String,
    );

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'job': instance.job,
      'age': instance.age,
      'phone': instance.phone,
    };
