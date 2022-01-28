import 'dart:io';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'package:flutter/material.dart';
import 'package:wheelchair/model/form/form_model.dart';

class HiveController extends GetxController {
  static const hiveBoxName = "formData";

  @override
  void onInit() async{
    super.onInit();
    Hive.initFlutter();
    Hive.registerAdapter(FormModelAdapter());
    Hive.registerAdapter(WheelChairQuestion1ModelAdapter());
    Hive.registerAdapter(WheelChairQuestion2ModelAdapter());
  }

  Future<List<FormModel>> getAllItems() async {
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
