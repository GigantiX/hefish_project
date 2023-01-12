import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FishesPage extends StatefulWidget {
  const FishesPage({Key? key}) : super(key: key);

  @override
  State<FishesPage> createState() => _FishesPageState();
}

class _FishesPageState extends State<FishesPage> {

  clearToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Fishes Page"),
            leading: Container(
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                padding: EdgeInsets.all(8),
                focusColor: Colors.black,
                icon: Icon(Icons.arrow_back),
                iconSize: 14,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            backgroundColor: Color(0xff0EA7AE),
            elevation: 0.5,
            actions: [
              PopupMenuButton(
                icon: Icon(Icons.settings_rounded),
                color: Colors.white,
                itemBuilder: (context) => [
                  PopupMenuItem(
                      onTap: () => Future.delayed(
                          Duration(seconds: 0),
                              () =>AwesomeDialog(
                              context: context,
                              width: 300,
                              dialogType: DialogType.question,
                              title: 'Log out',
                              desc: 'Do you want to logout?',
                              btnOkText: 'Yes',
                              btnOkColor: Colors.green,
                              btnOkOnPress: () {
                                clearToken();
                                Navigator.pushNamedAndRemoveUntil(context,'/welcome',
                                        (Route<dynamic> route) => false
                                );
                              },
                              btnCancelText: 'No',
                              btnCancelColor: Colors.red,
                              btnCancelOnPress: (){}
                          ).show()
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Logout')
                        ],
                      )
                  )
                ],
              )
            ],
            bottom: const TabBar(isScrollable: true, tabs: [
              Tab(text: 'Fresh Water'),
              Tab(text: 'Salty Water'),
              Tab(text: 'Mixed Water'),
              Tab(text: 'Ornamental')
            ]),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.blue[200],
              ),
              Container(
                color: Colors.yellow[200],
              ),
              Container(
                color: Colors.green[200],
              ),
              Container(
                color: Colors.red[200],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert');
            },
            child: const Icon(Icons.add),
            backgroundColor: Color(0xff0EA7AE),
          ),
        ));
  }
}
