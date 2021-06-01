import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<bool> login(String login, String senha) async {
    var url = Uri.parse('https://apiibgl.azurewebsites.net/api/login');

    var header = {"Content-type": "application/json"};

    Map params = {"login": login, "password": senha};

    var _body = jsonEncode(params);

    var response = await http.post(url, headers: header, body: _body);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}
