import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myToken = '';
  gettoken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myToken = (prefs.getString('token')??'');
    });
  }

  clearToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    gettoken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0EA7AE),
        title: Text('He Fish'),
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
                    children: [
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
      ),
      body: Container(
        child: Center(
          child: Text(myToken),
        ),
      ),
    );
  }
}
