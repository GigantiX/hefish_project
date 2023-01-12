import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final List<String> items = [
    'Freshwater Fish',
    'Saltwater Fish',
    'Brackish Water Fish',
    'Fresh Water Fish',
    'Ornamental Fish',
    'Mixed Water Fish',
  ];
  String? selectedValue;

  final ScrollController _firstController = ScrollController();

  final TextEditingController textEditingController = TextEditingController();

  TextEditingController textarea = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  File? imageSelect;
  final _imagePicker = ImagePicker();

  ScrollController _scrollController = ScrollController();

  clearToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 4.0,
          shadowColor: Colors.black,
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
              'Edit Fish',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                      padding: EdgeInsets.all(5.0),
                      child: imageSelect == null
                          ? AspectRatio(
                              aspectRatio: 1.4,
                              child: Container(
                                color: Colors.grey[200],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.image, color: Colors.black54),
                                    Text(
                                      'Click for edit image',
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : AspectRatio(
                              aspectRatio: 1.4,
                              child: Image.file(File(imageSelect!.path),
                                  height: 220, width: 300, fit: BoxFit.cover)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [BoxShadow(color: Colors.blueAccent)]),
                    ),
                  ],
                ),
                //Baris Pilihan Data Area
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.add_a_photo, size: 13),
                      onPressed: () {
                        pickImageCamera();
                      },
                      label: Text(
                        'Pick Image Camera',
                        style: TextStyle(fontSize: 10),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    const SizedBox(
                      width: 115,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.browse_gallery, size: 14),
                      onPressed: () {
                        pickImageGallery();
                      },
                      label: Text(
                        'Pick Image Gallery',
                        style: TextStyle(fontSize: 10),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 7,
                ),
                //Fish Nama
                Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      // onChanged: (value) {
                      //   setState(() {});
                      // },
                      keyboardType: TextInputType.name,
                      // controller: _InsertfishDataTitleName,
                      style: const TextStyle(fontSize: 11),
                      decoration: InputDecoration(
                        labelText: 'Fish Name',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 143, 143, 148),
                          fontSize: 11,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.02, 0.02),
                              blurRadius: 0.5,
                              color: Color.fromARGB(255, 20, 19, 19),
                            ),
                          ],
                        ),
                        fillColor: Color.fromARGB(255, 231, 228, 228),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Arwarna Fish',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 147, 153, 150)),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 7,
                ),

                //Pilihan Scoll Tipe Nama Ikan
                Container(
                  padding: EdgeInsets.only(left: 6, right: 220),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 14,
                            color: Color.fromARGB(255, 255, 255, 146),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              'First Type',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 242, 240, 218),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                        DropdownButton;
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 12,
                      ),
                      iconSize: 15,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 30,
                      // buttonWidth: 0,
                      buttonPadding: const EdgeInsets.only(left: 2, right: 8),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: Color.fromARGB(66, 138, 131, 131),
                        ),
                        color: Color.fromARGB(255, 33, 156, 163),
                      ),
                      itemHeight: 25,
                      itemPadding: const EdgeInsets.only(left: 10, right: 15),
                      dropdownMaxHeight: 80,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0),
                        color: Color.fromARGB(255, 91, 146, 149),
                      ),
                      dropdownElevation: 3,
                      scrollbarRadius: const Radius.circular(8),
                      scrollbarThickness: 4,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, -2),
                    ),
                  ),
                ),

                SizedBox(
                  height: 7,
                ),
                //
                //Fish Price
                Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      // onChanged: (value) {
                      //   setState(() {});
                      // },
                      keyboardType: TextInputType.name,
                      // controller: _InsertfishDataTitleName,
                      style: const TextStyle(fontSize: 11),
                      decoration: InputDecoration(
                        labelText: 'Fish Price',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 143, 143, 148),
                          fontSize: 11,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.02, 0.02),
                              blurRadius: 0.5,
                              color: Color.fromARGB(255, 20, 19, 19),
                            ),
                          ],
                        ),
                        fillColor: Color.fromARGB(255, 231, 228, 228),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: '9000',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 147, 153, 150)),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                //
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 12),
                    // alignment: Alignment.center,
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(4.5),
                      child: TextField(
                        autocorrect: true,
                        autofocus: true,
                        minLines: 1,
                        maxLines: 12,
                        onChanged: (value) {
                          setState(() {});
                        },
                        scrollPadding: const EdgeInsets.all(20.0),
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(fontSize: 11),
                        showCursor: true,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 143, 143, 148),
                            fontSize: 11,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.02, 0.02),
                                blurRadius: 0.5,
                                color: Color.fromARGB(255, 20, 19, 19),
                              ),
                            ],
                          ),
                          fillColor: Color.fromARGB(255, 231, 228, 228),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText:
                              'Common Name : Clownfish\nScientific Name : Amphiprioninae\nDiet : Carnivore\nAverage Life Spend In The Wild : 6 to 10 years\nSize : 4.3 Inches\n\nThe body shape of clownfish is perch-like—oval and laterally compressed with an interrupted lateral line. Their body color is a bright orange with three white bars, the middle with a forward bulge centrally. Thick black bands around the white bars separate the orange and white portions of the body.\n',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 147, 153, 150)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Descripsi Teks Fish
                Container(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(14, 167, 174, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Save Changes',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(251, 251, 251, 1),
                                letterSpacing: 2,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                height: 0.8)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // pick photo from camera
  pickImageCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageSelect = File(image.path);
      });
    }
  }

  // pick photo from gallery
  pickImageGallery() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageSelect = File(image.path);
      });
    }
  }
}
