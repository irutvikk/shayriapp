import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';

class fourthpage extends StatefulWidget {
  String blankofindex;

  fourthpage(this.blankofindex);
  @override
  State<fourthpage> createState() => _fourthpageState();
}
class _fourthpageState extends State<fourthpage> {
  String folderpath="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createFolder();
  }
  _createFolder()async{
    final folderName="ShayriApp";
    final path= Directory("storage/emulated/0/$folderName");
    if ((await path.exists())){
      // TODO:
      print("exist");
    }else{
      // TODO:
      print("not exist");
      path.create();
    }
    setState(() {
      folderpath = path.path;
    });
  }
  GlobalKey gb=GlobalKey();
  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
      gb.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  List emojis = ["😀😃😄😁","😁😆😅🤣","😃😄😅🤣","🤣😎🤓🧐","🥰😍🤩😘","🥰😍😄😁","😃🤩😄😅"];
  List fontfamily= ["font1","font2","font3","font4"];
  String font="";
  List<Color> colorlist = [
    Colors.red,
    Colors.brown,
    Colors.yellowAccent,
    Colors.grey,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.lightGreen,
    Colors.blueGrey,
    Colors.blue,
    Colors.yellow,
    Colors.redAccent,
    Colors.deepPurple,
    Colors.indigo,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.white,
    Colors.teal,
    Colors.black
  ];
  double fontsize = 20;
  Color current = Colors.indigoAccent;
  Color textcolor = Colors.white;
  String defaultemoji = "🤩😁🤣🤣";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Edit Shayari"), backgroundColor: Colors.blue.shade900),
      body: Column(children: [
        Expanded(
            child: Container(
          child: Center(
            child: RepaintBoundary(
              key: gb,
              child: Container(
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                color: current,
                height: 600,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Text("$defaultemoji\n${widget.blankofindex}\n$defaultemoji",textAlign: TextAlign.center,style: TextStyle(fontSize: fontsize,color: textcolor,fontFamily: font)),
                // child: Text(
                //   "$defaultemoji\n${widget.blankofindex}\n$defaultemoji",
                //   style: TextStyle(
                //       fontSize: fontsize,
                //       color: textcolor,
                //       fontWeight: FontWeight.bold),
                // ),
              ),
            ),
          ),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: GridView.builder(
                        itemCount: colorlist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 8),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                current = colorlist[index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colorlist[index],
                                  border: Border.all(width: 1)),
                              margin: EdgeInsets.all(5),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Text("Background"),
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 37)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFAFF0000))),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: GridView.builder(
                        itemCount: colorlist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 8),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                textcolor = colorlist[index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colorlist[index],
                                  border: Border.all(width: 1)),
                              margin: EdgeInsets.all(5),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Text("Text Color"),
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 37)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFAFF0000))),
            ),
            ElevatedButton(
              onPressed: () {
                _capturePng().then((value) async {
                  print("$value");
                  String imagename="Image${Random().nextInt(10000)}.jpg";
                  String imagepath="$folderpath/$imagename";
                  File file = File(imagepath);
                  file.writeAsBytes(value);

               await file.create();
                  Share.shareFiles(['${file.path}']);
                });
              },
              child: Text("Share"),
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 37)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFAFF0000))),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: fontfamily.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                font=fontfamily[index];
                              });
                            },
                            child: ListTile(title: Text("Shayari",textAlign: TextAlign.center,style: TextStyle(fontFamily: fontfamily[index]),)),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Text("Font"),
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 37)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFAFF0000))),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: emojis.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                defaultemoji = emojis[index];
                              });
                            },
                            child: ListTile(title: Text("${emojis[index]}",textAlign: TextAlign.center,)),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Text("Emoji"),
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 37)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFAFF0000))),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setState1) {
                      return Container(
                        height: 100,
                        color: Colors.white,
                        child: Slider(
                          min: 20,
                          max: 34,
                          value: fontsize,
                          onChanged: (value) {
                            setState(() {
                              setState1(() {
                                fontsize = value;
                              });
                            });
                          },
                        ),
                      );
                    },);
                  },
                );
              },
              child: Text("Text Size"),
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(100, 37)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFAFF0000))),
            ),
          ],
        )
      ]),
    );
  }
}
