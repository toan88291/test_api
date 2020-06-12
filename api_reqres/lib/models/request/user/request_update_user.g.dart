// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_update_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestUpdateUser _$RequestUpdateUserFromJson(Map<String, dynamic> json) {
  return RequestUpdateUser(
    json['name'] as String,
    json['job'] as String,
  );
}

Map<String, dynamic> _$RequestUpdateUserToJson(RequestUpdateUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
    };
