import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayriapp/fourthpage.dart';

class thirdpage extends StatefulWidget {
  List blank;
  int index;
  List cat;
  var appbarcopy;

  thirdpage(this.blank, this.index, this.cat, this.appbarcopy);

  int count = 0;

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  PageController page = PageController();
  @override
  void initState() {
    super.initState();
    setState(() {
      page=PageController(initialPage: widget.index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${widget.appbarcopy}"),
          backgroundColor: Colors.blue.shade900),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: page,
              onPageChanged: (value) {
              setState(() {
                  widget.index = value;
              });
            },itemCount: widget.blank.length,
              itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                color: Colors.indigoAccent,
                  child: Text(
                      "${widget.blank[widget.index]}",
                      style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,
                    ),
              );
            },
            ),
            // child: Container(
            //   margin: EdgeInsets.all(10),
            //   padding: EdgeInsets.all(8),
            //   alignment: Alignment.center,
            //   color: Colors.indigoAccent,
            //   child: Text(
            //     "${widget.blank[widget.index]}",
            //     style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
            //   ),
            // ),
          ),
          Row(
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () {
                      FlutterClipboard.copy("${widget.blank[widget.index]}")
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "Copied",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER_RIGHT,
                            //timeInSecForIosWeb: 3,
                            backgroundColor: Colors.blue.shade900,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    icon: Icon(
                      Icons.copy_outlined,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.index > 0) {
                          widget.index--;
                        } else {
                          Fluttertoast.showToast(
                              msg: "First Shayari",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP_RIGHT,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.blue.shade900,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        String blankofindex= "${widget.blank[widget.index]}";
                        return fourthpage(blankofindex);
                      },));
                    },
                    icon: Icon(
                      Icons.edit_off_rounded,
                      color: Colors.blue.shade900,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.index < widget.blank.length - 1) {
                          widget.index++;
                        } else {
                          Fluttertoast.showToast(
                              msg: "Last Shayari",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP_RIGHT,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.blue.shade900,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      Share.share("${widget.blank[widget.index]}");
                    },
                    icon: Icon(
                      Icons.share_rounded,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
