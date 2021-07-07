import 'package:flutter/material.dart';

void main() {
  runApp(RealCity());
}

class RealCity extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country State and City Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String countryValue;
  String stateValue;
  String cityValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Country State and City Picker'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 600,
          child: Column(
            children: [
              RaisedButton(
                  child: Text('ok'),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context,);
                    });
                  }),
            ],
          )),
    );
  }
}
  // child: TextField(
                  //   onChanged: (value) {
                      
                    
                  //   },
                  //   style: TextStyle(color: Colors.black),
                  //   decoration: KtextFieldStyle,
                  // )