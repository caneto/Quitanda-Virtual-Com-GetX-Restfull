import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserModel {
  String? id;
  String? username;
  String? fullname;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? token;

  UserModel({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.token,
  });

}