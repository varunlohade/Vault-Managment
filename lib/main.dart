import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController namecontroller = TextEditingController();
  final controller = PageController(initialPage: 1);
  TextEditingController textcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    updateu();
    _controller = AnimationController(vsync: this);
  }

  updateu() {
    for (int i = 9001; i <= 9016; i++) {
      FirebaseFirestore.instance
          .collection("Column_U")
          .doc("U_A$i")
          .set({"Name": "Empty", "id": "A$i", "status": "Vacent"});
    }
  }

  List aplhabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String searchValue = '';
  Stream<QuerySnapshot>? streamQuery;
  int values = 1;
  Color colorss = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("Locker Management"),
            searchHintText: "Search by Name",
            onSearch: (value) {
              print("This is search value $value");
              setState(() {
                searchValue = value.toLowerCase();
                streamQuery = FirebaseFirestore.instance
                    .collection("BookedClients")
                    .where("Name", isGreaterThanOrEqualTo: searchValue)
                    .snapshots();
              });
            }),
        body: SafeArea(
          left: true,
          right: true,
          bottom: true,
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: PageView.builder(
                allowImplicitScrolling: true,
                onPageChanged: (value) {
                  print("this is page change value $value");
                  values = value;
                },
                controller: controller,
                itemCount: 27,
                itemBuilder: ((context, index) {
                  print("Index of item builder $index");
                  return Column(
                    children: [
                      searchValue.isEmpty
                          ? Text(
                              "Column ${aplhabet[index - 1]}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )
                          : Text("Search Result"),
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: searchValue.isEmpty
                                ? FirebaseFirestore.instance
                                    .collection('Column_${aplhabet[index - 1]}')
                                    .orderBy("id", descending: false)
                                    .snapshots()
                                : streamQuery,
                            builder: (BuildContext context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Text("NO Data");
                              } else {
                                return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    DocumentSnapshot ds =
                                        snapshot.data!.docs[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          print("Button Pressed");
                                          opendialog(
                                            context,
                                            ds['id'],
                                            namecontroller,
                                            ds['status'],
                                            values - 1,
                                            ds["Name"],
                                          );
                                          namecontroller.clear();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 2.h, horizontal: 2.h),
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0.0, 1.0),
                                                  blurRadius: 6.0,
                                                )
                                              ],
                                              border: Border.all(width: 0.1.h),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // ),
                                              color: ds['status'] == "Vacent"
                                                  ? Colors.green
                                                  : Colors.red),
                                          // color: Colors.red,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                searchValue.isEmpty
                                                    ? Text("")
                                                    : Text(
                                                        "${ds['Clno']}-",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18),
                                                      ),
                                                Text(
                                                  ds['id'].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data!.docs.length,
                                );
                              }
                            }),
                      ),
                    ],
                  );
                }),
              ))
            ],
          ),
        ));
  }
}

updatefirebaselocker(var id, var aplha) {
  print("");
  List aplhabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  // if (aplhabet[aplha] == "U") {
  //   FirebaseFirestore.instance
  //       .collection("BookedClients")
  //       .doc("Col${aplhabet[aplha]}A$id")
  //       .delete();

  //   FirebaseFirestore.instance
  //       .collection("Column_${aplhabet[aplha]}")
  //       .doc("${aplhabet[aplha]}_A$id")
  //       .update({
  //     "Name": "Empty",
  //     "status": "Vacent",
  //   });
  // } else {
    FirebaseFirestore.instance
        .collection("BookedClients")
        .doc("Col${aplhabet[aplha]}$id")
        .delete();

    FirebaseFirestore.instance
        .collection("Column_${aplhabet[aplha]}")
        .doc("${aplhabet[aplha]}_$id")
        .update({
      "Name": "Empty",
      "status": "Vacent",
    });
  // }
}

opendialog(
    context, var id, var controller, String status, var aplha, var newName) {
  print(newName);
  int counter = 0;
  List aplhabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  bool _switchValue = true;
  print("cc $newName");
  print("This is status: $status");
  print("This is $counter");
  status == "Booked" && counter == 0
      ? showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Change Vacancy status"),
                content: Text("Locker belongs to: $newName"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      if (counter == 0) {
                        updatefirebaselocker(id, aplha);
                        counter = 1;
                      }
                    },
                    child: Text("Vacent"),
                  )
                ],
              ))
      : showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Change Vacancy status"),
                actions: [
                  Column(
                    children: [
                      const Text("Locker belongs to"),
                      TextFormField(
                        controller: controller,
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () async {
                        if (counter == 0) {
                          // if (aplhabet[aplha] == "U") {
                          //   Navigator.pop(context);
                          //   print("on pressed running");
                          //   FirebaseFirestore.instance
                          //       .collection("BookedClients")
                          //       .doc("Col${aplhabet[aplha]}A$id")
                          //       .set({
                          //     "Name": controller.text.toString().toLowerCase(),
                          //     "id": id,
                          //     "Clno": aplhabet[aplha],
                          //     "status": "Booked"
                          //   });
                          //   FirebaseFirestore.instance
                          //       .collection("Column_${aplhabet[aplha]}")
                          //       .doc("${aplhabet[aplha]}_A$id")
                          //       .update({
                          //     "id": id,
                          //     "status": "Booked",
                          //     "Name": controller.text.toString(),
                          //   });
                          // } else {
                            Navigator.pop(context);
                            print("on pressed running");
                            FirebaseFirestore.instance
                                .collection("BookedClients")
                                .doc("Col${aplhabet[aplha]}$id")
                                .set({
                              "Name": controller.text,
                              "id": id,
                              "Clno": aplhabet[aplha],
                              "status": "Booked"
                            });
                            FirebaseFirestore.instance
                                .collection("Column_${aplhabet[aplha]}")
                                .doc("${aplhabet[aplha]}_$id")
                                .update({
                              "id": id,
                              "status": "Booked",
                              "Name": controller.text,
                            });
                          }
                        // }
                      },
                      child: Text("Booked")),
                ],
              ));
}
