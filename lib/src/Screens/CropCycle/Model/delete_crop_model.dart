import 'dart:convert';

/// Area_of_farm : 1000.0
/// Average_market_rates : 10.0
/// Category : "Fruit"
/// Crop_cycle : "dfsdggdfbfdbdthfd"
/// Crop_name : "Pineapple"
/// Humidity : 2.0
/// Investment_cost : 32.0
/// Location : "Datia"
/// Moisture : 3.0
/// Nitrogen : 6.0
/// Overview : "mast fruit baba"
/// Ph_value : 4.0
/// Phosphorus : 7.0
/// Possible_disease : "dgdfgdgddffd"
/// Potash : 8.0
/// Production_Cost : 1234.0
/// Seed_Sown : 123.0
/// Temperature : 1.0
/// Total_productivity : 123.0
/// Urea : 5.0

import 'package:http/http.dart' as http;
import 'package:smartfarmingservices/src/Services/httpServices.dart';

class DeleteCropModel {
  double _areaOfFarm;
  double _averageMarketRates;
  String _category;
  String _cropCycle;
  String _cropName;
  double _humidity;
  double _investmentCost;
  String _location;
  double _moisture;
  double _nitrogen;
  String _overview;
  double _phValue;
  double _phosphorus;
  String _possibleDisease;
  double _potash;
  double _productionCost;
  double _seedSown;
  double _temperature;
  double _totalProductivity;
  double _urea;

  double get areaOfFarm => _areaOfFarm;

  double get averageMarketRates => _averageMarketRates;

  String get category => _category;

  String get cropCycle => _cropCycle;

  String get cropName => _cropName;

  double get humidity => _humidity;

  double get investmentCost => _investmentCost;

  String get location => _location;

  double get moisture => _moisture;

  double get nitrogen => _nitrogen;

  String get overview => _overview;

  double get phValue => _phValue;

  double get phosphorus => _phosphorus;

  String get possibleDisease => _possibleDisease;

  double get potash => _potash;

  double get productionCost => _productionCost;

  double get seedSown => _seedSown;

  double get temperature => _temperature;

  double get totalProductivity => _totalProductivity;

  double get urea => _urea;

  DeleteCropModel(
      {double areaOfFarm,
      double averageMarketRates,
      String category,
      String cropCycle,
      String cropName,
      double humidity,
      double investmentCost,
      String location,
      double moisture,
      double nitrogen,
      String overview,
      double phValue,
      double phosphorus,
      String possibleDisease,
      double potash,
      double productionCost,
      double seedSown,
      double temperature,
      double totalProductivity,
      double urea}) {
    _areaOfFarm = areaOfFarm;
    _averageMarketRates = averageMarketRates;
    _category = category;
    _cropCycle = cropCycle;
    _cropName = cropName;
    _humidity = humidity;
    _investmentCost = investmentCost;
    _location = location;
    _moisture = moisture;
    _nitrogen = nitrogen;
    _overview = overview;
    _phValue = phValue;
    _phosphorus = phosphorus;
    _possibleDisease = possibleDisease;
    _potash = potash;
    _productionCost = productionCost;
    _seedSown = seedSown;
    _temperature = temperature;
    _totalProductivity = totalProductivity;
    _urea = urea;
  }

  DeleteCropModel.fromJson(dynamic json) {
    _areaOfFarm = json["Area_of_farm"];
    _averageMarketRates = json["Average_market_rates"];
    _category = json["Category"];
    _cropCycle = json["Crop_cycle"];
    _cropName = json["Crop_name"];
    _humidity = json["Humidity"];
    _investmentCost = json["Investment_cost"];
    _location = json["Location"];
    _moisture = json["Moisture"];
    _nitrogen = json["Nitrogen"];
    _overview = json["Overview"];
    _phValue = json["Ph_value"];
    _phosphorus = json["Phosphorus"];
    _possibleDisease = json["Possible_disease"];
    _potash = json["Potash"];
    _productionCost = json["Production_Cost"];
    _seedSown = json["Seed_Sown"];
    _temperature = json["Temperature"];
    _totalProductivity = json["Total_productivity"];
    _urea = json["Urea"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Area_of_farm"] = _areaOfFarm;
    map["Average_market_rates"] = _averageMarketRates;
    map["Category"] = _category;
    map["Crop_cycle"] = _cropCycle;
    map["Crop_name"] = _cropName;
    map["Humidity"] = _humidity;
    map["Investment_cost"] = _investmentCost;
    map["Location"] = _location;
    map["Moisture"] = _moisture;
    map["Nitrogen"] = _nitrogen;
    map["Overview"] = _overview;
    map["Ph_value"] = _phValue;
    map["Phosphorus"] = _phosphorus;
    map["Possible_disease"] = _possibleDisease;
    map["Potash"] = _potash;
    map["Production_Cost"] = _productionCost;
    map["Seed_Sown"] = _seedSown;
    map["Temperature"] = _temperature;
    map["Total_productivity"] = _totalProductivity;
    map["Urea"] = _urea;
    return map;
  }
}

Future<DeleteCropModel> deleteCrop({String cropName}) async {
  var response = await http.delete(
    Uri.encodeFull(HttpServices.getProductList+"/"+cropName),
  );
  var decodedResponse = DeleteCropModel.fromJson(jsonDecode(response.body));
  return decodedResponse;
}
