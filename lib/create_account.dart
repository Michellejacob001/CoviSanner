import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:covi_scanner/home.dart';
import 'package:covi_scanner/loginui.dart';
import 'home.dart';



class CreateAccount extends StatefulWidget {
  static const String id = 'CreateAccount';
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _auth = FirebaseAuth.instance; 
 
  User loggedInUser;
    String email;
  String password;


  @override
  void initState() {
    getCurrentUser();
     
    super.initState();
     
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
         
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: ListView(
         padding: EdgeInsets.symmetric(horizontal: 25.0),
        children: [
         
          SizedBox(
                height: 162.24,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                        color: Color.fromRGBO(0,0,0,100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 28.0),
                  ),
                ),
                SizedBox(
                  height: 14.39,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  
                  child: Text(
                    'Signing up or log in to see\nour top picks for you',
                    style: TextStyle(
                        color: Color.fromRGBO(0,0,0,100),
                        fontWeight: FontWeight.w300,
                        fontSize: 17.0),
                  ),
                ),
                SizedBox(
                  height: 44.76,
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
                        color: Color.fromRGBO(0,0,0,100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                  SizedBox(
                  height: 19,
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
                        color: Color.fromRGBO(0,0,0,100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
           SizedBox(
                  height: 19,
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
                        color: Color.fromRGBO(0,0,0,100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                 SizedBox(
                  height: 19,
                ),
                Container(
                  padding: EdgeInsets.only(right: 25),
                  height: 50,
                  width: 340,
                  color: Color.fromRGBO(91,155,165,100),
                  child: TextButton(
                    onPressed: () async {
                      print(email);
                      print(password);
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Center(
                      child: Text(
                        ' Get started',
                        style: TextStyle(
                          color: Color.fromRGBO(0,0,0,100),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(
                  height: 127,
                ),
                 Container(
                  height: 50,
                  width: 340,
                  color: Color.fromRGBO(255,127,80,50),
                  child: TextButton(
                    onPressed: () {
                      //Navigator.push(
                      //  context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: Center(
                      child: Text(
                        ' Continue with Google',
                        style: TextStyle(
                          color: Color.fromRGBO(0,0,0,100),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.39,
                ),
                
               
                              
                                                                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                       Text(
                      'Have an account',
                      style: TextStyle(
                          color: Color.fromRGBO(0,0,0,100),
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                            ),
                    
                       TextButton(
                                 onPressed: (){
                                   
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          
                          );
                        }
                            ,
                      
                          
                        child: Text(  'Log in',
                        style: TextStyle(
                          color: Color.fromRGBO(105, 121, 248, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro',
                        ),),
                    
                    ),
                    ],
                              
              
                                                                ),
      ],
                                                              
      ),
      
      ),

    );
  }
}
