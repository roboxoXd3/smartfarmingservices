import 'package:flutter/material.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
//  color: Color(0xFF6CA8F1),
  color: Colors.black12,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kAdminPanelDecorationStyle = BoxDecoration(
//  color: Color(0xFF6CA8F1),
  color: Colors.green[100],
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kHintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

final kGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    // Color(0xff13547a),
    // Color(0xff80d0c7),
    Color(0xff56ab2f),
    Color(0xffa8e063),
  ],
);

final kBottomNavBar = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);

final Widget kAppBarContainer = Container(
  decoration: BoxDecoration(
    gradient: kGradientColor,
  ),
);

final Widget kExpert = GestureDetector(
  onTap: () {
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => ExpertScreen()),
//    );
  },
  child: Image.asset(
    expert,
  ),
);

final kTabBarProfileText = TextStyle(
  color: Colors.green[800],
  fontFamily: 'Varela',
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

final Color kPrimaryColor = Color(0xff13547a);

final String kOverView =
    """ A potato is a root vegetable, the Solanum tuberosum. It is a small plant with large leaves. The part of the potato that people eat is a tuber that grows under the ground. A potato contains a lot of starch and other carbohydrates. """;
final List<String> kGrowthCycle = [
//  'SPROUTING',
//  'VEGETATIVE',
//  'INITIATION',
//  'DEVELOPMENT',
//  'MATURE',
//  'DORMANT',
];

final List<String> kDiseases = [
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
final List<String> kFavWeatherCond = [
  'TEMPERATURE:',
  'HUMIDITY:',
  ' MOISTURE:',
  'pH VALUE:',
];
final String kPestFert = "10-20";

final List<String> kCropResult = [
  'Area of farm (hector):',
  'Seed shown (in kg):',
  'Total productivity (in kg):',
  'Investment Cost:',
  'Production cost:',
  'Average  market rates:',
];
