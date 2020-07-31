import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smartfarmingservices/src/Screens/CropCycle/Model/crop_model.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Model/product.dart';

class HttpServices {
  static String url = "http://ad8c657b0937.ngrok.io/product";
  final String postUrl = "http://ad8c657b0937.ngrok.io/crop";
  static String itemsUrl = "http://ad8c657b0937.ngrok.io/buy";

  static Future<List<CropModel>> fetchCrops({query}) async {
    http.Response res = await http.get(url);

    String content = res.body;
    List collection = json.decode(content);

    Iterable<CropModel> _crops = collection.map((e) => CropModel.fromJson(e));
    if (query != null && query.isNotEmpty) {
      _crops = _crops
          .where((element) => element.Crop_name.toLowerCase().contains(query));
    }
    return _crops.toList();
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
  List result = await HttpServices.fetchItems();
  print(result);
}
