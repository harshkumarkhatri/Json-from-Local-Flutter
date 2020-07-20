import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      home: HomePage(), theme: ThemeData(primarySwatch: Colors.teal)));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json from Local"),
        ),
        body: Container(
          child: Center(
            // FutureBuilder is being used to oad local json files.
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person.json'),
              builder: (context, snapshot) {
                // decoding the json data
                var mydata = jsonDecode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                              Text("Name" + mydata[index]['name'],style: TextStyle(fontSize: 20),),
                              Text("Age" + mydata[index]['age']),
                              Text("Hair Color" + mydata[index]['hair_color']),
                              Text("Height" + mydata[index]['height']),
                              Text("Gender" + mydata[index]['Gender']),
                            
                          
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,
                );
              },
            ),
          ),
        ));
  }
}

mixin JSON {}
