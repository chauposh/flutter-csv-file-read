import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //

  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString("assets/data/products.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    data = csvTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('network test'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('press me'),
            onPressed: () async {
              await loadAsset();
              print(data[0][1]);
            }),
      ),
    );
  }
}
