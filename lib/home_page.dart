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

  @override
  void initState() {
    // TODO: implement initState
    gettoken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(myToken),
        ),
      ),
    );
  }

}
