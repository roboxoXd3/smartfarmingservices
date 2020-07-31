class Data {
  ///name and list part
//  String category;
  String name, overview, cropCycle, possibleDiseases;
//  List<String> growthStages;
//  List<String> possibleDiseases;

  ///weather condition table part
  double temperature;
  double humidity;
  double moisture;
  double pH;

  ///chemical table part
  double nitrogen;
  double phosphorus;
  double potash;
  double urea;

  ///crop result tabledata
  double farmArea;
  double investmentcost;
  double marketrates;
  double productioncost;
  double seedshown;
  double totalprouctivity;

  Data(
      {this.name,
      this.overview,
      this.cropCycle,
      this.possibleDiseases,
      this.temperature,
      this.humidity,
      this.moisture,
      this.pH,
      this.nitrogen,
      this.phosphorus,
      this.potash,
      this.urea,
      this.farmArea,
      this.investmentcost,
      this.marketrates,
      this.productioncost,
      this.seedshown,
      this.totalprouctivity});
}
