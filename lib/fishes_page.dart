import 'dart:convert';
// import 'dart:html';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hefish_project/model/data_fishes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FishesPage extends StatefulWidget {
  const FishesPage({Key? key}) : super(key: key);

  @override
  State<FishesPage> createState() => _FishesPageState();
}

class _FishesPageState extends State<FishesPage> {
  clearToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  List<Fishes> listfish = [];

  Future getFishes() async {
    final Uri url = Uri.parse('http://192.168.56.1:8080/api/read-fishes');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      List<Fishes> fishdata = it.map((e) => Fishes.fromJson(e)).toList();
      // final result =fishesFromJson(response.body);
      // fishes = (json.decode(response.body) as List)
      //     .map((data) => Fishes.fromJson(data))
      //     .toList();
      return fishdata;
    }
  }

  takeFish() async {
    listfish = await getFishes();
    setState(() {});
  }

  @override
  void initState() {
    takeFish();
    super.initState();
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
                          () => AwesomeDialog(
                                  context: context,
                                  width: 300,
                                  dialogType: DialogType.question,
                                  title: 'Log out',
                                  desc: 'Do you want to logout?',
                                  btnOkText: 'Yes',
                                  btnOkColor: Colors.green,
                                  btnOkOnPress: () {
                                    clearToken();
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/welcome',
                                        (Route<dynamic> route) => false);
                                  },
                                  btnCancelText: 'No',
                                  btnCancelColor: Colors.red,
                                  btnCancelOnPress: () {})
                              .show()),
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
                      ))
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
                color: Colors.grey[200],
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // final fishIndx = fishes[index];
                          return Container(
                            height: 110,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 7, 7, 7),
                              child: Row(
                                children: [
                                  Container(
                                    height: 87,
                                    width: 87,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Image.network(
                                      listfish[index].imagePath.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listfish[index].name.toString(),
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        listfish[index].description.toString(),
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        listfish[index].price.toString(),
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        color: Colors.transparent,
                                        child: ElevatedButton(
                                            onPressed: (){
                                              print(index);
                                            },
                                            child: Text(
                                                'Check',
                                              style: GoogleFonts.poppins(
                                                fontSize: 13
                                              ),
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: listfish.length),
                  ),
                ),
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
