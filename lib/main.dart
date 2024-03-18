import 'package:flutter/material.dart';
import 'package:flutter_notesql/screns/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_notesql/screns/views/logon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  var email = sharedPreferences.getString("email");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? LoginPAge() : LIstSCRENS(),
  ));
}
