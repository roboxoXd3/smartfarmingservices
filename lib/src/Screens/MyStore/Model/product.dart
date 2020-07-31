class Product {
  String Crop_name_store;
  String Category_store;
  String Location_store;
  double Cost_store;
  String Detail_store;
  int Rating_store;

//  Product(this.Crop_name_store, this.Category_store, this.Location_store, this.Cost_store, this.Detail_store, this.Rating_store);

  Product.fromJson(Map<String, dynamic> parsedJson) {
    Crop_name_store = parsedJson['Crop_name_store'];
    Category_store = parsedJson['Category_store '];
    Location_store = parsedJson['Location_store'];
    Cost_store = parsedJson['Cost_store'];
    Detail_store = parsedJson['Detail_store'];
    Rating_store = parsedJson['Rating_store'];
  }
}
