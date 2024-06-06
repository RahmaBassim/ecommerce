import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/firebase/firebase_datasource.dart';
import 'package:e_commerce/models/request/login_request/login_request.dart';
import 'package:e_commerce/models/response/login_response/loginResponse.dart';
import 'package:e_commerce/models/response/signup_response/signup_response.dart';
import 'package:flutter/material.dart';

class FirebaseDatasourceImpl extends FirebaseDatasource {
  final usersCollectionRef =
      FirebaseFirestore.instance.collection('Users').withConverter<UserModel>(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, options) => value.toJson(),
          );

  @override
  Future<UserModel> saveUser({required UserModel request}) async {
    try {
      await usersCollectionRef.add(request);
      return request;
    } catch (e) {
      throw SignupErrorResponse(message: e.toString());
    }
  }

  @override
  Future<UserModel> login({required LoginRequestModel request}) async {
    try {
      final userQuery = await usersCollectionRef
          .where("email", isEqualTo: request.email)
          .where("password", isEqualTo: request.password)
          .limit(1)
          .get();
      debugPrint('---------------------- ${userQuery}');
      UserModel userModel = userQuery.docs.isNotEmpty == true
          ? userQuery.docs.first.data()
          : UserModel(email: '');
    if(userModel.email?.isNotEmpty==true){
      return userModel;

    }
      throw LoginErrorResponseModel(message:  'Login Data is not correct');


    } on  LoginErrorResponseModel catch (e) {

      rethrow;
    }catch (e) {
          debugPrint('---------------------- ${e.toString()}');
      throw LoginErrorResponseModel(message: e.toString());
    }
  }
}
