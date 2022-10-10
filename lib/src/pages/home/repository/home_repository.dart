import 'package:quitandavirtual/src/constants/endpoints.dart';
import 'package:quitandavirtual/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );
  }
}
