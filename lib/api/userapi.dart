// import 'package:dio/dio.dart';
//
//
// import '../models/mlodels.dart';
// import 'baseapi.dart';
//
// class UserApi extends BaseApi {
//   Future<User> registerUser(Map<String, String> data) async {
//     Response response = await dio.post("api/getAllDigitalMenu.php", data: data);
//
//     return User.fromJson(response.data);
//   }
// }