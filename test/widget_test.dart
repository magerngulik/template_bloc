// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:belajar_bloc_arsitectur/data/model/data_home.dart';
import 'package:belajar_bloc_arsitectur/data/reporsitories/random_repository.dart';

void main() async {
  // ProductProvider productProvider = ProductProvider();
  // UserProvider userProvider = UserProvider();

  // // ignore: avoid_print, await_only_futures
  // print(await userProvider.getAllUser());
  // // ignore: avoid_print, await_only_futures
  // print(await productProvider.getAllProduct());

  RandomRepository randomRepository = RandomRepository();

  Map<String, dynamic> dataRandom = await randomRepository.getRandomData();
  DataHomeModel data = dataRandom["data"];

  print(data.toJson());
}
