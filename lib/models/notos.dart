// // ignore_for_file: unused_local_variable

// class Notemodel {
//   String? id;
//   User? user;
//   String? title;
//   String? description;
//   String? createdAt;

//   Notemodel({this.id, this.user, this.title, this.description, this.createdAt});

//   Notemodel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     title = json['title'];
//     description = json['description'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? name;

//   User({this.id, this.name});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// // class Album {
// //   int? id;
// //   User? user;
// //   String? title;
// //   String? description;
// //   String? createdAt;
// //   const Album(
// //       {this.title, this.id, this.description, this.createdAt, this.user});

// //   factory Album.fromJson(Map<String, dynamic> json) {
// //     return switch (json) {
// //       {
// //         User: int? user,
// //         "createdAt":String createdAt,
// //         'id': int id,
// //         'title': String title,
// //         'description':String description,
// //       } =>
// //         Album(
         
// //           id: id,
// //           title: title,
// //           description: description

// //         ),
// //       _ => throw const FormatException('Failed to load album.'),
// //     };
// //   }
// // }
