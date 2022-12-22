import 'dart:math';

import 'package:belajar_bloc_arsitectur/data/model/data_home.dart';
import 'package:belajar_bloc_arsitectur/data/model/product.dart';
import 'package:belajar_bloc_arsitectur/data/model/user.dart';
import 'package:belajar_bloc_arsitectur/data/provider/product_provider.dart';
import 'package:belajar_bloc_arsitectur/data/provider/user_provider.dart';

class RandomRepository {
  ProductProvider productProvider = ProductProvider();
  UserProvider userProvider = UserProvider();

  Future<Map<String, dynamic>> getRandomData() async {
    // ignore: unnecessary_cast
    Map<String, dynamic> dataUser = await userProvider.getAllUser();
    Map<String, dynamic> dataProduct = await productProvider.getAllProduct();

    if (dataUser["error"] == true) {
      return dataUser;
    }

    if (dataProduct["error"] == true) {
      return dataProduct;
    }

    //Get random user
    UserModel userModel = dataUser["data"];
    late DataUser dataRandomUser;
    // ignore: unnecessary_null_comparison
    if (userModel != null) {
      dataRandomUser = userModel.data!.randomUser();
    } else {
      dataRandomUser = DataUser();
    }

    //Get randome product
    ProductModel productModel = dataProduct["data"];
    late Product dataRandomProduct;
    // ignore: unnecessary_null_comparison
    if (productModel != null) {
      dataRandomProduct = productModel.products.randomProduct();
    }
    return {
      "error": false,
      "message": "Berhasil mengambil database user & product",
      "data": DataHomeModel(
          fullname: "${dataRandomUser.firstName} ${dataRandomUser.lastName}",
          email: "${dataRandomUser.email}",
          profile: "${dataRandomUser.avatar}",
          category: dataRandomProduct.category,
          gambarProduct: dataRandomProduct.thumbnail,
          title: dataRandomProduct.title,
          image: dataRandomProduct.images.first)
    };
  }
}

//contoh cara random sebuah list
extension RandomListUser on List<DataUser> {
  DataUser randomUser() => elementAt(Random().nextInt(length - 1));
}

extension RandomListProduct on List<Product> {
  Product randomProduct() => elementAt(Random().nextInt(length - 1));
}
