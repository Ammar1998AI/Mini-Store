import 'package:ecommerce/bloc/FetchDataBloc/bloc.dart';
import 'package:ecommerce/bloc/FetchDataBloc/event.dart';
import 'package:ecommerce/bloc/FetchDataBloc/state.dart';
import 'package:ecommerce/resources/operators/data_repository.dart';
import 'package:ecommerce/ui/Search.dart';
import 'package:ecommerce/utils/Data.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Show extends StatelessWidget {


  final TextEditingController term ;
  const Show([this.term]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          builder: (context) => DataBloc(repository: data_repositry()),
//          create: (context) => DataBloc(repository: data_repositry()),
          child: Search_results(term),
        )
    );
  }
}


class Search_results extends StatefulWidget {

  final TextEditingController search_term;

  const Search_results([this.search_term]);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Search_results> {

  DataBloc databloc;

  int num, i =0;

//
  var items = List<Widget>();
  var data_to_view = new List<Data>();

  @override
  void initState() {
    super.initState();
    databloc = BlocProvider.of<DataBloc>(context);
    databloc.set_term = widget.search_term.text;
    databloc.add(FetchDataEvent());
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: Builder(
        builder: (context){
          return Material(
            child: Scaffold(

              appBar: AppBar(
                toolbarHeight: 120,
                elevation: 0,
                backgroundColor: Colors.white,
                actions: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Search()));
                        },
                            icon: Icon(Icons.arrow_back_ios_outlined,
                              color: Color.fromRGBO(255, 105, 105, 1.0),)),
                        SizedBox(width: SizeConfig.blockSizeHorizontal*10,),
                        Container(

                          margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*20),
                          width: SizeConfig.blockSizeHorizontal*55,
                          child: Card(
                            elevation: 0,
                            color: Color.fromRGBO(241, 242, 243, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))),
                            child: TextField(
                                controller: widget.search_term,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),


              body: Container(
                  height: SizeConfig.blockSizeVertical * double.infinity,
                  width: SizeConfig.blockSizeHorizontal * double.infinity,

                  color: Colors.white,
                  child: BlocListener<DataBloc, DataState>(
                      listener: (context, state) {
                        if (state is DataErrorState) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<DataBloc, DataState>(
                          builder: (context, state) {
                            if (state is DataInitialState) {
                              return buildLoading();
                            } else if (state is DataLoadingState) {
                              return buildLoading();
                            } else if (state is DataErrorState) {
                              return buildErrorUi(state.message);
                            }
                            else if (state is DataLoadedState) {
                              while(i <45) {
                                if (state.data.searchResults[i].price ==null) {i++;}
                                else {
                                  items.add(
                                    Product(state.data.searchResults[i].title,state.data.searchResults[i].image,state.data.searchResults[i].price.raw,0,context)
                                  );
                                  i++;
                                }
                              }
                              return buildResult2(items);
                            }
                          }
                      )
                  )
              ),
            )
            ,
          );
        },
      ),
    );

  }


}


