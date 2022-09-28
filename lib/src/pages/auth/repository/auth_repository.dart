import 'package:quitandavirtual/src/constants/endpoints.dart';
import 'package:quitandavirtual/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signIn,
      method: httpMethods.put,
      body: {
        "email": email,
        "password": password
      }
    );

    if(result['result']) {
      print('Signin funcionou');
    } else {
      print('Signin não funcionou');
    }
  }
}
