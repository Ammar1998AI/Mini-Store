
import 'package:ecommerce/controller/firebase.dart';
import 'package:ecommerce/ui/Home.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';

class Sign_Up extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
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
  final fieldTextemail = TextEditingController();



  void clearText(TextEditingController text) {
    text.clear();
  }

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String username;

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
          MediaQuery.of(context).orientation == Orientation.landscape ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(

                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color.fromRGBO(81, 92, 111, 1.0), fontSize: 26),
                    )


              ),
              SizedBox(height: 6.0.h),
              Container(
                height: 39.9.h,
                width: 90.0.w,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: <Widget>[
                      Stack(

                        children: <Widget>[
                          Container(
                            child: Icon(Icons.email_outlined, size: 25, color: Color
                                .fromRGBO(131, 138, 154, 1.0),),
                            margin: EdgeInsets.only(left: 20, top: 25),),
                          Container(
                            margin: EdgeInsets.only(left: 70, top: 15),
                            child: Text(
                              "EMAIL",
                              style: TextStyle(
                                  color: Color.fromRGBO(131, 138, 154, 1.0)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextField(
                              controller: fieldTextemail,
                              onChanged: (value){
                                email = value;
                              },
                              style: TextStyle(
                                  color: Color.fromRGBO(81, 92, 111, 1.0)),
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(hintText: '',
                                  contentPadding: EdgeInsets.only(left: 70),
                                  border: InputBorder.none),

                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.person, size: 25, color: Color
                                .fromRGBO(131, 138, 154, 1.0),),
                            margin: EdgeInsets.only(left: 20, top: 25),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 70, top: 15),
                            child: Text(
                              "USERNAME",
                              style: TextStyle(
                                  color: Color.fromRGBO(131, 138, 154, 1.0)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextField(
                              controller: fieldTextusername,
                              onChanged: (value){
                                username = value;
                              },
                              style: TextStyle(
                                  color: Color.fromRGBO(81, 92, 111, 1.0)),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(hintText: '',
                                  contentPadding: EdgeInsets.only(left: 70),
                                  border: InputBorder.none),

                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.lock_outline, size: 25, color: Color
                                .fromRGBO(131, 138, 154, 1.0),),
                            margin: EdgeInsets.only(left: 20, top: 25),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 70, top: 15),
                            child: Text(
                              "PASSWORD",
                              style: TextStyle(
                                  color: Color.fromRGBO(131, 138, 154, 1.0)),
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
                              style: TextStyle(
                                  color: Color.fromRGBO(81, 92, 111, 1.0)),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(hintText: '',
                                  contentPadding: EdgeInsets.only(left: 70),
                                  border: InputBorder.none),

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
              SizedBox(height: 4.0.h,),
              FlatButton(onPressed: () async {
              setState(() {
                showSpinner = true;
              });
                try {
                  final newuser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if(newuser != null) {
                    clearText(fieldTextpassword);
                    clearText(fieldTextusername);
                    clearText(fieldTextemail);


                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                setState(() {
                  showSpinner = false;
                });
                }
                catch(e){
                  print(e);
                }
              },
              child: Image.asset('images/ctabutton.png')),
              SizedBox(height: 2.5.h,),
              Text(
                'By creating an account you agree to our',
                style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tems of Service',
                    style: TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)),

                  ),
                  Text(
                    ' and ',
                    style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),

                  ),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)),

                  ),

                ],
              ),

            ],
          ) :
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Center(

                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color.fromRGBO(81, 92, 111, 1.0), fontSize: 26),
                )


            ),
            SizedBox(height: 6.0.h),
            Container(
              height: 39.9.h,
              width: 150.0.w,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: <Widget>[
                    Stack(

                      children: <Widget>[
                        Container(
                          child: Icon(Icons.email_outlined, size: 25, color: Color
                              .fromRGBO(131, 138, 154, 1.0),),
                          margin: EdgeInsets.only(left: 20, top: 25),),
                        Container(
                          margin: EdgeInsets.only(left: 70, top: 15),
                          child: Text(
                            "EMAIL",
                            style: TextStyle(
                                color: Color.fromRGBO(131, 138, 154, 1.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: TextField(
                            controller: fieldTextemail,
                            onChanged: (value){
                              email = value;
                            },
                            style: TextStyle(
                                color: Color.fromRGBO(81, 92, 111, 1.0)),
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(hintText: '',
                                contentPadding: EdgeInsets.only(left: 70),
                                border: InputBorder.none),

                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.person, size: 25, color: Color
                              .fromRGBO(131, 138, 154, 1.0),),
                          margin: EdgeInsets.only(left: 20, top: 25),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 70, top: 15),
                          child: Text(
                            "USERNAME",
                            style: TextStyle(
                                color: Color.fromRGBO(131, 138, 154, 1.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: TextField(
                            controller: fieldTextusername,
                            onChanged: (value){
                              username = value;
                            },
                            style: TextStyle(
                                color: Color.fromRGBO(81, 92, 111, 1.0)),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: new InputDecoration(hintText: '',
                                contentPadding: EdgeInsets.only(left: 70),
                                border: InputBorder.none),

                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.lock_outline, size: 25, color: Color
                              .fromRGBO(131, 138, 154, 1.0),),
                          margin: EdgeInsets.only(left: 20, top: 25),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 70, top: 15),
                          child: Text(
                            "PASSWORD",
                            style: TextStyle(
                                color: Color.fromRGBO(131, 138, 154, 1.0)),
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
                            style: TextStyle(
                                color: Color.fromRGBO(81, 92, 111, 1.0)),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: new InputDecoration(hintText: '',
                                contentPadding: EdgeInsets.only(left: 70),
                                border: InputBorder.none),

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
                final newuser = helper.SignUp_User(email, password);
                if(newuser != null) {
                  clearText(fieldTextpassword);
                  clearText(fieldTextusername);
                  clearText(fieldTextemail);


                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                }
                setState(() {
                  showSpinner = false;
                });
              }
              catch(e){
                print(e);
              }
            },
                child: Image.asset('images/ctabutton.png')),
            SizedBox(height: 2.5.h,),
            Center(
              child: Text(
                'By creating an account you agree to our',
                style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tems of Service',
                  style: TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)),

                ),
                Text(
                  ' and ',
                  style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0)),

                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)),

                ),

              ],
            ),

          ],
        ),

        ),
    ),

  );
}
}