import 'package:Flutter_Retrofit/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

part 'user_repository.g.dart';

@RestApi(baseUrl: "https://60166c5755dfbd00174cae67.mockapi.io/api/")
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET('/users')
  Future<List<UserModel>> getAllUsers();

  @GET('/users/{id}')
  Future<UserModel> getDetailUserById(@Path('id') String id);

  @POST('/users')
  Future<void> insertNewUser(@Body() UserModel user);
}
