import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'package:flutter/material.dart';
import 'package:wheelchair/model/form/form_model.dart';

class HiveProvider extends ChangeNotifier {

  static const hiveBoxName="formData";
  static init() async {
    Hive.initFlutter();
    Hive.registerAdapter(FormModelAdapter());
    Hive.registerAdapter(WheelChairQuestion1ModelAdapter());
  }

 Future<List<FormModel> > getAllItems() async {
    final box = await Hive.openBox<FormModel>(hiveBoxName);
    List<FormModel> list;
    list = box.values.toList();
    print(list.first.wheelChairQuestion1Model?.home);
    return list;
  }

  Future<void> insert(FormModel model) async {
    final box = await Hive.openBox<FormModel>(hiveBoxName);
    await box.delete(model.phnoNumber);
    await box.put(model.phnoNumber, model);
    print("Item added");
  }

}
