import 'package:quitandavirtual/src/constants/endpoints.dart';
import 'package:quitandavirtual/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    _httpManager.restRequest(
      url: Endpoints.signIn,
      method: httpMethods.put,
      body: {
        "email": email,
        "password": password
      }
    );
  }
}
