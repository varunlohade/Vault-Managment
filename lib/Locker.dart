import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lockerapp/main.dart';
import 'package:sizer/sizer.dart';

class Locker extends StatefulWidget {
  final String lockerName;
  const Locker({super.key, required this.lockerName});

  @override
  State<Locker> createState() => _LockerState();
}

class _LockerState extends State<Locker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController namecontroller = TextEditingController();
  final controller = PageController(initialPage: 1);
  TextEditingController textcontroller = TextEditingController();

  wina() {
    FirebaseFirestore.instance.collection("collectionPath");
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // SystemChrome.setPreferredOrientations([DeviceOrientation.]);
    _controller = AnimationController(vsync: this);
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
  updatingsize() {
    print("working");

    for (var j = 1235; j <= 1246; j++) {
      FirebaseFirestore.instance
          .collection("Column_D")
          .doc('D_$j')
          .update({"size": "L"});
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

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
                itemCount: 2,
                itemBuilder: ((context, index) {
                  print("Index of item builder $index");
                  return Column(
                    children: [
                      searchValue.isEmpty
                          ? Text(
                              "Column ${widget.lockerName}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )
                          : Text("Search Result"),
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: searchValue.isEmpty
                                ? FirebaseFirestore.instance
                                    .collection('Column_${widget.lockerName}')
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
                                            widget.lockerName,
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
                                            child: Column(
                                              children: [
                                                Text(
                                                  ds['size'].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    searchValue.isEmpty
                                                        ? Text("")
                                                        : Text(
                                                            "${ds['Clno']}-",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
