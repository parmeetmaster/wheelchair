import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheelchair/presentation/screens/form/form_screen.dart';

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
            accountName: Text("Wheel Chair App"),
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
             Navigator.push(context,MaterialPageRoute(builder: (ctx)=>FormScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new_outlined),
            title: Text("Log Out"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
      body: Obx(() => ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                ...controller.listOfMember.map((element) => Container(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name:"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Phone Number: ${element.phnoNumber ?? ""}"),
                                Text(element.diagnosis ?? "")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
              ])),
    );
  }
}
