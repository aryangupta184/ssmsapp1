import 'dart:convert';
import 'package:http/http.dart' as http;

class MenuModel {
  String data;


  MenuModel({
    required this.data,
  });

  factory MenuModel.fromMap(Map<String, dynamic> json) {
    return MenuModel(
      data: json['data'],
    );
  }

}

List<MenuModel> decodeMenu(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<MenuModel>((json) => MenuModel.fromMap(json))
      .toList();
}

Future<List<MenuModel>> fetchMenu() async {
  final response = await http.get(
      'https://script.google.com/macros/s/AKfycbwW2I-GjaEfhQRN44UMyV5CEtKUzw6KGqd3TRfdZK-M1ZyadzNCcqN4ZgF2JuQjrlol_Q/exec' as Uri);
  if (response.statusCode == 200) {
    print(response.body);
    return decodeMenu(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}