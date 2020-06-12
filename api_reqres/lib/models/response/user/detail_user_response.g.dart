// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailUserResponse _$DetailUserResponseFromJson(Map<String, dynamic> json) {
  return DetailUserResponse(
    json['id'] as int,
    json['email'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$DetailUserResponseToJson(DetailUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };
