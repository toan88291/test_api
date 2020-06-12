import 'package:json_annotation/json_annotation.dart';
part 'detail_user_response.g.dart';

@JsonSerializable()
class DetailUserResponse {

  int id;

  String email;

  String first_name;

  String last_name;

  String avatar;

  DetailUserResponse(this.id, this.email, this.first_name, this.last_name,
      this.avatar);

  factory DetailUserResponse.fromJson(Map<String, dynamic> json) => _$DetailUserResponseFromJson(json);

   Map<String, dynamic> toJson() => _$DetailUserResponseToJson(this);
 }