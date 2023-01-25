import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  final List<String> items = [
    'Freshwater Fish',
    'Saltwater Fish',
    'Brackish Water Fish',
    'Fresh Water Fish',
    'Ornamental Fish',
    'Mixed Water Fish',
  ];
  String? selectedValue;
  int harga_ikan = 9000;
  final String jenis_Ikan = 'SeaWater Fish';
  final String nama_Ikan = 'ClownFish';
  clearToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  final String teks_Deskripsi = '''
  Common Name : Crowndfish
  Scientific Name : Amphiprioninae
  Diet : Carnivore
  Average Life Spend In The Wild : 6 to 10 years
  Size : 4.3 Inches
  Type Fish : SeaWater fish

    Clownfish has bright orange with three distinctive white bars, clown anemonefish are among the most recognizable of all reef-dwellers. They reach about 4.3 inches in length, and are named for the multicolored sea anemone in which they make their homes. There are at least 30 known species of clownfish, most of which live in the shallow waters of the Indian Ocean, the Red Sea, and the western Pacific. Clownfish perform an elaborate dance with an anemone before taking up residence, gently touching its tentacles with different parts of their bodies until they are acclimated to their host. They also have the ability to switch their sex type, but will do so only to become the dominant female of a group. The changing is irreversible.\n\n''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 4.0,
          shadowColor: Colors.black,
          // foregroundColor: colors.onSecondaryContainer,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          backgroundColor: Color.fromRGBO(14, 167, 174, 1),
          leading: Container(
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 255, 254, 254),
            ),
            child: IconButton(
              padding: EdgeInsets.all(8),
              focusColor: Color.fromARGB(255, 24, 23, 23),
              icon: const Icon(Icons.arrow_back),
              iconSize: 14,
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Back Button area Page',
            ),
          ),
          title: SizedBox(
            child: Text(
              'Fish Detail',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 242, 242),
                      letterSpacing: 0,
                      fontSize: 22,
                      height: 1.2)),
            ),
          ),
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
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.only(left: 15, top: 38, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: <Widget>[
                //Pitcure Area
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 200,
                      padding: EdgeInsets.all(3.0),
                      child: Image.network(
                        'https://assets.petpintar.com/files/article/534/1628037925-makanan-ikan-nemo-banner.jpg',
                        height: 230,
                        width: 350,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [BoxShadow(color: Colors.blueAccent)]),
                    ),
                  ],
                ),

                //Fish Name
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '${nama_Ikan}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 73, 68, 68),
                          letterSpacing: 0,
                          fontSize: 22,
                          height: 1.2),
                    ),
                  ),
                ),

                SizedBox(
                  height: 9,
                ),

                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 12, top: 20),
                      child: Text(
                        'Description',
                        style: GoogleFonts.notoSansThai(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color.fromARGB(255, 95, 93, 93),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 180, top: 24),
                      child: Text('Price: ',
                          style: GoogleFonts.notoSansThai(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 85, 80, 80),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 10,
                        top: 27,
                      ),
                      child: Text(
                        '${harga_ikan}',
                        style: GoogleFonts.notoSansThai(
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 75, 72, 72),
                        ),
                      ),
                    ),
                  ],
                ),
                //Fish Nama
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                  EdgeInsets.only(left: 7, right: 8, top: 12, bottom: 8),
                  child: Text(
                    '$teks_Deskripsi',
                    style: GoogleFonts.notoSansThai(
                        color: Color.fromARGB(255, 75, 72, 72),
                        fontSize: 8,
                        fontWeight: FontWeight.w300),
                  ),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromARGB(255, 231, 225, 225)),
                        color: Color.fromARGB(255, 86, 208, 214),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        focusColor: Color.fromARGB(255, 24, 23, 23),
                        icon: const Icon(Icons.delete,
                            color: Color.fromARGB(255, 48, 45, 45)),
                        iconSize: 17,
                        onPressed: () {},
                        tooltip: 'Delete $nama_Ikan Detail',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 252.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromARGB(255, 231, 225, 225)),
                        color: Color.fromARGB(255, 86, 208, 214),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        focusColor: Color.fromARGB(255, 24, 23, 23),
                        icon: const Icon(Icons.edit,
                            color: Color.fromARGB(255, 48, 45, 45)),
                        iconSize: 17,
                        onPressed: () {},
                        tooltip: 'Delete $nama_Ikan Detail',
                      ),
                    ),
                  ],
                ),
                //Descripsi Teks Fish
              ],
            ),
          ),
        ));
  }
}
