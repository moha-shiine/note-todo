// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_notesql/models/models.dart';

import 'package:flutter_notesql/widgets/reposotroy.dart';
import 'package:gap/gap.dart';

class update extends StatefulWidget {
  final Data? data;
  update({
    super.key,
    required this.data,
  });

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  TextEditingController titelcontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  @override
  void initState() {
    super.initState();

    titelcontroller.text = widget.data!.title.toString();
    desccontroller.text = widget.data!.description.toString();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Repostory repostory = Repostory();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  color: Color(0xFF009688),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100))),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 18,
                  left: 18,
                ),
                child: ListView(
                  children: [
                    Gap(12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: titelcontroller,
                        decoration: InputDecoration(
                            hintText: "Titel",
                            hintStyle: TextStyle(color: Colors.grey),

                            // helperText: "titel",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: desccontroller,
                        decoration: InputDecoration(
                            hintText: "discription",
                            hintStyle: TextStyle(color: Colors.grey),

                            // helperText: "titel",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    Gap(11),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              final response = await repostory.updatDAta(
                                  widget.data!.id.toString(),
                                  titelcontroller.text,
                                  desccontroller.text);
                              print(response);
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.teal),
                              child: Center(
                                  child: Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            )),
                        TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.teal),
                              child: Center(
                                  child: Text(
                                "Cansel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
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
