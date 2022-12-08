import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hefish_project/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/WallFix.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Text('Welcome to',
                style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white
                ),
              ),
              Text('He Fish',
                style: GoogleFonts.merriweather(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Colors.white
                ),
              ),
              Text('find the right decorative fish here',
                style: GoogleFonts.merriweather(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/IllustFix.png'),
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 50,
                      width: 340,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text('Login',
                            style: GoogleFonts.poppins(
                              color: Colors.black
                            ),
                          ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 340,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Sign Up',
                          style: GoogleFonts.poppins(
                              color: Colors.black
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 340,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                'http://pngimg.com/uploads/google/google_PNG19635.png',
                                fit:BoxFit.cover
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Center(
                              child: Text('Continue with Google',
                                style: GoogleFonts.poppins(
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
