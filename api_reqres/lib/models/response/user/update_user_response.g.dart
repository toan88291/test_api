// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse(
    json['name'] as String,
    json['job'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$UpdateUserResponseToJson(UpdateUserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
      'updatedAt': instance.updatedAt,
    };
