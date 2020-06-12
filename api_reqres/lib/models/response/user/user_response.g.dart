// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    json['page'] as int,
    json['per_page'] as int,
    json['total'] as int,
    json['total_pages'] as int,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DetailUserResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data,
    };
