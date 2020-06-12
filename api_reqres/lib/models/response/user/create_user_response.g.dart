// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    json['id'] as String,
    json['name'] as String,
    json['job'] as String,
    json['createdAt'] as String,
  );
}

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'job': instance.job,
      'createdAt': instance.createdAt,
    };
