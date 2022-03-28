import 'package:ecommerce/resources/res/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_result_model.dart';

abstract class DataRepositry{
  Future<Structure> fetchData(String search_term);
}

class data_repositry implements DataRepositry{
  Future<Structure> fetchData(String search_term) async {
    final response = await http
        .get(Uri.parse(AppStrings.getApi(search_term)));

    if (response.statusCode == 200) {
      return Structure.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}