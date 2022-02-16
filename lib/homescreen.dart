
import 'package:chaupai_sahib/aboutscreen.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  String data;
  double size=26;

  bool isTrans=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPdf();
  }

  _loadPdf() async {
    if(isTrans==false) {
      data = await rootBundle.loadString("assets/cs.txt");
    }else{
      data = await rootBundle.loadString("assets/csenglish.txt");
    }
    setState(() {
      _loading = false;
      print("f");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chaupai Sahib",style:MediaQuery.of(context).platformBrightness==Brightness.light?TextStyle(color: Colors.black87):TextStyle(),),

        actions: [
          PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.translate,color: Colors.orange,),
                        SizedBox(width: 5,),
                        isTrans?Text("Disable Translation"):Text("See Translation in English"),
                      ],
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.share,color: Colors.orange,),
                        SizedBox(width: 5,),
                        Text("Share app"),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.info,color: Colors.orange,),
                        SizedBox(width: 5,),
                        Text("About app")
                      ],
                    ),
                    value: 2,
                  )
                ];
              },
            onSelected: (n){
                switch(n){
                  case 0:setTrans();break;
                  case 1:shareApp();break;
                  case 2:aboutApp();break;
                }

            },
              )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: _loading ? Center(child: CircularProgressIndicator(),) : Text(data,style: TextStyle(fontSize: size),textAlign: TextAlign.center,)),
      ),
      floatingActionButton: _fab(),
    );
  }

  setTrans(){
    setState(() {
      if(isTrans){
        isTrans=false;
        size=26;
        _loadPdf();
      }else{
        isTrans=true;
        _loadPdf();
        size=22;
      }
    });
  }

  aboutApp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutScreen()));
  }

  shareApp(){
    Share.share("Chaupai Sahib App \n https://play.google.com/store/apps/details?id=com.jontybamrah.chaupai_sahib");
  }

  _zoomIn(){
    setState(() {
      size+=2;
    });
  }

  _zoomOut(){
    setState(() {
      size-=2;
    });
  }

  Widget _fab(){
    return FabCircularMenu(children: [
      IconButton(icon: Icon(Icons.zoom_in,color: Colors.black87,size: 34,), onPressed: ()=>{_zoomIn()}),
      IconButton(icon: Icon(Icons.zoom_out,color: Colors.black87,size: 34,), onPressed: ()=>{_zoomOut()}),
    ],
    fabColor: Colors.orange,
    fabOpenColor: Colors.orange,
    ringColor: Colors.orangeAccent,
    fabOpenIcon: Icon(Icons.zoom_in,color: Colors.black87,),
    animationDuration: Duration(milliseconds: 200),
      ringWidth: 100,
      ringDiameter: 350,

    );
  }
}
