import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quitandavirtual/src/constants/Setings.dart';

class Parseinit {

  void parseInit() async {
    await Parse().initialize(
      Setings.aplicationId,
      Setings.baseUrl,
      clientKey: Setings.clientId,
      debug: false,
      autoSendSessionId: true
    );
  }
}