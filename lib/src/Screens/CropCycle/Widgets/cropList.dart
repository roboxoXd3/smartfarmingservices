import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../EachItemPage.dart';
import '../Model/crop_model.dart';
import 'package:http/http.dart' as http;

class CropList extends StatefulWidget {
  final List<CropModel> crops;
  CropList(this.crops);

  @override
  _CropListState createState() => _CropListState();
}

class _CropListState extends State<CropList> {
  CropModel cropModel;
  String url = "https://db55d0eac07e.ngrok.io";
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.crops.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, int index) {
          return GestureDetector(
            onLongPress: () async {
              showSnackBar() {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Item Deleted from the Database'),
                  duration: Duration(seconds: 3),
                ));
              }

              final ConfirmAction action = await _asyncConfirmDialog(context);

              if ('$action' == ConfirmAction.values[1].toString()) {
                http.Response response;
                response = await http
                    .delete(
                        "${url}/product/${cropModel.Crop_name[index].toString()}")
                    .whenComplete(() {
                  showSnackBar();
                });
              }
            },
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EachItemPage(
                  name: cropModel.Crop_name[index],
                  images:
                      "${url}/product/${cropModel.Crop_name[index].toString()}/image",
                );
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
//                                      padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green[200], width: 2),
                ),
                height: 100,
                child: GridTile(
                  child: Image.network(
                    "${url}/product/${cropModel.Crop_name[index].toString()}/image",
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    color: Colors.black38,
                    child: Text(
                      cropModel.Crop_name[index].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Varela'),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

enum ConfirmAction { Cancel, Accept }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete This Product'),
        content: const Text('This will delete the Product from your Database.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          FlatButton(
            child: const Text('Delete'),
            onPressed: () async {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
