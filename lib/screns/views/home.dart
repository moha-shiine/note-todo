import 'package:flutter/material.dart';
import 'package:flutter_notesql/models/models.dart';

import 'package:flutter_notesql/widgets/reposotroy.dart';

import 'package:flutter_notesql/screns/addscreeens.dart';
import 'package:flutter_notesql/screns/update.dart';
// import 'package:flutter_notesql/screns/update.dart';

import 'package:gap/gap.dart';

class LIstSCRENS extends StatefulWidget {
  const LIstSCRENS({super.key});

  @override
  State<LIstSCRENS> createState() => _LIstSCRENSState();
}

class _LIstSCRENSState extends State<LIstSCRENS> {
  Repostory repostory = Repostory();
  List<Data> listNote = [];
  void getData() async {
    final data = await repostory.getData();
    print(data.data?.first.title.toString());

    listNote = data.data ?? [];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
        ],
        title: Center(
          child: Text(
            "ToDo Notes App",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Drawer(
        child: widgetDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Note",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "data of to day",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AddScrens();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white),
                      child: Text("+ Add Data"))
                ],
              ),
            ),
            Gap(20),
            ListView.builder(
                itemCount: listNote.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // ignore: unused_local_variable
                  final notemodel = listNote[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  update(data: listNote[index])));
                    },
                    child: Dismissible(
                      key: Key(listNote[index].id.toString()),
                      confirmDismiss: (direction) {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content:
                                    Text("will You want to delete this data ?"),
                                title: Text("Delete"),
                                actions: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.teal),
                                      onPressed: () async {
                                        try {
                                          // ignore: unused_local_variable
                                          final response = await repostory
                                              .deleteData(listNote[index]
                                                  .id
                                                  .toString());
                                        } catch (e) {}
                                        Navigator.pop(context);
                                      },
                                      child: Text("Yes")),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.teal),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No"))
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12))),
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          notemodel.title.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        // trailing: IconButton(
                                        //     onPressed: () {},
                                        //     icon: Icon(Icons.edit)),
                                        subtitle: Text(
                                          notemodel.description.toString(),
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddScrens();
          }));
        },
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
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

class widgetDrawer extends StatelessWidget {
  const widgetDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NewWidget();
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Center(
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            accountName: Text("Ali"),
            accountEmail: Text("Ali"),
            currentAccountPicture: CircleAvatar(),
          ),
        ),
        ListTile(
          title: Text("Category"),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LIstSCRENS();
                }));
              },
              icon: Icon(Icons.category_outlined)),
        ),
        ListTile(
          title: Text("edit"),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddScrens();
                }));
              },
              icon: Icon(Icons.edit)),
        ),
        ListTile(
          title: Text("share"),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        )
      ],
    );
  }
}
