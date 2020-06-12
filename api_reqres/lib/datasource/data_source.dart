import 'package:api_reqres/models/request/user/request_create_user.dart';
import 'package:api_reqres/models/request/user/request_update_user.dart';
import 'package:api_reqres/models/response/user/create_user_response.dart';
import 'package:api_reqres/models/response/user/update_user_response.dart';
import 'package:api_reqres/models/response/user/user_response.dart';
import 'package:async/async.dart';

abstract class DataSource {

  Future<Result<UserResponse>> getListUser(int page);

  Future<Result<CreateUserResponse>> createUser(RequestCreateUser data);

  Future<Result<UpdateUserResponse>> updateUser(RequestUpdateUser data,String id);

  Future<Result<bool>> deleteUser(String id);

}