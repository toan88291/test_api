import 'package:api_reqres/datasource/api_service.dart';
import 'package:api_reqres/datasource/data_source.dart';
import 'package:api_reqres/models/request/user/request_create_user.dart';
import 'package:api_reqres/models/request/user/request_update_user.dart';
import 'package:api_reqres/models/response/user/create_user_response.dart';
import 'package:api_reqres/models/response/user/update_user_response.dart';
import 'package:api_reqres/models/response/user/user_response.dart';
import 'package:async/src/result/result.dart';

class AppRepository implements DataSource {
  ApiService _apiService;

  AppRepository(this._apiService);

  @override
  Future<Result<UserResponse>> getListUser(int page) async {
    Result<UserResponse> result = await _apiService.getListUser(page);
    if (result.isValue) {
      return Result.value(result.asValue.value);
    } else {
      return Result.error('error');
    }
  }

  @override
  Future<Result<CreateUserResponse>> createUser(RequestCreateUser data) async {
    Result<CreateUserResponse> result = await _apiService.createUser(data);
    if (result.isValue) {
      return Result.value(result.asValue.value);
    } else {
      return Result.error('error');
    }
  }

  @override
  Future<Result<UpdateUserResponse>> updateUser(
      RequestUpdateUser data, String id) async {
    Result<UpdateUserResponse> result = await _apiService.updateUser(data, id);
    if (result.isValue) {
      return Result.value(result.asValue.value);
    } else {
      return Result.error('error');
    }
  }

  @override
  Future<Result<bool>> deleteUser(String id) async {
    Result<bool> result = await _apiService.deleteUser(id);
    if (result.isValue) {
      return Result.value(result.asValue.value);
    } else {
      return Result.error('error');
    }
  }
}
