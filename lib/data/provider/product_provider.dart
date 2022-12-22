import 'package:belajar_bloc_arsitectur/data/model/product.dart';
import 'package:dio/dio.dart';

class ProductProvider {
  Future<Map<String, dynamic>> getAllProduct() async {
    try {
      var response = await Dio().get(
        "https://dummyjson.com/products",
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
        "message": "Berhasil get data product",
        "data": ProductModel.fromJson(body)
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}
