import 'package:flutter/material.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:smartfarmingservices/src/Resources/ImageLink/ImageLink.dart';

class AboutME extends StatefulWidget {
  @override
  _AboutMEState createState() => _AboutMEState();
}

class _AboutMEState extends State<AboutME> {
int currentValue=0;
int age;
String education;
int number;
double field;
bool upgrade;

final _formKey =GlobalKey<FormState>(); 


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "Lets Update the profile",
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 26),
                    child: Container(
//                      padding: EdgeInsets.only(top: 20),
//                      margin: EdgeInsets.only(top: 20),
                        height: 50,
                        child: FAProgressBar(
                          displayText: '%',
                          size: 10,
                          backgroundColor: Color(0xffffffff),
                          borderRadius: 20,
                          currentValue: currentValue,
                          // changeProgressColor: Colors.red,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8),
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(award),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
//              width: 200,
                child: Form(
                      key: _formKey,
                    child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyInfoTab(
                        name:  'What is your age?',
                        validator: (value){
                          if(value!=int)
                          {
                            return " Enter a valid age";
                          }
                          return null;
                        },
                        onSaved: (value){
                         age = value;
                        },

                      ),
                      MyInfoTab(
                             name:  'What is your education',
                             
                             onSaved: (value){
                               education = value;
                             },
                          ),
                        MyInfoTab(
                           name: 'Enter your number',
                           validator: (value){
                             if(value!=int)
                             {
                               return "Enter a valid number";
                             }
                             return null;
                           },
                           onSaved: (value){
                             number = value;
                           },
                        ),
                         MyInfoTab(
                            name: 'How much land do you have?',
                            // validator: (){},
                            onSaved: (value){
                              field = value;
                            },
                         ),
                          
                       ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyInfoTab extends StatelessWidget {


  final String name;
  final Function onSaved;
  final Function validator;

  const MyInfoTab({Key key, this.name, this.onSaved, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Card(
                elevation: 6,
                borderOnForeground: false,
                child: new Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  height: 150,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                           name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Varela'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0),
                        child: 
                        TextFormField(
                          validator: validator,
                          onSaved: onSaved,
                          decoration: InputDecoration(
                              hintText: "Enter here"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: RaisedButton(
                          color: Colors.green[600],
                          child: Text('Submit'),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
