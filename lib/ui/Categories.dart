

import 'package:delayed_display/delayed_display.dart';
import 'package:ecommerce/ui/Home.dart';
import 'package:ecommerce/ui/Search.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  TextEditingController textFieldController = TextEditingController();

  static const _alignments = [
    // Alignment.topLeft,
    Alignment.center,
    Alignment.centerLeft,
  ];

  var _index = 0;

  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  bool pressedApparel = false;
  bool pressedBeauty = false;
  bool pressedShoes = false;
  bool pressedElectronics = false;
  bool pressedFurniture = false ;
  bool pressedHome = false;




  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).orientation == Orientation.portrait ? SizeConfig.blockSizeVertical * 16 :SizeConfig.blockSizeVertical *25,
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
        actions: [
          Container(
            margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical* 8,right:SizeConfig.blockSizeHorizontal* 32),
            child: Text('All Categories', style: TextStyle(fontSize: 26,color: Color.fromRGBO(82, 90, 111, 1.0)),),
          ),

          Container(
            margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*4),
            child: Stack(
              children: [
                IconButton(icon: Icon(Icons.close,size: 30,color: Color.fromRGBO(255,105,105,1.0),),
                  onPressed: (){
                    Navigator.pop(context);


                  },

                ),

              ],

            ),
          ),

        ],

      ),


      body: Container(
          height: SizeConfig.blockSizeVertical * double.infinity,
          width: SizeConfig.blockSizeHorizontal * double.infinity,
          color: Color.fromRGBO(245, 246, 248, 1.0),

          child:
          MediaQuery.of(context).orientation == Orientation.portrait ?
          Row(

            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    AnimatedAlign(
                      alignment: _alignment,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeInOutBack,

                      child: Column(

                        children: [


                          Column(
                            children: <Widget>[

                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel =! pressedApparel;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = false;
//                                            sleep(Duration(seconds: 1));
                                          });
                                        },
                                          child: Image.asset('images/Apparel.png'),
                                        ),

                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 90,left: 50),
                                    child: Text('Apparel',
                                      style:pressedApparel ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0))
                                          :TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = ! pressedBeauty;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = false;
                                          });
                                        },
                                          child: Image.asset('images/Beauty.png'),
                                        ),

                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 90,left: 50),

                                    child: Text('Beauty',style:pressedBeauty ?
                                    TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):
                                    TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),
                                    ),
                                  ),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = ! pressedShoes;
                                          });
                                        },
                                          child: Image.asset('images/Shoes.png'),
                                        ),

                                      )),
                                  Container(margin: EdgeInsets.only(top: 90,left: 50),
                                      child: Text('Shoes',style:pressedShoes ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = !pressedElectronics;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = false;
                                          });
                                        },
                                          child: Image.asset('images/Electronics.png'),
                                        ),

                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 90,left: 50),
                                      child: Text('Electronics',style:pressedElectronics ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = !pressedFurniture;
                                            pressedHome = false;
                                            pressedShoes =  false;
                                          });
                                        },
                                          child: Image.asset('images/Furniture.png'),
                                        ),

                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 90,left: 50),

                                      child: Text('Furniture',style:pressedFurniture ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: [
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

//                            color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = !pressedHome;
                                            pressedShoes = false;
                                          });
                                        },
                                          child: Image.asset('images/Home.png'),
                                        ),

                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 90,left: 50),

                                      child: Text('Home',style:pressedHome ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),
                        ],
                      ),
                    )


                  ],
                ),
              ),

              if(pressedApparel == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
                              Text('MEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 85,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(
                                            onPressed: () {
                                          textFieldController.text = 'T-shirts';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController: textFieldController)));
                                          }
                                            , child: Text('T-shirts',style: TextStyle(color: Colors.black),)
                                        ),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                          textFieldController.text = 'Shirts';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                          },
                                            child: Text('Shirts',style: TextStyle(color: Colors.black),)
                                        ),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                            textFieldController.text = 'Pants & Jeans';
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Pants & Jeans',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'socks & Ties';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('socks & Ties',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Sweaters';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Sweaters',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Underwear';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Underwear',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                              onPressed: () {
                                              textFieldController.text = 'Jackets';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                              }
                                            , child: Text('Jackets',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                            textFieldController.text = 'Coats';
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            }
                                            , child: Text('Coats',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('WOMEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 85,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Officewear';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Officewear',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Blouse & T-shirts';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Blouse & T-shirts',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Pants & Jeans';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Pants & Jeans',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                          onPressed: () {
                                          textFieldController.text = 'Dresses';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                          },
                                             child: Text('Dresses',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Lingerie';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        },
                                            child: Text('Lingerie',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Jackets';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        },
                                            child: Text('Jackets',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Coats';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Coats',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Sweaters';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Sweaters',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
              if(pressedBeauty == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
//                            Text('MEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 85,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Eyebrow Pencils';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Eyebrow Pencils',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Face Powder';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Face Powder',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Highlight';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Highlight',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Lipgloss';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Lipgloss',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Mascara';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Mascara',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Nail polish';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Nail polish',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Makeup remover';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Makeup remover',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Contour Powder';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Contour Powder',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],

              if(pressedShoes == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
                              Text('MEN Shoes',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 85,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Golf shoes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Golf shoes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Hiking boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Hiking boots',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Running shoes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Running shoes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Soccer shoes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Soccer shoes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Ice-skates';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Ice-skates',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Combat boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Combat boots',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Cowboy boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Cowboy boots',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Desert boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Desert boots',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('WOMEN Shoes',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 85,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Lita';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Lita',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Cone heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Cone heels',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Stilettos';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Stilettos',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'High heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('High heels',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Platform heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Platform heels',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Mary janes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Mary Janes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Laced booties';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Laced booties',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Kitten heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Kitten heels',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
              if(pressedElectronics == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
//                            Text('MEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 85,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Mobile Devices';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Mobile Devices',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Wearables';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Wearables',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'TVs';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('TVs',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Laptops';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Laptops',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Printers';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Printers',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Scanners';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Scanners',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Monitors';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Monitors',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Tablets Computers';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Tablets Computers',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
              if(pressedFurniture == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 85,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Sofas';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Sofas',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Tables';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Tables',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Beds';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Beds',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Bookcases';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Bookcases',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Stools';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Stools',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Sideboards';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Sideboards',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Kids bedroom';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Kids bedroom',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Armchairs';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Armchairs',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
            ],
          ):
          Row(

            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[


                    AnimatedAlign(
                      alignment: _alignment,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeInOutBack,

                      child: Column(

                        children: [


                          Column(
                            children: <Widget>[

                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel =! pressedApparel;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = false;
//                                            sleep(Duration(seconds: 1));
                                          });
                                        },
                                          child: Image.asset('images/Apparel.png'),
                                        ),

                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 90,left: 50),
                                    child: Text('Apparel',
                                      style:pressedApparel ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0))
                                          :TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = ! pressedBeauty;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = false;
                                          });
                                        },
                                          child: Image.asset('images/Beauty.png'),
                                        ),

                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 90,left: 50),

                                    child: Text('Beauty',style:pressedBeauty ?
                                    TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):
                                    TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),
                                    ),
                                  ),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = ! pressedShoes;
                                          });
                                        },
                                          child: Image.asset('images/Shoes.png'),
                                        ),

                                      )),
                                  Container(margin: EdgeInsets.only(top: 90,left: 50),
                                      child: Text('Shoes',style:pressedShoes ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = !pressedElectronics;
                                            pressedFurniture = false;
                                            pressedHome = false;
                                            pressedShoes = false;
                                          });
                                        },
                                          child: Image.asset('images/Electronics.png'),
                                        ),

                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 90,left: 50),
                                      child: Text('Electronics',style:pressedElectronics ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = !pressedFurniture;
                                            pressedHome = false;
                                            pressedShoes =  false;
                                          });
                                        },
                                          child: Image.asset('images/Furniture.png'),
                                        ),

                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 90,left: 50),

                                      child: Text('Furniture',style:pressedFurniture ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Stack(
                                children: [
                                  Card(
                                      color: Color.fromRGBO(245, 246, 248, 1.0),
                                      elevation: 0,

//                            color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)),
                                      child: Container(
                                        width: 150,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                        ),
                                        child: FlatButton(onPressed: () {
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

                                            _index++;
                                            pressedApparel = false;
                                            pressedBeauty = false;
                                            pressedElectronics = false;
                                            pressedFurniture = false;
                                            pressedHome = !pressedHome;
                                            pressedShoes = false;
                                          });
                                        },
                                          child: Image.asset('images/Home.png'),
                                        ),

                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 90,left: 50),

                                      child: Text('Home',style:pressedHome ? TextStyle(color: Color.fromRGBO(255, 105, 105, 1.0)):TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),)),
                                ],
                              )

                            ],
                          ),
                        ],
                      ),
                    )


                  ],
                ),
              ),

              if(pressedApparel == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
                              Text('MEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 145,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'T-shirts';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController: textFieldController)));
                                        }
                                            , child: Text('T-shirts',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Shirts';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Shirts',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Pants & Jeans';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Pants & Jeans',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'socks & Ties';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('socks & Ties',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Sweaters';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Sweaters',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Underwear';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Underwear',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Jackets';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            }
                                            , child: Text('Jackets',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Coats';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            }
                                            , child: Text('Coats',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('WOMEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 145,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Officewear';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Officewear',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Blouse & T-shirts';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Blouse & T-shirts',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Pants & Jeans';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Pants & Jeans',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(
                                            onPressed: () {
                                              textFieldController.text = 'Dresses';
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                            },
                                            child: Text('Dresses',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Lingerie';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        },
                                            child: Text('Lingerie',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Jackets';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        },
                                            child: Text('Jackets',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Coats';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Coats',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Sweaters';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Sweaters',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
              if(pressedBeauty == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
//                            Text('MEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 145,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Eyebrow Pencils';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Eyebrow Pencils',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Face Powder';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Face Powder',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Highlight';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Highlight',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Lipgloss';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Lipgloss',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Mascara';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Mascara',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Nail polish';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Nail polish',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Makeup remover';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Makeup remover',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Contour Powder';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Contour Powder',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],

              if(pressedShoes == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
                              Text('MEN Shoes',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 145,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Golf shoes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Golf shoes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Hiking boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Hiking boots',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Running shoes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Running shoes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Soccer shoes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Soccer shoes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Ice-skates';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Ice-skates',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Combat boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Combat boots',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Cowboy boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Cowboy boots',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Desert boots';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Desert boots',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('WOMEN Shoes',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 145,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Lita';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Lita',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Cone heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Cone heels',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Stilettos';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Stilettos',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'High heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('High heels',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Platform heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Platform heels',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Mary janes';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Mary Janes',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Laced booties';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Laced booties',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Kitten heels';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Kitten heels',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
              if(pressedElectronics == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
//                            Text('MEN APPAREL',style: TextStyle(color: Color.fromRGBO(163, 169, 180, 1.0)),),
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 145,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Mobile Devices';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Mobile Devices',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Wearables';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Wearables',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'TVs';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('TVs',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Laptops';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Laptops',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Printers';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Printers',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Scanners';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Scanners',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Monitors';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Monitors',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Tablets Computers';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Tablets Computers',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
              if(pressedFurniture == true) ...[
                Expanded(
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right:16),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.blockSizeVertical * 145,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Sofas';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Sofas',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Tables';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Tables',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Beds';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Beds',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Bookcases';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Bookcases',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),FlatButton(onPressed: () {
                                          textFieldController.text = 'Stools';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Stools',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Sideboards';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Sideboards',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Kids bedroom';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Kids bedroom',style: TextStyle(color: Colors.black),)),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 40,
                                          endIndent: 20,
                                          color: Color.fromRGBO(232, 234 ,237, 1.0),
                                        ),
                                        FlatButton(onPressed: () {
                                          textFieldController.text = 'Armchairs';
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(textController:textFieldController)));
                                        }, child: Text('Armchairs',style: TextStyle(color: Colors.black),)),
                                      ],
                                    ),

                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                )
              ],
            ],
          )

      ),
    );
  }
}
