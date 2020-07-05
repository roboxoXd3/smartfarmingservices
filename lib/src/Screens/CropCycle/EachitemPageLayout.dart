import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/Style/styles.dart';

import 'EachItemPage.dart';
import 'TabBarView.dart';

class EachItemPageLayout extends StatelessWidget {
  Datagrid obj;
  EachItemPageLayout(this.obj, this.dataItem);
  DataItem dataItem;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(obj, dataItem),
    );
  }
}

class MyHomePage extends StatefulWidget {
  Datagrid obj;
  DataItem dataItem;
  MyHomePage(this.obj, this.dataItem);
  @override
  _MyHomePageState createState() => _MyHomePageState(obj, dataItem);
}

class _MyHomePageState extends State<MyHomePage> {
  Datagrid obj;
  _MyHomePageState(this.obj, this.dataItem);
  DataItem dataItem;

  static List<String> growthCycle = [
    'Sprouting',
    'Vegetative',
    'Initiation',
    'Developing',
    'Mature',
    'Dormant',
  ];

  static List<String> possibleDiseases = [
    'Common Scab (Streptomyces spp.)',
    'Early blight (Alternaria solani)',
    'Fusarium Dry Rot (Fusarium spp.)',
    'Black Dot (Colletotrichum coccodes)',
    'Silver Scurf (Helminthosporium solani)',
    'Black Scurf and Rhizoctonia Canker (Rhizoctonia solani)',
    'Pink Rot (Phytophthora erythroseptica) and Pythium Leak (Pythium spp.)',
    'Late Blight (Phytophthora infestans)',
    'Potato Virus Y',
    'Physiological Disorders',
  ];
  static List<String> tableTitleWeatherCondition = [
    'Temperature',
    'Humidity',
    'Moisture',
    'PH value',
    'Salinity threshold',
  ];
  static List<String> tableFieldsWeatherConditon = [
    '15-20(°C)',
    '25',
    '25',
    '4.8- 5.8',
    '25'
  ];

  static List<String> tableTitleCropResult = [
    'Area of farm (hector)',
    'Seed shown (in kg)',
    'Total productivity (in kg)',
    'Investment Cost',
    'Production cost',
    'Average  market rates,'
  ];
  static List<String> tableFieldsCropResult = [
    '200',
    '50',
    '50',
    '1000',
    '1000',
    '50/kg'
  ];
  List<DataItem> myList = [
    DataItem('OverView', isTable: false, Overview: kOverView),
    DataItem('Growth Cycle', isTable: false, items: growthCycle),
    DataItem(
      'Weather Condition',
      isTable: true,
      tableTitle: tableTitleWeatherCondition,
      tableFields: tableFieldsWeatherConditon,
    ),
    DataItem('Suitable Pesticides and Fertilizers',
        isTable: false,
        Overview:
            """Nutrient requirement of potato crop is quit high and the application of fertilizers and organic manures is considered essential to obtain economic and high yields. In light soils and places where organic manures are not easily available, green manuring is beneficial. The optimum dose of fertilizer application varies greatly depending upon the soil type, soil fertility, climate, crop rotation, variety, length of growing season and moisture supply. A fertilizer dose of 180-240 kg N, 60-90 kg P2 O 5 and 85- 130 K 2O per hectare is recommended for alluvial soils of Indo Gangetic plains. In the hill zone, the application of 100-150 kg N, 100-150 kg P2 O5 and 50-100 kg K2 O per hectare is recommended. In black soils of plateau areas about 120-150 kg N, 50 kg each of P2 O5 & K2 O is recommended. In the acidic soils of southern plateau 120kg N, 115 kg P2 O5, and 120 K2 O kg per hectare are recommended for potato production. Two third of N and entire dose of P and K is given at the time of planting. The balance N is given at the time of earthing up operation. The fertilizers are applied by band placement 5 cm away from the tubers. Ammonium sulphate and ammonium nitrate are usually the best fertilizers for potato followed by calcium ammonium nitrate, ammonium chloride and urea."""),
    DataItem('Possible Diseases and Treatment',
        isTable: false, items: possibleDiseases),
    DataItem(
      'Crop Results',
      isTable: true,
      tableTitle: tableTitleCropResult,
      tableFields: tableFieldsCropResult,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: Center(
        child: EachItemPage(obj, myList),
      ),
    );
  }
}

class DataItem {
  String title;
  bool isTable = false;
  List<String> tableTitle;
  List<String> tableFields;
  String Overview;
  List<String> items;

  DataItem(this.title,
      {this.isTable,
      this.tableTitle,
      this.tableFields,
      this.Overview,
      this.items});
}
