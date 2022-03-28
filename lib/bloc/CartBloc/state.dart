import 'package:ecommerce/controller/firebase.dart';
import 'package:ecommerce/resources/operators/api_result_model.dart';
import 'package:ecommerce/utils/Data.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce/controller/firebase.dart';
import 'package:flutter/cupertino.dart';

abstract class CartState extends Equatable {

}

class DataInitialState extends CartState {
  List<Data>my_data ;
  double total ;
  DataInitialState(@required this.my_data,@required this.total);
  @override
  // TODO: implement props
  List<Object> get props => [my_data,total];
}



class IncressState extends CartState {
  double total ;
  List<Data> my_data;
  IncressState(@required this.my_data,@required this.total);
  @override
  // TODO: implement props
  List<Object> get props => [my_data,total];
}

class ReduceState extends CartState {
  double total ;
  List<Data> my_data;
  ReduceState(@required this.my_data,@required this.total);
  @override
  // TODO: implement props
  List<Object> get props => [my_data,total];

}



