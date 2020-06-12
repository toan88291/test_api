import 'package:json_annotation/json_annotation.dart';
part 'request_create_user.g.dart';

@JsonSerializable()
class RequestCreateUser {

  String name;

  String job;

  RequestCreateUser(this.name, this.job);

  factory RequestCreateUser.fromJson(Map<String, dynamic> json) => _$RequestCreateUserFromJson(json);

   Map<String, dynamic> toJson() => _$RequestCreateUserToJson(this);
 }