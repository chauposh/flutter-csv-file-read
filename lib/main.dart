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

  Future<List<String>> loadAsset() async {
    var myData = await rootBundle.loadString("assets/data/category.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    //
    List<String> data = [];
    csvTable[0].forEach((value) {
      data.add(value.toString());
    });
    return data;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('network test'),
      ),
      body: Center(
        child: FutureBuilder(
            future: loadAsset(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // this condition is important
              if (snapshot.data == null) {
                return Center(
                  child: Text('loading data'),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(child: Text(snapshot.data[index]));
                    });
              }
            }),
      ),
    );
  }
}
