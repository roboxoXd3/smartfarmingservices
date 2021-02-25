import 'package:flutter/material.dart';
class Kart extends StatefulWidget {
  final String name;
  final String location;
  final double Price;
  final String image;

  const Kart({Key key, this.name, this.location, this.Price, this.image}) : super(key: key);
  @override
  _KartState createState() => _KartState();
}

class _KartState extends State<Kart> {
  int i=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
          itemCount: i++,
          itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              height:
              MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              widget.image),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white10,
                          )
                        ]),
                    height: MediaQuery.of(context)
                        .size
                        .height,
                    width: MediaQuery.of(context)
                        .size
                        .width /
                        2.5,
                  ),
                  Expanded(
                    child: Container(
                      decoration:
                      BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey[100],
                        )
                      ]),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "₹" +
                                widget.Price
                                    .toString(),
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.name
                                .toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20,
                                fontStyle:
                                FontStyle.normal,
                                fontWeight:
                                FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                left: 8.0),
                            child: Container(
                              child: Text(
                                widget.location,
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 14,
                                  fontStyle:
                                  FontStyle.normal,
                                ),
                              ),
                              alignment:
                              Alignment.bottomCenter,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
