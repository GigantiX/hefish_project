import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    const links = [
      "https://cff2.earth.com/uploads/2021/05/25053338/shutterstock_3433242232-960x640.jpg",
      "https://www.thesprucepets.com/thmb/P-oY8K4zPu_9OzKVsxfyXnS0tXI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1214858342-830a0f19ba764412a44e024b9877a5cf.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/9/9f/Queen_Angelfish.jpg"
    ];
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
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: links.map((url) {
                  return Image.network(url);
                }).toList(),
                options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16/9,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xff0EA7AE),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('What is He Fish?',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text('He Fish is a company engaged in the sale of'
                            ' different types of fish of different types of '
                            'water. We provide various information from various '
                            'types of fish to support the needs and provide'
                            ' convenience in learning various types of fish for'
                            ' users.',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        children: [
                          Container(
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
