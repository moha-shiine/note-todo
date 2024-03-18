import 'package:flutter/material.dart';
import 'package:flutter_notesql/screns/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_notesql/screns/views/logon.dart';

import 'db/localdb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final DatabaseManager locaDB = DatabaseManager();
  locaDB.init();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  var email = sharedPreferences.getString("email");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? LoginPAge() : LIstSCRENS(),
  ));
}
