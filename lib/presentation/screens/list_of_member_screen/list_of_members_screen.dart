import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wheelchair/presentation/screens/form/form_screen.dart';
import 'package:wheelchair/presentation/screens/login/login.dart';

import 'package:wheelchair/provider/list_of_member_provider/list_of_member_provider.dart';

class ListOfMemebers extends StatefulWidget {
  const ListOfMemebers({Key? key}) : super(key: key);

  @override
  _ListOfMemebersState createState() => _ListOfMemebersState();
}

class _ListOfMemebersState extends State<ListOfMemebers> {
  ListOfMemberController controller = Get.put(ListOfMemberController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Text(e.phnoNumber!)
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Members"),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Wheel Chair App",style: TextStyle(fontSize: 24.sp),),
            accountEmail: Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "w",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text("Add new Member"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => FormScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new_outlined),
            title: Text("Log Out"),
            onTap: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx)=>LoginScreen()));
            },
          ),
        ],
      )),
      body: Obx(() => controller.listOfMember.isNotEmpty
          ? ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                  ...controller.listOfMember.map((element) => Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => FormScreen(
                                          model: element,
                                        )));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Name:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          " ${element.clientName}",
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Phone Number :", style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                        Text(
                                          " ${element.phnoNumber}",
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Diagnosis :", style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                        Text(
                                          " ${element.diagnosis}",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                ])
          : Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("No Member curruntly in Database"),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => FormScreen())),
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add new Member",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
