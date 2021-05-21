import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
 children: [
   Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
             SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Your Role',
                    style: TextStyle(
                        color: Color.fromRGBO(0,0,0,100),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 28.0),
                  ),
                ),
              TextButton(onPressed: 
              (){}, child: 
              Container(
                padding: EdgeInsets.only(right: 25),
                  height: 50,
                  width: 340,
                  color: Color.fromRGBO(91,155,165,100),
                child: Center(
                  child: Text(
                  'Customer',style: TextStyle(color: Color.fromRGBO(0,0,0,100),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,

                  ),
                  ),
                ),
                )
              
              ),
              SizedBox(
                height: 50,
              ),
               TextButton(onPressed: 
              (){}, child: 
              Container(
                padding: EdgeInsets.only(right: 25),
                  height: 50,
                  width: 340,
                  color: Color.fromRGBO(91,155,165,100),
                child: Center(
                  child: Text(
                  'Merchand',style: TextStyle(color: Color.fromRGBO(0,0,0,100),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,

                  ),
                  ),
                ),
                )
              
              ),
 ],
            ),
          ],
        )
        
       
      
      
      ),
    );
  }
}