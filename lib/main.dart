import 'package:flutter/material.dart';
import 'package:covi_scanner/create_account.dart';
import 'package:covi_scanner/loginui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

///void main() => runApp(new MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'LoginUI',
      theme: ThemeData(
        accentColor: Color(0xff6A9347),
       
      ),
     home: CreateAccount()
     //MyHomePage(), 
    );
  }
}

