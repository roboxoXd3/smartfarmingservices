import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartfarmingservices/src/Logic/Dialogs.dart';

import 'package:smartfarmingservices/src/Resources/Style/styles.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:smartfarmingservices/src/Screens/MyStore/Screen/MyStoreContainerlayout.dart';

class ItemDetailPage extends StatefulWidget {
  String Category_store;
  String Crop_name_store;
  String Detail_store;
  String Location_store;
  int Rating_store = 0;
  double Cost_store;
  File img;
  final _formkey = GlobalKey<FormState>();

  ItemDetailPage({@required this.Category_store});

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String imageButton = "Tap to add image";
  String url = "http://b98ca55b8685.ngrok.io/sell";
  String addImagemsg = "Nice choice or You Can Change";
  String base64Image;
  String filename;

  ///Get Data from gallery
  Future getImageCamera() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      widget.img = image;
      print("Image path $widget.img");
      base64Image = base64Encode(image.readAsBytesSync());
      filename = widget.img.path.split('/').last;
    });
  }

  Future<void> cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: widget.img.path,
    );

    setState(() {
      widget.img = cropped ?? widget.img;
    });
  }

  void clear() {
    setState(() {
      widget.img = null;
    });
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      widget.img = image;
      print("Image path $widget.img");
      base64Image = base64Encode(image.readAsBytesSync());
      filename = widget.img.path.split('/').last;
    });
  }

  postData() async {
    var dio = Dio();
    FormData formData;
    var response;
    try {
      formData = new FormData.fromMap({
        "Crop_name_store": widget.Crop_name_store,
        "Category_store": widget.Category_store,
        "Detail_store": widget.Detail_store,
        "Location_store": widget.Location_store,
        "Cost_store": widget.Cost_store,
        "Rating_store": widget.Rating_store,
        "img": await MultipartFile.fromFile(widget.img.path,
            filename: filename, contentType: new MediaType('img', 'jpg')),
//        "type": "img/jpg"
      });
      Dialogs.showLoadingDialog(context, _keyLoader);
      response = await dio.post(url, data: formData).whenComplete(
        () {
          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
          return Navigator.pop(context);
        },
      );
      return response.data;
    } catch (e) {
      print(e);
    }
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Details"),
          centerTitle: true,
          flexibleSpace: kAppBarContainer,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: kExpert,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: widget._formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Center(
                          child: Text(
                        "Add Info",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.w900),
                      )),
                    ),
//                    SizedBox(
//                      height: 20,
//                      child: Text(
//                        "-------------------------------------------------------------------",
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      ),
//                    ),
//                    (widget.img != null) ? Text(filename) : Text(""),
                    Text(
                      (widget.img == null) ? "" : addImagemsg,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext buildContext) {
                                    return Dialog(
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Select Image",
                                              style: TextStyle(fontSize: 30),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                RaisedButton(
                                                  onPressed: () {
                                                    getImageCamera();
                                                  },
                                                  color: Colors.green,
                                                  child: Text("Camera"),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                RaisedButton(
                                                  onPressed: () {
                                                    getImageGallery();
                                                  },
                                                  color: Colors.green,
                                                  child: Text("Gallery"),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: (widget.img == null)
                                  ? Center(
                                      child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        Text(imageButton),
                                      ],
                                    ))
                                  : Expanded(
                                      child: Image.file(
                                        widget.img,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            widget.Crop_name_store = value;
                          });
                        },
                        decoration: InputDecoration(labelText: "Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        maxLines: 3,
                        onSaved: (value) {
                          setState(() {
                            widget.Cost_store = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(labelText: "Price"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        maxLines: 3,
                        onSaved: (value) {
                          setState(() {
                            widget.Detail_store = value;
                          });
                        },
                        decoration: InputDecoration(labelText: "Description"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            widget.Location_store = value;
                          });
                        },
                        decoration: InputDecoration(labelText: "Location"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: GestureDetector(
                        onTap: () {
                          widget._formkey.currentState.save();
                          postData();
                        },
                        child: Material(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: kGradientColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            width: double.infinity,
                            height: 60,
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
