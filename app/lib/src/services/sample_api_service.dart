import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/paisos_model.dart';
import '../models/posts_model.dart';

class ApiDartGet {
/*
  Future<List<Articles>?> getTipoGet() async {
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
  }
*/
  //Future<String?> getDatosGet() async {
  Future<String?> getDatosGet() async {
    //String url = "https://jsonplaceholder.typicode.com/posts";

    final queryParameters = {
      'key': 'value',
    };
    var uri =
        Uri.https('jsonplaceholder.typicode.com', 'posts', queryParameters);

    //final response = await http.get(url);
    final response = await http.get(uri);
    //http.get(uri).then((response) {
    //if (response.body.isNotEmpty) {
    if (response.statusCode == 200) {
      var responseJson =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      //final responseJson = json.decode(response.body);
      Posts finPost = Posts.fromJson(responseJson);
      print('PASA 1');
      return finPost.title;
    }
    print('PASA 2');
    return null;
    //});
  }

  // CASO 3

  Paisos paisosModel = Paisos();

  void getCountries() {
    //var url = Uri.parse("https://restcountries.com/v2/name/peru");
    //var url = Uri.parse("https://restcountries.com/v2/all");
    var url = Uri.parse("https://restcountries.com/v2/all");
    //print(url);
    http.get(url).then((response) {
      print("ORIGEN");
      //print(response.body);
      final List<dynamic> bodyDecoded = convert.jsonDecode(response.body);

      print("REBENT");
      //print(bodyDecoded);
      final paises = bodyDecoded.map((element) {
        try {
          return Paisos.fromJson(element);
        } catch (e) {
          return Paisos();
        }
      });

      print("INSTANCIA");
      //print(paises);
      final List<Paisos> listPaises = paises.toList();

      print("TO LIST");
      //print(listPaises);

      for (var i = 0; i < listPaises.length; i++) {
        if (listPaises[i].name != null) {
          print(
              "Pais: ${listPaises[i].name} | Habitantes: ${listPaises[i].population}");
        }
      }
    }).catchError((err) {
      print(err);
    });
  }
}
