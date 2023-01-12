import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hefish_project/logic.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool pass = true;
  bool pas = true;
  final TextEditingController userC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController pasC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/hefishLogo.png',
                        height: 45,
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Hello,',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Please sign up to create account,',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  height: 390,
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            widUsername(),
                            const SizedBox(
                              height: 10,
                            ),
                            widEmail(),
                            const SizedBox(
                              height: 10,
                            ),
                            widPass(),
                            const SizedBox(
                              height: 10,
                            ),
                            widPas(),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 300,
                              height: 43,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    regtest(emailC.text, userC.text, pasC.text);
                                    Fluttertoast.showToast(
                                        msg: "Account registered & please login to continue",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.yellow,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    print('$emailC & $passC');
                                    Navigator.pushNamed(context, '/login');
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Username/Password is does not meet the requirements",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.redAccent,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: Text('Register'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 10,
                              ),
                            ),
                            Center(
                              child: Row(
                               children: [
                                 Text('Already have an account?'),
                                 TextButton(
                                     onPressed: (){
                                       Navigator.pushNamed(context, '/login');
                                     },
                                     child: Text('Login here')
                                 ),
                               ],
                              )
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // IconButton(
                            //   icon:
                            //       Image.asset('assets/images/google-icon.png'),
                            //   iconSize: 45,
                            //   onPressed: () {},
                            // )
                          ],
                        ),
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

  Container widUsername() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        controller: userC,
        validator: (v) {
          if (v == null || v.length < 4) {
            return 'Please enter your email';
          }
          return null;
        },
        // controller: emailC,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          isDense: true,
          errorMaxLines: 1,
          errorStyle: TextStyle(color: Colors.transparent, fontSize: 0),
          hintText: 'Username',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Container widEmail() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        controller: emailC,
        validator: (v) {
          if (v == null || v.length < 4) {
            return 'Please enter your email';
          }
          return null;
        },
        // controller: emailC,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          isDense: true,
          errorMaxLines: 1,
          errorStyle: TextStyle(color: Colors.transparent, fontSize: 0),
          hintText: 'Email',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Container widPass() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        controller: passC,
        validator: (v) {
          if (v == null || v.length < 4) {
            return 'please enter your password';
          }
          if (!RegExp(".*[0-9].*").hasMatch(v ?? '')) {
            return 'Input must contain numeric';
          }
          if (!RegExp('.*[a-z].*').hasMatch(v ?? '')) {
            return 'Input contain a lowercase';
          }
          if (!RegExp('.*[A-Z].*').hasMatch(v ?? '')) {
            return 'Input must contain uppercase';
          }
          return null;
        },
        obscureText: pass,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          isDense: true,
          errorMaxLines: 1,
          errorStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
          hintText: 'Password',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
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
              icon: const Icon(Icons.remove_red_eye)),
        ),
      ),
    );
  }

  Container widPas() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        controller: pasC,
        validator: (v) {
          if (v == null || v.length < 4) {
            return 'please enter your password';
          }
          if (v != passC.text) {
            return 'Password not match';
          }
          return null;
        },
        obscureText: pas,
        textInputAction: TextInputAction.none,
        decoration: InputDecoration(
          isDense: true,
          errorMaxLines: 1,
          errorStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
          hintText: 'Confirm Password',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (pas == true) {
                    pas = false;
                  } else {
                    pas = true;
                  }
                });
              },
              icon: const Icon(Icons.remove_red_eye)),
        ),
      ),
    );
  }
}
