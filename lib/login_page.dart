import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool pass = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/hefishLogo.png',
                      height: 50,
                      width: 70,
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Text(
                      'Hello,',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Please sign in to continue,',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const TextField(
                              // controller: emailC,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextField(
                              obscureText: pass,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (pass == true) {
                                          pass = false;
                                        } else {
                                          pass = true;
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.remove_red_eye)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            height: 43,
                            child: ElevatedButton(
                              onPressed: () {

                                // Navigator.pushNamed(context, '/home');
                              },
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(7), // <-- Radius
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text('or login with'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IconButton(
                            icon: Image.asset('assets/images/google-icon.png'),
                            iconSize: 45,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
