import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter_notesql/screns/views/home.dart';

import 'package:http/http.dart' as http;
import 'package:gap/gap.dart';

class LoginPAge extends StatefulWidget {
  const LoginPAge({super.key});

  @override
  State<LoginPAge> createState() => _LoginPAgeState();
}

class _LoginPAgeState extends State<LoginPAge> {
  int feildFrom = 0;
  final emailcontoroller = TextEditingController();
  final passwordcontoroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30))),
              child: Image(
                image: AssetImage("assets/1.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.60,
              child: Column(
                children: [
                  Text(
                    "Singn in",
                    style: TextStyle(fontSize: 20),
                  ),
                  Gap(4),
                  Text("Access your Account"),
                  Gap(10),
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade400),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontoroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  Gap(20),
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade400),
                    child: TextFormField(
                      controller: passwordcontoroller,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  Gap(20),
                  Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal.shade300),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text("LOG IN"),
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LIstSCRENS();
                          }));
                          LoginData(
                              emailcontoroller.text, passwordcontoroller.text);
                        },
                      )),
                  Gap(10),
                  Text("forget password ?"),
                  Gap(10),
                  Image(image: AssetImage("assets/3.png")),
                  Gap(30),
                  Image(image: AssetImage("assets/2.png"))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer qc7lqGzpbvsc4kHNhJToiYOBpAx5TZBYd0eXZ3dEafebe27c'
  };

  Future LoginData(String email, String password) async {
    if (emailcontoroller.text.isNotEmpty &&
        passwordcontoroller.text.isNotEmpty) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(email, emailcontoroller.text);
      try {
        final responese = await http.post(
          Uri.parse(
              "https://holy-winter-ituzktstnb.ploi.online/api/v1/users/login"),
          body: {"email": email, "password": password},
        );
        // headers: headers);
        if (responese.statusCode == 200) {
          // ignore: unused_local_variable
          var data = jsonDecode(responese.body.toString());
          // print(data);
          // print(responese.body);
        }
      } catch (e) {
        e.toString();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("invalid emaial")));
    }
  }
}
