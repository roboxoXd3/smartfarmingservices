import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:smartfarmingservices/src/Screens/ChatApp/Model/User.dart';
import 'dart:convert';

import 'package:smartfarmingservices/src/Screens/CropCycle/Model/crop_model.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Model/product.dart';

class HttpServices {
  static String baseUrl = "https://sftservices.herokuapp.com/";
  static String getProductList = baseUrl+"product";
  static final String postUrl = baseUrl+"crop";
  static String itemsUrl = baseUrl+"buy";

  static String userUrl = "https://jsonplaceholder.typicode.com/users";



  static Future<List<CropModel>> fetchCrops({query}) async {
    http.Response res = await http.get(getProductList);

    await Future.delayed(Duration(seconds: 1));
    String content = res.body;
    List collection = json.decode(content);
    Iterable<CropModel> _crops = collection.map((e) => CropModel.fromJson(e));
    if (query != null && query.isNotEmpty) {
      _crops = _crops
          .where((element) => element.Crop_name.toLowerCase().contains(query));
    }
    return _crops.toList();
  }

  static Future<List<User>> fetchUsers({query}) async {
    http.Response res = await http.get(userUrl);

    ///res.body se content k andr wo long string aa gyi jo ki ek list h lekin abi b usko dart m use krne k liye decode krna pdega;
    String content = res.body;

    ///yha hm decode b kr rhe aur save b kr rhe ek local List k andr.
    List collection = json.decode(content);
    Iterable<User> _users = collection.map((e) => User.fromjson(e));
    if (query != null && query.isNotEmpty) {
      _users =
          _users.where((element) => element.name.toLowerCase().contains(query));
    }
    return _users.toList();
  }


  static Future<List<Product>> fetchItems({query}) async {
    http.Response res = await http.get(itemsUrl);

    String content = res.body;
    List collection = json.decode(content);

    Iterable<Product> _items = collection.map((e) => Product.fromJson(e));
    if (query != null && query.isNotEmpty) {
      _items = _items.where(
          (element) => element.Crop_name_store.toLowerCase().contains(query));
    }
    return _items.toList();
  }
}

void main() async {
  List result = await HttpServices.fetchUsers();
  print(result);
}
