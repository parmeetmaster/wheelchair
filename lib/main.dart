import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:wheelchair/presentation/screens/form/form_screen.dart';
import 'package:wheelchair/provider/hive_provider.dart';

import 'presentation/screens/login/login.dart';

void main() async {
 await HiveProvider.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HiveProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 847),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FormScreen(),
      ),
    );
  }
}
