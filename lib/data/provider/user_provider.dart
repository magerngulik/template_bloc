import 'package:belajar_bloc_arsitectur/data/model/user.dart';
import 'package:dio/dio.dart';

class UserProvider {
  Future<Map<String, dynamic>> getAllUser() async {
    try {
      var response = await Dio().get(
        "https://reqres.in/api/users",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode != 200) {
        return {
          "error": true,
          "message": "${response.statusCode}",
        };
      }

      Map<String, dynamic> body = response.data;

      return {
        "error": false,
        "message": "Berhasil get data user",
        "data": UserModel.fromJson(body)
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}
