import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

class DatabaseManager {
  static const String noteappbox = 'Noteapp';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NotemodelAdapter());
    await Hive.openBox<Data>(noteappbox);
  }

  Future<void> insertTask(Data noteapps) async {
    try {
      var box = await Hive.openBox<Data>(noteappbox);

      var newNote = noteapps;
      final int id = await box.add(noteapps);

      newNote.id = id;
      //  newNote.save();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Data>> getAllTasks() async {
    var box = await Hive.openBox<Data>(noteappbox);
    return box.values.toList();
  }

  Future<void> updateTask(Data task) async {
    try {
      var box = await Hive.openBox<Data>(noteappbox);
      await box.put(task.id, task);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(int taskId) async {
    var box = await Hive.openBox<Data>(noteappbox);
    await box.delete(taskId);
  }

  Future<void> closeBox() async {
    await Hive.close();
  }
}
