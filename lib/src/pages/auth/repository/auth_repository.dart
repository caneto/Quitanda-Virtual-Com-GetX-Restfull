import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quitandavirtual/src/constants/endpoints.dart';
import 'package:quitandavirtual/src/models/user_model.dart';
import 'package:quitandavirtual/src/pages/auth/result/auth_result.dart';
import 'package:quitandavirtual/src/services/http_manager.dart';
import 'package:quitandavirtual/src/pages/auth/repository/auth_errors.dart'
    as authErrors;

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token':token,
      }
    );
    return handleUserOrError(result);
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );

    return handleUserOrError(result);
  }

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  UserModel userModel = UserModel();

  Future signInParse(
      {required String username, required String password}) async {
    final user = ParseUser(username, password, null);
    var response = await user.login();

    if (response.success) {
//      setState(() {
//        isLoggedIn = true;
//      });
      print('Signin funcionou');
      print(response.result);
      print(user.get('fullname'));

      userModel.cpf = user.get('cpf').toString();
      userModel.email = user.get('email').toString();
      userModel.password = user.get('password').toString();
      //userModel.username = user.get('username').toString();
      userModel.phone = user.get('phone').toString();
      //userModel.fullname = user.get('fullname').toString();
      userModel.id = user.get('objectId').toString();
      userModel.token = user.get('sessionToken').toString();

      //print(userModel.username);

    } else {
      print('Signin não funcionou');
      print(response.error);
      //showError(response.error!.message);
    }
  }
}
