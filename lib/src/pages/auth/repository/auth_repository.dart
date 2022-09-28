import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quitandavirtual/src/constants/endpoints.dart';
import 'package:quitandavirtual/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String username, required String password}) async {

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
//      setState(() {
//        isLoggedIn = true;
//      });
      print('Signin funcionou');
      print(response);
    } else {
      print('Signin não funcionou');
      print(response.error);
      //showError(response.error!.message);
    }

  }
}
