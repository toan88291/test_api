import 'package:api_reqres/models/request/user/request_create_user.dart';
import 'package:api_reqres/models/request/user/request_update_user.dart';
import 'package:api_reqres/models/response/user/create_user_response.dart';
import 'package:api_reqres/models/response/user/update_user_response.dart';
import 'package:api_reqres/models/response/user/user_response.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestapi/data/repository/app_repository.dart';
import 'dart:developer' as developer;

class AppBloc extends ChangeNotifier {
  static const String TAG = 'AppBloc';
  AppRepository _appRepository;

  AppBloc(this._appRepository);

  Future<Result<UserResponse>> getListUser(int page) async {
    Result<UserResponse> result = await _appRepository.getListUser(page);
    if (result.isValue) {
      return Result.value(result.asValue.value);
    } else {
      return Result.error(result.asError.error);
    }
  }

  Future<Result<bool>> createUser(RequestCreateUser data) async {
    Result<CreateUserResponse> result = await _appRepository.createUser(data);
    if (result.isValue) {
      developer.log('create user success', name: TAG);
      return Result.value(true);
    } else {
      return Result.error(false);
    }
  }

  Future<Result<bool>> updateUser(RequestUpdateUser data, String id) async {
    Result<UpdateUserResponse> result =
        await _appRepository.updateUser(data, id);
    if (result.isValue) {
      developer.log('update user success', name: TAG);
      return Result.value(true);
    } else {
      return Result.error(false);
    }
  }

  Future<Result<bool>> deleteUser(String id) async {
    Result<bool> result = await _appRepository.deleteUser(id);
    if (result.isValue) {
      developer.log('delete user success', name: TAG);
      return Result.value(true);
    } else {
      return Result.error(false);
    }
  }
}
