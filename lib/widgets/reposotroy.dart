import 'dart:convert';

import 'package:flutter_notesql/models/calssmodel.dart';
import 'package:http/http.dart' as http;

class Repostory {
  final Url = "https://holy-winter-ituzktstnb.ploi.online/api/v1/note";
  var headers = {
    'Accept': 'application/json',
    // 'Content-Type': 'application/json',
    'Authorization': 'Bearer qc7lqGzpbvsc4kHNhJToiYOBpAx5TZBYd0eXZ3dEafebe27c'
  };

  static Notemodel notemodel = Notemodel();

  Future<Notemodel> getData() async {
    try {
      final response =
          await http.post(Uri.parse(Url + "/get"), headers: headers);
      if (response.statusCode == 200) {
        final jsonResponsive = jsonDecode(response.body);

        notemodel = Notemodel.fromJson(jsonResponsive);
        // print("${notemodel.data?.first.description.toString()}" + "no data");
        return notemodel;
      } else {
        throw Exception('Failed to load note');
      }
    } catch (e) {
      print(e.toString());
      e.toString();
    }
    return notemodel;
  }

//  post
  Future addData(String title, String description) async {
    final response = await http.post(Uri.parse(Url + "/store"),
        body: {'title': title, 'description': description}, headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to load Add');
    }
  }

  Future updatDAta(String? id, String? title, String? description) async {
    try {
      final http.Response response = await http.post(Uri.parse(Url + '/update'),
          body: {
            "id": id,
            "title": title,
            'description': description,
          },
          headers: headers);
      if (response.statusCode == 200) {
        await getData();

        // final jsonResponsive = jsonDecode(response.body);
        // notemodel = Notemodel.fromJson(jsonResponsive);
        return response.body;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String? id) async {
    try {
      final response = await http.post(Uri.parse(Url + "/delete"),
          body: {
            'id': id,
          },
          headers: headers);
      if (response.statusCode == 200) {
        final jsonResponsive = jsonDecode(response.body);
        notemodel = Notemodel.fromJson(jsonResponsive);
        print(response.body);
      }
      {
        throw Exception('Failed to delete Notemodel');
      }
    } catch (e) {
      e.toString();
    }
    // return notemodel;
  }
}
