import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/shared/config.dart';
import 'package:weather_app/shared/toast_custom.dart';

Future<dynamic> fetchData(
  String url, {
  FetchDataMethod method = FetchDataMethod.get,
  TokenLabel tokenLabel = TokenLabel.tokenId,
  int timeoutInSecond = 30,
  Map<String, String> extraHeader = const <String, String>{},
  String rtoMessage = 'Request Timeout',
  String noConnectionMessage = 'No Connection Detected',
  bool showToastWhenRto = true,
  bool showToastWhenNoConnection = true,
  Map<String, dynamic> body = const <String, dynamic>{},
  List<String>? paramsDelete = const <String>[],
}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final http.Client client = http.Client();
  try {
    //default header
    final Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      tokenLabel == TokenLabel.xa ? 'XA' : 'token-id':
          prefs.getString('token').toString()
    };

    //adding extra header if exist
    headers.addAll(extraHeader);

    //functions to request to endpoint
    Future<http.Response> _getResponse(Map<String, String>? h) async {
      if (method == FetchDataMethod.put) {
        return client
            .put(
              Uri.parse('${Config.domain}$url'),
              headers: h ?? headers,
              body: jsonEncode(body),
            )
            .timeout(Duration(seconds: timeoutInSecond));
      } else if (method == FetchDataMethod.post) {
        return client
            .post(
              Uri.parse('${Config.domain}$url'),
              headers: h ?? headers,
              body: jsonEncode(body),
            )
            .timeout(Duration(seconds: timeoutInSecond));
      } else if (method == FetchDataMethod.delete) {
        return client
            .delete(
              Uri.parse('${Config.domain}$url'),
              headers: h ?? headers,
              body: jsonEncode(paramsDelete),
            )
            .timeout(Duration(seconds: timeoutInSecond));
      } else {
        return client
            .get(
              Uri.parse('${Config.domain}$url'),
              headers: h ?? headers,
            )
            .timeout(Duration(seconds: timeoutInSecond));
      }
    }

    // //do request to endpoint
    final http.Response response = await _getResponse(null);
    if (response.statusCode != 500) {
      //Close request after endpoint send callback
      client.close();

      return jsonDecode(response.body);
    } else {
      final http.Response response = await _getResponse(<String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        tokenLabel == TokenLabel.xa ? 'XA' : 'token-id':
            prefs.getString('token').toString()
      });

      //Close request after endpoint send callback
      client.close();

      return jsonDecode(response.body);
    }
  } on TimeoutException {
    //Triggered when timeout
    if (showToastWhenRto) showToast(rtoMessage);
    return <String, dynamic>{'status': 0, 'message': rtoMessage};
  } on SocketException {
    //Triggered hen no internet connection
    if (showToastWhenNoConnection) showToast(noConnectionMessage);
    return <String, dynamic>{'status': 0, 'message': noConnectionMessage};
  }
}
