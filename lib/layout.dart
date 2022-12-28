import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lockerapp/Locker.dart';
import 'package:sizer/sizer.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    super.initState();
    updatingsize();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  

  updatingsize() {
    print("<===========updating============>");

    for (var j = 2145; j <= 2162; j++) {
      FirebaseFirestore.instance
          .collection("Column_Z")
          .doc('Z_$j')
          .update({"size": "M"}).then((value) {
        print("working==>>");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Locker(
                              lockerName: "E",
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 6.0.h,
                          width: 25.0.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.greenAccent),
                          child: Center(
                              child: Text(
                            "E",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ))),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Locker(
                                      lockerName: "D",
                                    )));
                      },
                      child: Container(
                          height: 6.0.h,
                          width: 25.0.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.greenAccent),
                          child: Center(
                              child: Text(
                            "D",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ))),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Locker(
                              lockerName: "C",
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 6.0.h,
                          width: 25.0.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.greenAccent),
                          child: Center(
                              child: Text(
                            "C",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ))),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Locker(
                              lockerName: "B",
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 6.0.h,
                          width: 25.0.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.greenAccent),
                          child: Center(
                              child: Text(
                            "B",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ))),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Locker(
                              lockerName: "A",
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 6.0.h,
                          width: 25.0.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.greenAccent),
                          child: Center(
                              child: Text(
                            "A",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ))),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "Z",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "Z",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "Y",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "Y",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                  width: 0.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "F",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "F",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "G",
                                ),
                              ),
                            );
                          }),
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "G",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "H",
                                ),
                              ),
                            );
                          }),
                          child: Container(
                            height: 6.0.h,
                            width: 25.0.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(1),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Text(
                                "H",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "I",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "I",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "X",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "X",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "M",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "M",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "L",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "L",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "K",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "K",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "J",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 6.0.h,
                            width: 25.0.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(1),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Text(
                                "J",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "W",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 6.0.h,
                            width: 25.0.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(1),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Text(
                                "W",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "N",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "N",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "O",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "O",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "P",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "P",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "Q",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 6.0.h,
                            width: 25.0.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(1),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Text(
                                "Q",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "U",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "U",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "T",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "T",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "S",
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 6.0.h,
                              width: 25.0.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1),
                                  color: Colors.greenAccent),
                              child: Center(
                                  child: Text(
                                "S",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "R",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 6.0.h,
                            width: 25.0.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(1),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Text(
                                "R",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Locker(
                                  lockerName: "V",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 6.0.h,
                            width: 25.0.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(1),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Text(
                                "V",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // TODO: implement dispose
    super.dispose();

  }
}
