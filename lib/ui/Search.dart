
import 'package:ecommerce/ui/Home.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Search_results.dart';



class Search extends StatefulWidget {


  TextEditingController textController;

  Search({Key key ,this.textController,}):super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    bool ok = false;
    if(widget.textController == null){widget.textController = new TextEditingController();}

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
//
            Container(
              margin: EdgeInsets.only(right:
              MediaQuery.of(context).orientation == Orientation.portrait ?
              SizeConfig.blockSizeHorizontal*80:
              SizeConfig.blockSizeHorizontal*86
                  ,
                  top: 20),
              child: IconButton(icon:Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home()));
              }),
            )
        ],

      ),
      body: Container(
        height: SizeConfig.blockSizeVertical * double.infinity,
        width: SizeConfig.blockSizeHorizontal * double.infinity,

        color: Colors.white,
        child: MediaQuery.of(context).orientation == Orientation.portrait ?

        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                'Search',
                style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0),fontSize: 26),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Card(
                elevation: 0,
                color: Color.fromRGBO(241,242,243,1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: TextField(
                  onSubmitted: (value){
                    widget.textController.text = value;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Show(widget.textController)));
                  },
                  controller: widget.textController,
                  textInputAction: TextInputAction.search,

                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(hintText: 'Search SomeThing',
                    hintStyle: TextStyle(color: Color.fromRGBO(176,182,190,1.0),),
                    border: InputBorder.none,
                  ),
                  onChanged: (value){
//                    textController.text = value;
                  },


                ),
              ),
            ),
            SizedBox(height: 25,),
          ],
        ):
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                'Search',
                style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0),fontSize: 26),
              ),
            ),
//            SizedBox(
//              height: SizeConfig.blockSizeVertical*2,
//            ),
//            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Card(
                elevation: 0,
                color: Color.fromRGBO(241,242,243,1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: TextField(
                  onSubmitted: (value){
                    widget.textController.text = value;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Show(widget.textController)));
                  },
                  controller: widget.textController,
                  textInputAction: TextInputAction.search,

                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(hintText: 'Search SomeThing',
                    hintStyle: TextStyle(color: Color.fromRGBO(176,182,190,1.0),),
                    border: InputBorder.none,
                  ),
                  onChanged: (value){
//                    textController.text = value;
                  },


                ),
              ),
            ),
            SizedBox(height: 25,),
          ],
        )
      ),
    );
  }



}

