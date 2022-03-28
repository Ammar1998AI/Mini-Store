import 'package:ecommerce/bloc/CartBloc/bloc.dart';
import 'package:ecommerce/bloc/CartBloc/event.dart';
import 'package:ecommerce/ui/Productpage.dart';
import 'package:ecommerce/ui/Search.dart';
import 'package:ecommerce/utils/Data.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget Category(String image,String name,TextEditingController textFieldController,BuildContext context){
  return IconButton(
    iconSize: 60,
    onPressed: () {
      textFieldController.text = name;
      Navigator.push(context, MaterialPageRoute(builder: (context) => Search(textController:textFieldController)));
    },
    icon: Image.asset(image),
  );
}


Widget ProductImage(String imageUrl){
  return Container(
    width: SizeConfig.blockSizeHorizontal *60.0,
    child: Card(
      elevation: 0,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: <Widget>[
          Container(
            width: SizeConfig.blockSizeHorizontal *94,
            height: SizeConfig.blockSizeVertical *68,
            child: FittedBox(
              child: Image.network(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
//
        ],
      ),
    ),
  );
}

Widget BaseImage(String image){
  return Container(
      width: 350,
      child: Card(
        elevation: 0,
        color: Colors.black12,
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(20))),
        child: Container(
          width: 350,
          height: 300,
          child: FittedBox(
            child: Image.asset(image),
            fit: BoxFit.fill,
          ),
        ),

      )
  );
}

Widget buildResult2(List<Widget> items) {
  return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: items
  );
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}


Widget buildErrorUi(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}


Widget buildResult(List<Widget> items) {
  return ListView(
      physics: ScrollPhysics(),
      children: [
        GridView.count(
          controller: ScrollController(),
//                    primary: true,
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          childAspectRatio: (SizeConfig.blockSizeHorizontal / SizeConfig.blockSizeVertical),
          crossAxisCount: 2,
          children: items,
        )
      ]
  );
}

Widget Product(String name ,String imageUrl,String price,int amount,BuildContext context){

  return Container(
    padding: const EdgeInsets.all(8),
    color: Colors.white,
    child:FlatButton(
      onPressed: () {
        Data data = new Data(
          imageUrl: imageUrl,
          title: name,
          Amount: amount,
          price:price,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => Productpage(data)));
      },

      child: Column(
        children: <Widget>[
          Container(
              width: SizeConfig.blockSizeHorizontal*40,
              height: SizeConfig.blockSizeVertical*27,

              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    imageUrl
                ),
              )),
          SizedBox(height: 10,),
          Container(
//                                                margin: EdgeInsets.only(
//                                                    top: 130),
              child: Text(
                name, style: TextStyle(
                  fontSize: 9),)),
          Center(
            child:Text(
              price == null
                  ? "No Price"
                  : price, style: TextStyle(
                color: Colors.black),),

          ),

        ],
      ),

    ),
  );
}

Widget Products_Show(List<Widget> widgets,BuildContext context,double num){
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            child: Container(
                height: MediaQuery.of(context).orientation == Orientation.portrait ?
                SizeConfig.blockSizeVertical * 62.5:
                SizeConfig.blockSizeVertical * 50.0,

                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: widgets

                )

            ),
          ),
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).orientation == Orientation.portrait ?
            SizeConfig.blockSizeHorizontal*58:
            SizeConfig.blockSizeHorizontal*75
            ),
            child: Column(
              children: <Widget>[
                Text('TOTAL ',style: TextStyle(color: Color.fromRGBO(163,169,180,1.0))),
                Text('      '+'\$'+"${double.parse(num.toString()).toStringAsFixed(2)}",style: TextStyle(fontSize: 26,color: Color.fromRGBO(81,92,111,1.0)),),
              ],
            ),
          )
        ],
      )
  );
}


Widget Item(String name ,String imageUrl,String price,int amount,int index ,BuildContext context){
  return Container(
                                margin: EdgeInsets.only(top: 50,left: 20),
                                child: Row(
                                  children: <Widget>[
                                    Card(
                                        elevation: 0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(150)),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(imageUrl),
                                                fit: BoxFit.fill,

                                              )

                                          ),

                                        )

                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(name,style: TextStyle(fontSize: 10),maxLines: 2, // you can change it accordingly
                                            overflow: TextOverflow.ellipsis,),

                                          Text("\$"+price),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,

                                            children: <Widget>[
                                              FlatButton(
                                                onPressed: () {
                                                  if(amount>0){
                                                    BlocProvider.of<CartBloc>(context).add(ReduceCart(index));
                                                  }
                                                },
                                                child: Card(
                                                  elevation: 0,
                                                  color:Color.fromRGBO(114, 124, 142, 1.0),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(150)),
                                                  child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,),
                                                      child: Icon(Icons.remove,color: Colors.white,size: 14,)


                                                  ),
                                                ),),

                                              Text(amount.toString()),
                                              FlatButton(
                                                onPressed: (){
                                                  BlocProvider.of<CartBloc>(context).add(IncressCart(index));

                                                } ,
                                                child: Card(
                                                  elevation: 0,
                                                  color:Color.fromRGBO(114, 124, 142, 1.0),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(150)),
                                                  child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,),
                                                      child: Icon(Icons.add,color: Colors.white,size: 14,)
                                                  ),

                                                ),
                                              ),


                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              );
}