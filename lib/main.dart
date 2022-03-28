
import 'package:ecommerce/ui/Home.dart';
import 'package:ecommerce/ui/Sign_Up.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/controller/firebase.dart';

void main() {
  runApp(MyApp()

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
//              useInheritedMediaQuery: true,
//              locale: DevicePreview.of(context).locale,
//              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              title: 'Sizer',
              theme: ThemeData.light(),
              home: MyHomePage(),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final fieldTextusername = TextEditingController();
  final fieldTextpassword = TextEditingController();


  void clearText(TextEditingController text) {
    text.clear();
  }

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password ;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),

    ),
    body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Container(
        height: double.infinity.h,
        width: double.infinity.w,

        color: Color.fromRGBO(245, 246, 248, 1.0),

          child:
          MediaQuery.of(context).orientation == Orientation.portrait ?
          Column(
            children: <Widget>[
              Center(
                   child: Text(
                      'Log In',
                      style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0),fontSize: 26),
                    )

              ),
              SizedBox(height: 4.0.h),

              Container(
                height: 27.2.h,
                width: 90.0.w,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.email_outlined,size: 25,color: Color.fromRGBO(131,138,154,1.0),),margin: EdgeInsets.only(left: 20,top: 25),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 70,top: 15),
                            child: Text(
                              "EMAIL",
                              style: TextStyle(color: Color.fromRGBO(131,138,154,1.0)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextField(

                              controller: fieldTextusername,
                              onChanged: (value){
                                email = value;
                              },
                              style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(hintText: '',contentPadding: EdgeInsets.only(left: 70),border: InputBorder.none),

                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.lock_outline,size: 25,color: Color.fromRGBO(131,138,154,1.0),),margin: EdgeInsets.only(left: 20,top: 25),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 70,top: 15),
                            child: Text(
                              "PASSWORD",
                              style: TextStyle(color: Color.fromRGBO(131,138,154,1.0)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextField(
                              controller: fieldTextpassword,
                              onChanged: (value){
                                password = value;
                              },
                              obscureText: true,
                              style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(hintText: '',contentPadding: EdgeInsets.only(left: 70),border: InputBorder.none),

                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),

                ),

              ) ,
              SizedBox(height: 3.0.h,),
              FlatButton(onPressed: () async {
              setState(() {
                showSpinner = true;
              });
                try {
                  final user = helper.login_user(email, password);
                  if (user != null){
                   clearText(fieldTextpassword);
                   clearText(fieldTextusername);

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  }
                setState(() {
                  showSpinner = false;
                });
                }
                catch(e){
                  setState(() {
                    showSpinner = false;
                  });
                  print(e);

                }

                    },
                  child: Image.asset('images/Button.png')),

              SizedBox(height: 4.0.h,),

              Text(
                'Dont have an account? Swipe right to ' ,
                style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
              ),
              FlatButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up()));
              },child:Text(
                'create a new account',
//
                style: TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)),
              )
              ),
            ],

          ):
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Center(

                        child:Text(
                          'Log In',
                          style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0),fontSize: 26),
                        )


                  ),
                  SizedBox(height: 4.0.h),

                  Container(
                  height: 27.2.h,
                  width: 150.0.w,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.email_outlined,size: 25,color: Color.fromRGBO(131,138,154,1.0),),margin: EdgeInsets.only(left: 20,top: 25),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70,top: 15),
                              child: Text(
                                "EMAIL",
                                style: TextStyle(color: Color.fromRGBO(131,138,154,1.0)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: TextField(

                                controller: fieldTextusername,
                                onChanged: (value){
                                  email = value;
                                },
                                style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
                                keyboardType: TextInputType.emailAddress,
                                decoration: new InputDecoration(hintText: '',contentPadding: EdgeInsets.only(left: 70),border: InputBorder.none),

                              ),
                            )
                          ],
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.lock_outline,size: 25,color: Color.fromRGBO(131,138,154,1.0),),margin: EdgeInsets.only(left: 20,top: 25),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70,top: 15),
                              child: Text(
                                "PASSWORD",
                                style: TextStyle(color: Color.fromRGBO(131,138,154,1.0)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: TextField(
                                controller: fieldTextpassword,
                                onChanged: (value){
                                  password = value;
                                },
                                obscureText: true,
                                style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: new InputDecoration(hintText: '',contentPadding: EdgeInsets.only(left: 70),border: InputBorder.none),

                              ),
                            )
                          ],
                        ),


                      ],
                    ),
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),

                  ),

                ),
                  SizedBox(height: 3.0.h,),
                  FlatButton(onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = helper.login_user(email,password);
                      if (user != null){
                   clearText(fieldTextpassword);
                   clearText(fieldTextusername);

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    }
                    catch(e){
                      setState(() {
                        showSpinner = false;
                      });
                      print(e);

                    }

                  },
                      child: Image.asset('images/Button.png')),

                  SizedBox(height: 4.0.h,),

                  Center(
                    child: Text(
                      'Dont have an account? Swipe right to ' ,
                      style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
                    ),
                  ),
                  FlatButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up()));
                  },child:Text(
                    'create a new account',
//
                    style: TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)),
                  )
                  ),
                ],
              )

        ),
    ),

  );
  }
}



