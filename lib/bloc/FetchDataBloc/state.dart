import 'package:ecommerce/resources/operators/api_result_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class DataState extends Equatable {

}

class DataInitialState extends DataState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DataLoadingState extends DataState {

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DataLoadedState extends DataState {

  Structure data;

  DataLoadedState(@required this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class DataErrorState extends DataState {

  String message;

  DataErrorState({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

