import 'package:api_reqres/models/response/user/detail_user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {

  int page;

  int per_page;

  int total;

  int total_pages;

  List<DetailUserResponse> data;

  UserResponse(this.page, this.per_page, this.total, this.total_pages,
      this.data);

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

   Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}