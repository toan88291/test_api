import 'package:json_annotation/json_annotation.dart';
part 'request_update_user.g.dart';

@JsonSerializable()
class RequestUpdateUser {

  String name;

  String job;
  
  RequestUpdateUser(this.name, this.job);

  factory RequestUpdateUser.fromJson(Map<String, dynamic> json) => _$RequestUpdateUserFromJson(json);

   Map<String, dynamic> toJson() => _$RequestUpdateUserToJson(this);
 }