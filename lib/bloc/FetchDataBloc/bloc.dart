
import 'package:bloc/bloc.dart';
import 'package:ecommerce/bloc/FetchDataBloc/event.dart';
import 'package:ecommerce/bloc/FetchDataBloc/state.dart';
import 'package:ecommerce/resources/operators/api_result_model.dart';
import 'package:ecommerce/resources/operators/data_repository.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  String search_term ;


  data_repositry repository;

  DataBloc({this.repository,this.search_term});

  @override
  // TODO: implement initialState
  DataState get initialState => DataInitialState();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is FetchDataEvent) {
      yield DataLoadingState();
      try {
        Structure data = await repository.fetchData(search_term);
        yield DataLoadedState(data);
      } catch (e) {
        yield DataErrorState(message: e.toString());
      }
    }

  }

  set set_term(String term){
    search_term = term;
  }

}

