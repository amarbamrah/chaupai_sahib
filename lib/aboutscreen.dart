import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AboutScreenState();
  }

}

class AboutScreenState extends State<AboutScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About App"),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/cslogo.png",width: 140,),
              Text("Chaupai Sahib",style: TextStyle(fontSize: 35),),
              Text("v0.1"),
              SizedBox(height: 60,),
              Text("Created By: Jonty Bamrah"),
              SizedBox(height: 5,),
              Text("Dedicated to my Mother")
            ],
          ),
        ),
      ),
    );
  }

}