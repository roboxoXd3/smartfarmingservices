import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:smartfarmingservices/src/Screens/CropCycle/Model/crop_model.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Model/product.dart';

import 'httpServices.dart';

class CropManager {
  HttpServices httpServices = new HttpServices();

  Stream<List<CropModel>> get cropListView {
    return Stream.fromFuture(HttpServices.fetchCrops());
  }

  Stream<List<Product>> get productListView {
    return Stream.fromFuture(HttpServices.fetchItems());
  }

  Stream<List<CropModel>> filteredcropListView({query}) {
    return Stream.fromFuture(HttpServices.fetchCrops(query: query));
  }

  Stream<List<Product>> filteredproductListView({query}) {
    return Stream.fromFuture(HttpServices.fetchItems(query: query));
  }
}
