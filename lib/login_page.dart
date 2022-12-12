import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool pass = true;
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30,10,30,10),
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
                      'Please sign in to continue,',
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
                  height: 340,
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,20,10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            widUsername(),
                            const SizedBox(
                              height: 10,
                            ),
                            widPass(),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 300,
                              height: 43,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                    Fluttertoast.showToast(
                                        msg: "Loading...",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.yellow,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                    print('$userC & $passC');
                                    Navigator.pushNamed(context, '/home');
                                  } else{
                                    Fluttertoast.showToast(
                                        msg: "Username/Password is wrong!",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.redAccent,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }
                                },
                                child: const Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Center(
                              child: const Text('or login with'),
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/google-icon.png'),
                              iconSize: 35,
                              onPressed: () {},
                            ),
                            Row(
                              children: [
                                Text('Dont have an account?'),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/register');
                                    },
                                    child: Text('Sign up here')
                                ),
                              ],
                            ),
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
          if (v == null || v.length < 4){
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
          errorStyle: TextStyle(
              color: Colors.transparent,
              fontSize: 0
          ),
          hintText: 'Username',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Container widPass(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        controller: passC,
        validator: (v) {
          if (v == null || v.length < 4){
            return 'please enter your password';
          }
          if (!RegExp(".*[0-9].*").hasMatch(v ?? '')){
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
        decoration: InputDecoration(
          isDense: true,
          errorMaxLines: 1,
          errorStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 0
          ),
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

}
