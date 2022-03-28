
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/bloc/CartBloc/event.dart';
import 'package:ecommerce/bloc/CartBloc/state.dart';
import 'package:ecommerce/utils/Data.dart';
import 'package:ecommerce/controller/firebase.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  List<Data> my_data ;
  double total = 0.0;
  CartBloc(){
    my_data = helper.GetData();
    for(int i = 0 ;i<my_data.length;i++){
      total += double.parse(my_data[i].price) * my_data[i].Amount;
    }
  }
  @override
  // TODO: implement initialState
  CartState get initialState => DataInitialState(my_data,total);


  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {

    if(event is InitCart){
      yield DataInitialState(my_data,total);
    }

    if (event is IncressCart) {

      my_data[event.index].setAmount(my_data[event.index].getAmount()+1) ;
      print(my_data[event.index].getAmount());
      
      Firestore.instance.collection('UsersProducts').document(my_data[event.index].documentId).updateData({'user':helper.loggedInUser.email,'data':[my_data[event.index].title,my_data[event.index].price,my_data[event.index].imageUrl,my_data[event.index].getAmount()]});

    total=total +double.parse(my_data[event.index].price);
  
     yield IncressState(my_data,total);
    }

    if(event is ReduceCart){
      my_data[event.index].setAmount(my_data[event.index].getAmount()-1) ;
    
      Firestore.instance.collection('UsersProducts').document(my_data[event.index].documentId).updateData({'user':helper.loggedInUser.email,'data':[my_data[event.index].title,my_data[event.index].price,my_data[event.index].imageUrl,my_data[event.index].getAmount()]});


    total= total-double.parse(my_data[event.index].price);

     yield ReduceState(my_data,total);

    }

  }


}

