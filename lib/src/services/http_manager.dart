import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quitandavirtual/src/constants/endpoints.dart';

class HttpManager {

  void ParseInit() async {
    await Parse().initialize(
      Endpoints.baseUrl,
      Endpoints.aplicationId,
      clientKey: Endpoints.clientId,
      autoSendSessionId: true
    );
  }
}