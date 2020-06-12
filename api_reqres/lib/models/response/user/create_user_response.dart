import 'package:json_annotation/json_annotation.dart';
part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse {

  String id;

  String name;

  String job;

  String createdAt;
  
  CreateUserResponse(this.id, this.name, this.job, this.createdAt);

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) => _$CreateUserResponseFromJson(json);

   Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
 }