// caso 1
import 'package:app/src/services/sample_api_service.dart';
// caso 2
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  int caso = 1;
  print('======================== MAIN IN ========================');
  if (caso == 1) {
    print('CASO 1 : https://jsonplaceholder.typicode.com/posts');

    /*ApiDartGet().getDatosGet().then((value) {
      print(value);
    });*/
    ApiDartGet().getDatosGet();
  } else if (caso == 2) {
    print(
        'CASO 2 : https://www.googleapis.com/books/v1/volumes?q=http | totalItems');

    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    // https://www.googleapis.com/books/v1/volumes?q=http
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } else if (caso == 3) {
    print('CASO 3 : https://restcountries.com/v2/all');

    ApiDartGet().getCountries();
  }
  print('======================== MAIN OUT ========================');
}
