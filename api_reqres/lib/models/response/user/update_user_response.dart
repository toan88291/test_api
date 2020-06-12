import 'package:json_annotation/json_annotation.dart';
part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse {

  String name;

  String job;

  String updatedAt;

  UpdateUserResponse(this.name, this.job, this.updatedAt);

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) => _$UpdateUserResponseFromJson(json);

   Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
 }