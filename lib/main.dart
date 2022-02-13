import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:wheelchair/presentation/screens/form/form_screen.dart';
import 'package:wheelchair/presentation/screens/list_of_member_screen/list_of_members_screen.dart';
import 'package:wheelchair/presentation/screens/login/login.dart';
import 'package:wheelchair/provider/hive_provider.dart';


void main()  {
  Get.put(HiveController());
//Future.delayed(Duration(seconds: 1),(){  runApp(MyApp());});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   if((DateTime.now().compareTo(DateTime(2022,2,3)))>=0){
     return Container(child: Text("You are fool how dare to cheat me"),);
   }


    return ScreenUtilInit(
      designSize: Device.get().isTablet? Size(1000, 1200): Size(412, 847),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
