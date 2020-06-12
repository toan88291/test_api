// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_create_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCreateUser _$RequestCreateUserFromJson(Map<String, dynamic> json) {
  return RequestCreateUser(
    json['name'] as String,
    json['job'] as String,
  );
}

Map<String, dynamic> _$RequestCreateUserToJson(RequestCreateUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
    };
