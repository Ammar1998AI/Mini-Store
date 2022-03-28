
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/ui/Cart.dart';
import 'package:ecommerce/ui/Categories.dart';
import 'package:ecommerce/ui/Search.dart';
import 'package:ecommerce/utils/Data.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/controller/firebase.dart';


class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<Home> {

  var documentIDs = List<Map<String,dynamic>>();

  final _firestore = Firestore.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper.GetCurrentUser();
    helper.getdocuments();
  }

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    int counter = 0;

    bool pressedCart = false;
    return Scaffold(
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 61,
          child: new Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_outlined,
                        color: Color.fromRGBO(255, 105, 105, 1.0),
                      )),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {

                      pressedCart = !pressedCart;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyCart()));
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: pressedCart
                          ? Color.fromRGBO(255, 105, 105, 1.0)
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(255, 105, 105, 1.0)),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
        actions: [
        ],
      ),
      body: Container(
        height: SizeConfig.blockSizeVertical * double.infinity,
        width: SizeConfig.blockSizeHorizontal * double.infinity,

        color: Color.fromRGBO(245, 246, 248, 1.0),

        child: MediaQuery.of(context).orientation == Orientation.portrait ?
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: Color.fromRGBO(81, 92, 111, 1.0), fontSize: 26),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical *4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Category("images/Apparel.png","Apparel",textFieldController,context),
                Category("images/Beauty.png","Beauty",textFieldController,context),
                Category("images/Shoes.png","Shoes",textFieldController,context),

                IconButton(
                  iconSize: 60,

                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Categories()));
                    },
                    icon: Image.asset(
                      "images/seeall.png",
//
                    ),
                  ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Apparel',
                    style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
                Text('Beauty',
                    style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
                Text('Shoes',
                    style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
                Text('See All',
                    style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4.5,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text('Latest',
                      style: TextStyle(
                          color: Color.fromRGBO(81, 92, 111, 1.0),
                          fontSize: 26)),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
                Flexible(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('UsersProducts').snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data.documents.length >= 3) {
                          var data_to_show = List<Widget>();
                          for (int i = 0; i < snapshot.data.documents.length; i++) {
                            if (snapshot.data.documents[i].data['user'] == helper.loggedInUser.email) {
                              counter++;
                              documentIDs.add(snapshot.data.documents[i].data);
                            }
                          }
                          if(counter>=3){
                            for(int i = documentIDs.length-3 ;i<documentIDs.length;i++){
                              if (documentIDs[i]['data'] != null &&
                                  documentIDs[i]['user'] != null &&
                                  documentIDs[i]['user'] == helper.loggedInUser.email) {
                                Data data = new Data();
                                data.title = documentIDs[i]['data'][0];
                                data.price = documentIDs[i]['data'][1];
                                data.imageUrl = documentIDs[i]['data'][2];
                                data.Amount = documentIDs[i]['data'][3];
                                data.documentId = "";

                                data_to_show.add(
                                  ProductImage(documentIDs[i]['data'][2],)
                                 );
                                data_to_show.add(SizedBox(
                                  height: SizeConfig.blockSizeVertical *3.0,
                                ));
                              }
                            }
                          }
                          else{
                            data_to_show.add(
                              BaseImage('images/Banner1.png')
                            );
                            data_to_show.add(
                              BaseImage('images/Banner2.png'),
                            );
                          }
                          return Container(
                            margin: EdgeInsets.only(left: 30),
                            padding: EdgeInsets.only(right: 15),
                            height: SizeConfig.blockSizeVertical *89.0,
                            child: ListView(

                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: data_to_show

                                ),
                          );
                        }

                      }),
                )

          ],
        ):
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        color: Color.fromRGBO(81, 92, 111, 1.0), fontSize: 26),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical *4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Category("images/Apparel.png","Apparel",textFieldController,context),
                    Category("images/Beauty.png","Beauty",textFieldController,context),
                    Category("images/Shoes.png","Shoes",textFieldController,context),
                    IconButton(
                      iconSize: 60,

                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Categories()));
                      },
                      icon: Image.asset(
                        "images/seeall.png",
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Apparel',
                        style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
                    Text('Beauty',
                        style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
                    Text('Shoes',
                        style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
                    Text('See All',
                        style: TextStyle(color: Color.fromRGBO(81, 92, 111, 1.0))),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 4.5,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text('Latest',
                          style: TextStyle(
                              color: Color.fromRGBO(81, 92, 111, 1.0),
                              fontSize: 26)),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                  StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('UsersProducts').snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data.documents.length >= 3) {
                          var data_to_show = List<Widget>();
                          for (int i = 0; i < snapshot.data.documents.length; i++) {
                            if (snapshot.data.documents[i].data['user'] == helper.loggedInUser.email) {
                              counter++;
                              documentIDs.add(snapshot.data.documents[i].data);
                            }
                          }
                          if(counter>=3){
                            for(int i = documentIDs.length-3 ;i<documentIDs.length;i++){
                              if (documentIDs[i]['data'] != null &&
                                  documentIDs[i]['user'] != null &&
                                  documentIDs[i]['user'] == helper.loggedInUser.email) {
                                Data data = new Data();
                                data.title = documentIDs[i]['data'][0];
                                data.price = documentIDs[i]['data'][1];
                                data.imageUrl = documentIDs[i]['data'][2];
                                data.Amount = documentIDs[i]['data'][3];
                                data.documentId = "";

                                data_to_show.add(
                                    ProductImage(documentIDs[i]['data'][2],));
                                data_to_show.add(SizedBox(
                                  height: SizeConfig.blockSizeVertical *3.0,
                                ));
                              }
                            }
                          }
                          else{
                            data_to_show.add(
                                BaseImage('images/Banner1.png')
                            );
                            data_to_show.add(
                              BaseImage('images/Banner2.png'),
                            );
                          }
                          return Column(

                                children: data_to_show
                          );
                        }

                      }),
              ],
            )
      ),
    );
  }
}
