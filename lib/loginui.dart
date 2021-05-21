import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covi_scanner/home.dart';
import 'create_account.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  FirebaseAuth _firebaseAuth;
  dynamic _firestoreService;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            children: [
              SizedBox(
                height: 50.61,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 28.0),
                  ),
                ),
                SizedBox(
                  height: 14.39,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Signing up or log in to see\nour top picks for you',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 100),
                        fontWeight: FontWeight.w300,
                        fontSize: 17.0),
                  ),
                ),
                SizedBox(
                  height: 44.76,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1),
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                    hintText: "GuySimmmons@gmail.com",
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 100),
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1),
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                    hintText: "*********",
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
              
                Container(
                  padding: EdgeInsets.only(right: 25),
                  height: 50,
                  width: 340,
                  color: Color.fromRGBO(91, 155, 165, 100),
                  child: TextButton(
                    onPressed: ()   
                    
                  async {           
                      print(email);
                      print(password);

                      {
                        try {
                          UserCredential result =
                              await _firebaseAuth.signInWithEmailAndPassword(
                                  email: email, password: password);
                         // User user = result.user;
                          await _firestoreService
                              .getCurrentUserAndSaveItInAVariable();
                               if (result.user != null) {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                          );
                        }
                          //return user;
                        }  catch (e) {
                          print(e.toString());
                          if (e.code == "ERROR_WRONG_PASSWORD") {
                            return Future.error("Wrong Password");
                          } else if (e.code == "ERROR_USER_NOT_FOUND") {
                            return Future.error("Account does not exist");
                          } else
                            return null;
                        }
                      }
                      // try {
                      //   final UserCredential newUser =
                      //       await _auth.createUserWithEmailAndPassword(
                      //           email: email, password: password);
                       
                      // } catch (e) {
                      //   print(e);
                      // }
                    },
                    child: Center(
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 100),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE//
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color.fromRGBO(105, 121, 248, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Center(
                  child: Text(
                    'Or Login with',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 100),
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 41.0,
                ),
                Container(
                  height: 50,
                  width: 340,
                  color: Color.fromRGBO(255, 127, 80, 50),
                  child: TextButton(
                    onPressed: () {
                      //Navigator.push(
                      //context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: Center(
                      child: Text(
                        ' Continue with Google',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 100),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
      ),
    );
  }
}
