// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_notesql/widgets/reposotroy.dart';

class AddScrens extends StatefulWidget {
  const AddScrens({
    super.key,
  });

  @override
  State<AddScrens> createState() => _AddScrensState();
}

class _AddScrensState extends State<AddScrens> {
  @override
  Widget build(BuildContext context) {
    Repostory repostory = Repostory();
    TextEditingController titelcontroller = TextEditingController();
    TextEditingController desccontroller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 70,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 18,
                  left: 18,
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: titelcontroller,
                        decoration: InputDecoration(
                            hintText: "Titel",
                            hintStyle: TextStyle(color: Colors.grey),

                            // helperText: "titel",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 2,
                        controller: desccontroller,
                        decoration: InputDecoration(
                            hintText: "discription",
                            hintStyle: TextStyle(color: Colors.grey),

                            // helperText: "titel",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              try {
                                final response = await repostory.addData(
                                    titelcontroller.text, desccontroller.text);
                                if (response) {
                                  print(response);
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal),
                              child: Center(
                                  child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            )),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal),
                              child: Center(
                                  child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contact',
          ),
        ],
      ),
    );
  }

  int _currentIndex = 0;
}
