class CropModel {
// ignore: non_constant_identifier_names
  double Area_of_farm;
  // ignore: non_constant_identifier_names
  String Image;
// ignore: non_constant_identifier_names
  double Average_market_rates;
// ignore: non_constant_identifier_names
  String Category;
// ignore: non_constant_identifier_names
  String Crop_cycle;
// ignore: non_constant_identifier_names
  String Crop_name;
// ignore: non_constant_identifier_names
  double Humidity;
// ignore: non_constant_identifier_names
  double Investment_cost;
// ignore: non_constant_identifier_names
  String Location;
// ignore: non_constant_identifier_names
  double Moisture;
// ignore: non_constant_identifier_names
  double Nitrogen;
// ignore: non_constant_identifier_names
  String Overview;
// ignore: non_constant_identifier_names
  double Ph_value;
// ignore: non_constant_identifier_names
  double Phosphorus;
// ignore: non_constant_identifier_names
  String Possible_disease;
// ignore: non_constant_identifier_names
  double Production_Cost;
// ignore: non_constant_identifier_names
  double Seed_Sown;
// ignore: non_constant_identifier_names
  double Temperature;
// ignore: non_constant_identifier_names
  double Total_productivity;
// ignore: non_constant_identifier_names
  double Urea;

//  CropModel(
//    this.Area_of_farm,
//  this.Average_market_rates,
//  this.Category, this.Crop_cycle,
//  this.Crop_name, this.Humidity,
//  this.Investment_cost,
//  this.Location,
//  this.Moisture,
//   this.Nitrogen,
//   this.Overview,
//   this.Ph_value,
//   this.Phosphorus,
//    this.Possible_disease,
//     this.Production_Cost,
//      this.Seed_Sown,
//      this.Temperature,
//      this.Total_productivity,
//       this.Urea,
//       this.Image,
//       );

  CropModel.fromJson(Map<String, dynamic> parsedJson) {
    Area_of_farm = parsedJson['Area_of_farm'];
// ignore: non_constant_identifier_names
    Average_market_rates = parsedJson['Average_market_rates'];
// ignore: non_constant_identifier_names
    Category = parsedJson['Category'];
// ignore: non_constant_identifier_names
    Crop_cycle = parsedJson['Crop_cycle'];
// ignore: non_constant_identifier_names
    Crop_name = parsedJson['Crop_name'];
// ignore: non_constant_identifier_names
    Humidity = parsedJson['Humidity'];
// ignore: non_constant_identifier_names
    Investment_cost = parsedJson['Investment_cost'];
// ignore: non_constant_identifier_names
    Location = parsedJson['Location'];
// ignore: non_constant_identifier_names
    Moisture = parsedJson['Moisture'];
// ignore: non_constant_identifier_names
    Nitrogen = parsedJson['Nitrogen'];
// ignore: non_constant_identifier_names
    Overview = parsedJson['Overview'];
// ignore: non_constant_identifier_names
    Ph_value = parsedJson['Ph_value'];
// ignore: non_constant_identifier_names
    Phosphorus = parsedJson['Phosphorus'];
// ignore: non_constant_identifier_names
    Possible_disease = parsedJson['Possible_disease'];
// ignore: non_constant_identifier_names
    Production_Cost = parsedJson['Production_Cost'];
// ignore: non_constant_identifier_names
    Seed_Sown = parsedJson['Seed_Sown'];
// ignore: non_constant_identifier_names
    Temperature = parsedJson['Temperature'];
// ignore: non_constant_identifier_names
    Total_productivity = parsedJson['Total_productivity'];
// ignore: non_constant_identifier_names
    Urea = parsedJson['Urea'];
  }
}
