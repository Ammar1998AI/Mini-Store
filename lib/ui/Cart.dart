
import 'package:ecommerce/bloc/CartBloc/bloc.dart';
import 'package:ecommerce/bloc/CartBloc/event.dart';
import 'package:ecommerce/bloc/CartBloc/state.dart';
import 'package:ecommerce/ui/Home.dart';
import 'package:ecommerce/ui/Search.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/controller/firebase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCart extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          builder: (context) => new CartBloc(),
          child: Cart(),
        )
    );
  }
}

class Cart extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<Cart> {

  var data_to_show = List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper.GetCurrentUser();
    BlocProvider.of<CartBloc>(context).add(InitCart());

  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return MaterialApp(
      home: Builder(
        builder: (context){
          return Material(
            child: Scaffold(
              bottomNavigationBar:new BottomAppBar(
                elevation: 0,
                shape: CircularNotchedRectangle(),
                child: Container(
                  height: 61,
                  child: new Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: <Widget>[
                          IconButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

                          }, icon: Icon(Icons.home_outlined)),
                          IconButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));

                          }, icon: Icon(Icons.search),),
                          Stack(
                            children: <Widget>[
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.shopping_cart_outlined,color: Color.fromRGBO(255,105,105,1.0),),),

                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Home',
                            style: TextStyle(fontSize: 10),),
                          Text('Search',
                            style: TextStyle(fontSize: 10),),
                          Text('Cart',
                            style: TextStyle(fontSize: 10,color: Color.fromRGBO(255,105,105,1.0)),),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
              appBar: AppBar(
                toolbarHeight: SizeConfig.blockSizeVertical *13,
                elevation: 0,
                backgroundColor: Color.fromRGBO(245, 246, 248, 1.0),
                actions: [
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4,right: SizeConfig.blockSizeHorizontal * 42),
                    child: Text('Cart', style: TextStyle(fontSize: 26,color: Color.fromRGBO(82, 90, 111, 1.0)),),
                  ),


                ],

              ),


              body: Container(
                height: SizeConfig.blockSizeVertical * double.infinity,
                width: SizeConfig.blockSizeHorizontal * double.infinity,

                color: Color.fromRGBO(245, 246, 248, 1.0),
                // ignore: missing_required_param

                child: BlocBuilder<CartBloc,CartState>(

                    builder: (context, state) {
                      helper.getdocuments();
                      print(state);
                      if(state is DataInitialState)
                      {
                        if(state.my_data.length==0)
                        {
                          return Center(
                               child: Text('You Do Not Puy Any Product Yet!',style: TextStyle(color: Color.fromRGBO(255,105,105,1.0)),),);
                        }
                        else{
                        for(int j= 0; j < state.my_data.length;j++){
                          data_to_show.add(
                              Item(state.my_data[j].title,state.my_data[j].imageUrl,state.my_data[j].price,state.my_data[j].Amount,j,context)
                          );
                          data_to_show.add(Divider(
                            height: 10,
                            thickness: 1,
                            indent: 160,
                            endIndent: 20,
                            color: Color.fromRGBO(232, 234 ,237, 1.0),
                          ));
                        }
                        return Products_Show(data_to_show,context,state.total);
                        }
                      }
                      else if(state is IncressState){
                        data_to_show = new List<Widget>();
                        for(int j= 0; j < state.my_data.length;j++){
                          data_to_show.add(
                              Item(state.my_data[j].title,state.my_data[j].imageUrl,state.my_data[j].price,state.my_data[j].Amount,j,context)
                          );
                          data_to_show.add(Divider(
                            height: 10,
                            thickness: 1,
                            indent: 160,
                            endIndent: 20,
                            color: Color.fromRGBO(232, 234 ,237, 1.0),
                          ));
                        }
                        return Products_Show(data_to_show,context,state.total);
                      }
                      else if(state is ReduceState){
                        data_to_show = new List<Widget>();

                        for(int j= 0; j < state.my_data.length;j++){
                          data_to_show.add(
                              Item(state.my_data[j].title,state.my_data[j].imageUrl,state.my_data[j].price,state.my_data[j].Amount,j,context)
                          );
                          data_to_show.add(Divider(
                            height: 10,
                            thickness: 1,
                            indent: 160,
                            endIndent: 20,
                            color: Color.fromRGBO(232, 234 ,237, 1.0),
                          ));
                        }
                        return Products_Show(data_to_show,context,state.total);
                      }
                    }
                  ),
                ),
              ),
            )
            ;
        }
      ),
    );

  }
}

