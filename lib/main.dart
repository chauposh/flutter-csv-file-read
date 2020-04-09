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

  List<List<dynamic>> data;

  @override
  void initState() {
    loadAsset();
    super.initState();
  }

  loadAsset() async {
    var myData = await rootBundle.loadString("assets/data/category.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
      setState(() {
        data = csvTable;
      });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('network test'),
      ),
      body: ListView.builder(
          itemCount: (data == null ? 0 : data[0].length),
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Text(data[0][index]));
          }),
    );
  }
}
