import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hefish_project/detail_page.dart';
import 'package:hefish_project/fishes_page.dart';
import 'package:hefish_project/home_page.dart';
import 'package:hefish_project/insert_page.dart';
import 'package:hefish_project/login_page.dart';
import 'package:hefish_project/register_page.dart';
import 'package:hefish_project/welcome_page.dart';
import 'package:lottie/lottie.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff0EA7AE)
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/welcome' : (context) => const WelcomePage(),
        '/home' : (context) => const HomePage(),
        '/login' : (context) => const LoginPage(),
        '/register' : (context) => const RegisterPage(),
        '/fishes' : (context) => const FishesPage(),
        '/insert' : (context) => const InsertPage(),
        '/detail' : (context) => const DetailPage()
      },
      // home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Image.asset('assets/images/HeFishBlue.png',
                  width: 170,
                  height: 70,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('He Fish',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      height: 130,
                      width: 130,
                      child: LottieBuilder.asset('assets/images/WaterLoading.json'),
                    ),
                  )
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        nextScreen: WelcomePage(),
      splashIconSize: 450,
    );
  }
}



