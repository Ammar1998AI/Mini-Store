
import 'package:ecommerce/ui/Cart.dart';
import 'package:ecommerce/ui/Home.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(

      appBar: AppBar(
//        toolbarHeight: 350,
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 20,),
            child: FlatButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            },
                child: Image.asset('images/close.png')
            ),
          )
        ],

      ),


      body:
      Container(
        width: SizeConfig.blockSizeHorizontal * double.infinity,
        height: SizeConfig.blockSizeVertical * double.infinity,
        color: Color.fromRGBO(245, 246, 248, 1.0),
        child:
        Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *8),
            child:
            Column(
              children: <Widget>[
                Image.asset('images/icon.png'),
                SizedBox(height: SizeConfig.blockSizeVertical *6,),
                Text('Order Placed!',
                  style: TextStyle(fontSize: 26,color: Color.fromRGBO(82, 90, 111, 1.0)),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical *5,),

                Text('Your order was placed successfully'),
                SizedBox(height: 7,),

                Text('For more details,check All Orders.'),

                SizedBox(height: SizeConfig.blockSizeVertical *10,),

                FlatButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart()));
                },
                    child: Image.asset('images/bu.png'))
              ],
            )
        )
      )
    );
  }
}
