import 'dart:math';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayriapp/secondpage.dart';

void main() {
  runApp(MaterialApp(
    home: firstpage(),
  ));
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filepermission();
  }
  Future<void> filepermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await [
        Permission.storage,
      ].request();
    }
  }
  List cat = [
    "Love",
    "Sad",
    "Funny",
    "Attitude",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text("Shayari App"),
          backgroundColor: Colors.blue.shade900,
        ),
        body: ListView.builder(
          itemCount: cat.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(5),
              elevation: 5,
              //color: Colors.blue.shade200,
              color: Colors.primaries[Random().nextInt(cat.length)].withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                title: Text(cat[index], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(""),
                leading: Image.asset(
                  "catimages/img${index + 1}.jpg",
                ),
                hoverColor: Colors.blue,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return secondpage(cat, index);
                    },
                  ));
                },
              ),
            );
          },
        ));
  }


}
