
import 'package:ecommerce/ui/Success.dart';
import 'package:ecommerce/utils/Data.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/controller/firebase.dart';



class Productpage extends StatelessWidget {

  Data data;
  Productpage([this.data]);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(

      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).orientation == Orientation.portrait ?
        SizeConfig.blockSizeVertical * 50:
        SizeConfig.blockSizeVertical * 57.7,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20,),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Container(

                        child: IconButton(icon: Icon(Icons.arrow_back_ios_outlined , color: Color.fromRGBO(255, 105, 105, 1.0),),
                          onPressed: () {
                            Navigator.pop(context);
                          },),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(data.title,style: TextStyle(color: Colors.black,fontSize: 11),
                                maxLines: 2, overflow: TextOverflow.ellipsis,
                                  ),
                              Row(
                                children: [
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),




                    ],
                  ),


                          SizedBox(height: SizeConfig.blockSizeVertical *4,),
                          MediaQuery.of(context).orientation == Orientation.portrait ?
                          Container(
                              width: SizeConfig.blockSizeHorizontal *70,
                              height: SizeConfig.blockSizeVertical *35,
                              child: FittedBox(child: Image.network(data.imageUrl),fit: BoxFit.fill,)):
                          Container(
                              width: SizeConfig.blockSizeHorizontal *32,
                              height: SizeConfig.blockSizeVertical *32,
                              child: FittedBox(child: Image.network(data.imageUrl),fit: BoxFit.fill,))
                ],
              ),

            ),
          ),
        ],

      ),


      body: Container(
        height: SizeConfig.blockSizeVertical * double.infinity,
        width: SizeConfig.blockSizeHorizontal * double.infinity,

        color: Colors.white,
        child: Stack(
          children: <Widget>[

            Container(
                color: Color.fromRGBO(245, 246, 248, 1.0),

                child:Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,

                      children: <Widget>[
                        Card(
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))),
                          child: FlatButton(

                            onPressed: () {  },
                            child: Text('Product',style: TextStyle(color: Color.fromRGBO(255,105,105,1.0)),),

                          ),
                        ),

                      ],
                    ),

                    Center(
                      child: FlatButton(onPressed: () {
                        print(data.Amount);
                      data.Amount = data.Amount+1;
                        print(data.Amount);
                        helper.add_product(data);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Success()));
                      },
                        child: Image.asset('images/addtocart.png'),

                      ),
                    )


                  ],
                )

            )



          ],
        ),
      ),
    );
  }

}

