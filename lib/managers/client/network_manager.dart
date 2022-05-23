import 'dart:convert';
import 'package:http/http.dart';
import 'package:story_kids/models/client/abstract_request.dart';

class NetworkManager {
  static final NetworkManager instance = NetworkManager._internal();

// MARK: SECURE INFORMATION: serverUrl
  final String serverUrl = "***************************";
  late Uri serverUri;

  NetworkManager._internal() {
    serverUri = Uri.parse(serverUrl);
  }

  Map<String, dynamic> _responseToJson(Response response) {
    String formatedBody = '';

    for (int i = 0; i < response.body.length; i++) {
      if (response.body[i] == "'") {
        formatedBody += '"';
      } else if (response.body[i] == '"') {
      } else if (response.body[i] == '\\') {
        formatedBody += '"';
      } else {
        formatedBody += response.body[i];
      }
    }

    return jsonDecode(formatedBody);
  }

  Future<Map<String, dynamic>> commitRequest(AbstractRequest request) async {
    try {
      Map<String, dynamic> responseMap = request.toMap();
      Response response = await post(serverUri, body: jsonEncode(responseMap));
      return _responseToJson(response);
    } catch (e) {
      return {"result": "error", "description": e.toString()};
    }
  }
}
