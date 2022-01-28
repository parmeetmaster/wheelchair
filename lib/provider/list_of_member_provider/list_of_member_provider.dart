import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wheelchair/model/form/form_model.dart';
import 'package:wheelchair/provider/hive_provider.dart';

class ListOfMemberController extends GetxController {

  RxList<FormModel> listOfMember = <FormModel>[].obs;


  @override
  void onInit() {
    getExistingData();
  }

  getExistingData() async{
    final HiveController hiveController = Get.find();
    List<FormModel> list =await hiveController.getAllItems();
    listOfMember.addAll(list);
  }
}
