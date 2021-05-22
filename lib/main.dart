import 'package:covi_scanner/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'generate.dart';



void main() {
  runApp(MaterialApp(
      home: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.red,
      ),
      ),
  ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //Given Title
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //Given Theme Color
      theme: ThemeData(
        backgroundColor: Color(0xFF10202B),
      primarySwatch: Colors.blueGrey,
      ),
      //Declared first page of our app
      home: HomePage(),
    );
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          width: 500,
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                decoration: BoxDecoration(

                  border: Border.all(
                    width: 5,
                  ),
                ),
                child: Image.network("https://image.freepik.com/free-psd/hand-using-mobile-smart-phone-scan-qr-code_34168-2030.jpg"),
                height: 250,
              ),
              //Display Image
              // Image(
              //   image: NetworkImage("https://image.freepik.com/free-psd/hand-using-mobile-smart-phone-scan-qr-code_34168-2030.jpg"),
              //   height: 200,
              //
              // ),
              SizedBox(height: 40),
              //First Button

              FlatButton(

                color: Color(0xFF7D8A93),
                padding: EdgeInsets.all(15),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
                },
                child: Text("Scan QR Code",style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.indigo[900]),
                ),
              ),
              SizedBox(height: 30),

              //Second Button
              FlatButton(
                color: Color(0xFF7D8A93),
                padding: EdgeInsets.all(15),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                      GenerateQR()));
                },
                child: Text("Generate QR Code", style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.indigo[900]),
                ),
              ),
            ],
          ),
        )
    );
  }
}




