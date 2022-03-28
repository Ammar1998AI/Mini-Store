import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable{

  int index;
  @override
  List<Object> get props => [index];

}

class InitCart extends CartEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class IncressCart extends CartEvent {
  int index;
  IncressCart(this.index);
  @override
  // TODO: implement props
  List<Object> get props => [index];

}

class ReduceCart extends CartEvent {
  int index;
  ReduceCart(this.index);
  @override
  // TODO: implement props
  List<Object> get props => [index];

}



