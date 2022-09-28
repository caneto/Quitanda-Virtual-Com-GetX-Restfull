import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AuthRepository {

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
