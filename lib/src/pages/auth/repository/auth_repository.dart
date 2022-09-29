import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quitandavirtual/src/models/user_model.dart';

class AuthRepository {

  UserModel userModel = UserModel();

  Future signIn({required String username, required String password}) async {

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
      userModel.username = user.get('username').toString();
      userModel.phone = user.get('phone').toString();
      userModel.fullname = user.get('fullname').toString();
      userModel.id = user.get('objectId').toString();
      userModel.token = user.get('sessionToken').toString();

      print(userModel.username);






    } else {
      print('Signin não funcionou');
      print(response.error);
      //showError(response.error!.message);
    }

  }
}
