import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sarena/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:sarena/services/google_auth.dart';
import 'package:sarena/screens/acadHome.dart';

class Redirect extends StatefulWidget {
  const Redirect({Key? key}) : super(key: key);

  @override
  _RedirectState createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  double height = 230;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            height = 0;
                            runApp(MaterialApp(
                              home: login(),
                              debugShowCheckedModeBanner: false,
                            ));
                          });
                        },
                        child: Text(
                          "SIGN IN",
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        style: TextButton.styleFrom(primary: Colors.black),
                      ),
                      Text(
                        "/",
                        style: GoogleFonts.montserrat(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {
                          runApp(MaterialApp(
                            home: signup(),
                            debugShowCheckedModeBanner: false,
                          ));
                        },
                        child: Text(
                          "SIGN UP",
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        style: TextButton.styleFrom(primary: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  var user, pass;
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            runApp(MaterialApp(
                              home: login(),
                              debugShowCheckedModeBanner: false,
                            ));
                          });
                        },
                        child: Text(
                          "SIGN IN",
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        style: TextButton.styleFrom(primary: Colors.black),
                      ),
                      Text(
                        "/",
                        style: GoogleFonts.montserrat(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {
                          runApp(MaterialApp(
                            home: signup(),
                            debugShowCheckedModeBanner: false,
                          ));
                        },
                        child: Text(
                          "SIGN UP",
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        style: TextButton.styleFrom(primary: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Full Name"),
                          onSaved: (value) {
                            user = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Valid Username";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                          obscureText: true,
                          onSaved: (value) {
                            pass = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a valid password";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print("$user: $pass");
                      }
                    },
                    icon: Icon(Icons.mail),
                    label: Text("Sign In"),
                    style: ElevatedButton.styleFrom(primary: Color(0xff616161)),
                  ),
                  SizedBox(height: 30),
                  Text("------ OR ------"),
                  SizedBox(height: 30),
                  SignInButton(
                    Buttons.GoogleDark,
                    text: "Continue with Google",
                    onPressed: () async {
                      await signWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final Formkey = GlobalKey<FormState>();
  var name, email, pass, repass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/images/logo.png",
                        width: 120, height: 120),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              runApp(MaterialApp(
                                home: login(),
                                debugShowCheckedModeBanner: false,
                              ));
                            });
                          },
                          child: Text(
                            "SIGN IN",
                            style: GoogleFonts.montserrat(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          style: TextButton.styleFrom(primary: Colors.black),
                        ),
                        Text(
                          "/",
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            runApp(MaterialApp(
                              home: signup(),
                              debugShowCheckedModeBanner: false,
                            ));
                          },
                          child: Text(
                            "SIGN UP",
                            style: GoogleFonts.montserrat(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          style: TextButton.styleFrom(primary: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SignInButton(
                      Buttons.GoogleDark,
                      text: "Continue with Google",
                      onPressed: () async {
                        await signWithGoogle();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("------ OR ------"),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: Formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Full Name"),
                              onSaved: (value) {
                                name = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a valid name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Email"),
                              onSaved: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Create Password"),
                              onChanged: (value) {
                                pass = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a valid password";
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Re-enter Password"),
                              onSaved: (value) {
                                repass = value;
                              },
                              validator: (value) {
                                if (value != pass) {
                                  return "Password does not match";
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (Formkey.currentState!.validate()) {
                          Formkey.currentState!.save();
                          print("$name: $email: $pass: $repass");
                          runApp(MaterialApp(
                            home: studChoice(),
                            debugShowCheckedModeBanner: false,
                          ));
                        }
                      },
                      icon: Icon(Icons.mail),
                      label: Text("Sign Up"),
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xff616161)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class studChoice extends StatefulWidget {
  const studChoice({Key? key}) : super(key: key);

  @override
  _studChoiceState createState() => _studChoiceState();
}

class _studChoiceState extends State<studChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 150,
                // ),
                Text("One last thing...",
                    style: GoogleFonts.montserrat(
                        fontSize: 40, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 60,
                ),
                Text("You are here for...",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                    )),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: () {
                      runApp(MaterialApp(
                        home: acadhome(),
                        debugShowCheckedModeBanner: false,
                      ));
                    },
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          "Academics",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                          ),
                        ))),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(
                          "Development",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
