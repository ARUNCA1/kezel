import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/mlodels.dart';
class DataService {
  Future<List<DataModel>> getAll() async {
    try {
      http.Response response=await http.post(Uri.parse("https://kezel.co/api/getAllDigitalMenu.php"),body:{"restaurant":"LeisureInnVKL",});

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body)['menu_items'];
        return responseData.map((json) => DataModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
  // Future<List<DataModel>> getAll() async {
  //   http.Response response=await http.post(Uri.parse("https://kezel.co/api/getAllDigitalMenu.php"),body:{"restaurant":"LeisureInnVKL",});
  //   String data=response.body;
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     var todos = jsonDecode(response.body)["menu_items"].map((e) {
  //       return DataModel(array: json);
  //
  //     }).toList();
  //     print(todos.toString()+"nnnnnnnn");
  //     return todos;
  //   }
  //   return [];
  // }
}

// class DataService{
//
//   Future<List<DataModel>> getAll() async {
//   http.Response response=await http.post(Uri.parse("https://kezel.co/api/getAllDigitalMenu.php"),body:{"restaurant":"LeisureInnVKL",});
//   String data=response.body;
//   log(data+"ddddddddddddddd");
//   // var streetsFromJson = jsonDecode(response.body)["menu_items"];
//   // List<String> streetsList = new List<String>.from(streetsFromJson);
//   log(response.statusCode.toString()+"bbbb");
//   if (response.statusCode == 200) {
//    // final json = jsonDecode(response.body) as List;
//   final todos = jsonDecode(response.body)["menu_items"].map((e) {
//   log(jsonDecode(response.body)["menu_items"].toString()+"jjjjjj");
//   return DataModel(response:"hhh", menuItems: jsonDecode(response.body)["menu_items"], pageTitle: "", );
//   }).toList();
//   return todos;
//   }
//   return [];
//   }
//
//
//
//   }
//
//
//
//
//
//    // String body = Uri(queryParameters: <String, String> {"key":"restaurant","value":"LeisureInnVKL"}).query;
//    //  http.Response response=await http.post(Uri.parse("https://kezel.co/api/getAllDigitalMenu.php"),body:{"restaurant":"LeisureInnVKL",});
//    //  String data=response.body;
//    //  log(data+"ddddddddddddddd");
//    //  log(response.statusCode.toString()+"bbbb");
//    //  if (response.statusCode == 200) {
//    //    final item = json.decode(response.body);
//    //    log(item.toString()+"ttttttttttt");
//    //    var i;
//    //  //   for(i=0;i<item.length;i++)
//    //  //     {
//    //  //       result = DataModel.fromJson(item);
//    //  //
//    //  //     }
//    //  // // ;
//    //    final json = jsonDecode(response.body) as List;
//    //    final todos = json.map((e) {
//    //      return Todo(
//    //        id: e['id'],
//    //        title: e['title'],
//    //        userId: e['userId'],
//    //        completed: e['completed'],
//    //      );
//    //    }).toList();
//    //    return todos;
//    //    print(item.toString()+"result");
//    //  } else {
//    //    print("error");
//    //  }
//
