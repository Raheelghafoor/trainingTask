import 'dart:convert';
import 'dart:io';

class ApiController {
  static String baseUrl = "https://obaidullah1122.pythonanywhere.com/api/user/";

  static Future<dynamic> userRegistration() async {
    Map<String, dynamic> userPassJson() => {
          "email": "raheelghafoor2977@gmail.com",
          "name": "raheel",
          "password": "123456",
          "password2": "123456",
          "contact": "54646456546",
          "role": "user",
          "device_token": "655646646565656",
          "tc": "True",
          "is_registered": true
        };

    HttpClient httpClient = HttpClient();
    final request = await httpClient.postUrl(Uri.parse(baseUrl + "register/"));
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.add(utf8.encode(json.encode(userPassJson())));
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    print("==============${response.statusCode}");
    final result = jsonDecode(responseBody);
    print("========== ${result}");
    return result;
  }
}
