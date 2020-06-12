import 'package:api_reqres/models/request/user/request_create_user.dart';
import 'package:api_reqres/models/request/user/request_update_user.dart';
import 'package:api_reqres/models/response/user/create_user_response.dart';
import 'package:api_reqres/models/response/user/update_user_response.dart';
import 'package:api_reqres/models/response/user/user_response.dart';
import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class ApiService {
  static const TAG = 'ApiService';
  Dio _dio;

  ApiService(this._dio);

  Future<Result<UserResponse>> getListUser(int page) async {
    Response response = await _dio.get('users', queryParameters: {'page': page});
    if (response.statusCode == 200) {
      return Result.value(UserResponse.fromJson(response.data));
    } else {
      return Result.error('error'); //// response tra khi loi chua ro rang
    }
  }

  Future<Result<CreateUserResponse>> createUser(RequestCreateUser data) async {
    Response response = await _dio.post('users', data: data.toJson());
    if (response.statusCode == 201) {
      return Result.value(CreateUserResponse.fromJson(response.data));
    } else {
      return Result.error('error'); //// response tra khi loi chua ro rang
    }
  }

  Future<Result<UpdateUserResponse>> updateUser(RequestUpdateUser data, String id) async {
    Response response = await _dio.put('users/$id', data: data.toJson());
    if (response.statusCode == 200) {
      return Result.value(UpdateUserResponse.fromJson(response.data));
    } else {
      developer.log('updateUser ${response}', name: TAG);
      return Result.error('error'); //// response tra khi loi chua ro rang
    }
  }


  Future<Result<bool>> deleteUser(String id) async {
    Response response = await _dio.delete('users/$id');
    if (response.statusCode == 204) {
      return Result.value(true); //// k tra ve response
    } else {
      return Result.error(false);
    }
  }

}