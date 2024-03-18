import 'package:hive/hive.dart';
part 'models.g.dart';

@HiveType(typeId: 0)
class Notemodel {
  @HiveField(0)
  List<Data>? data;
  @HiveField(1)
  Links? links;
  @HiveField(2)
  Meta? meta;

  Notemodel({this.data, this.links, this.meta});

  Notemodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  int? id;
  @HiveField(1)
  User? user;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? createdAt;

  Data({this.id, this.user, this.title, this.description, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    return data;
  }
}

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

@HiveType(typeId: 3)
class Links {
  @HiveField(0)
  String? first;
  @HiveField(1)
  String? last;
  @HiveField(2)
  dynamic prev;
  @HiveField(3)
  dynamic next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

@HiveType(typeId: 4)
class Meta {
  @HiveField(0)
  int? currentPage;
  @HiveField(1)
  int? from;
  @HiveField(2)
  int? lastPage;
  @HiveField(3)
  List<Links>? links;
  @HiveField(4)
  String? path;
  @HiveField(5)
  int? perPage;
  @HiveField(6)
  int? to;
  @HiveField(7)
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
