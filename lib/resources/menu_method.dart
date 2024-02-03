import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

class MenuModel {
  List<String> items;

  MenuModel({required this.items});

  factory MenuModel.fromMap(Map<String, dynamic> json) {
    var itemsList = (json['data'] as List).cast<String>();
    return MenuModel(items: itemsList);
  }
}

List<MenuModel> decodeMenu(String responseBody) {
  final Map<String, dynamic> parsed = json.decode(responseBody);
  final List<dynamic> dataLists = parsed['data'];

  return dataLists.map<MenuModel>((json) => MenuModel.fromMap({'data': json})).toList();
}

Future<List<MenuModel>> fetchMenu() async {
  String url = 'https://script.google.com/macros/s/AKfycbwuakl_p421f_uvq6uABzx1Q51fspxa_FFw2yUripQGs24hP4nca2vmcca4jDSi-vAMLA/exec';
  Uri uri = Uri.parse(url);
  final localMenu = await Hive.openBox('local_menu');
  DateTime now = new DateTime.now();
  String date = new DateTime(now.year, now.month, now.day).toString();
  String prevdate = new DateTime(now.year, now.month, now.day-1).toString();


  if(!localMenu.containsKey(date))
  //   if(true)

    {

    final response = await http.get(uri);
    print('called');
    if (response.statusCode == 200) {

      localMenu.put(date, response.body);
      final menu = localMenu.get(date);
      localMenu.delete(prevdate);
      print(localMenu.keys);
      localMenu.close();

      return decodeMenu(menu);
    } else {
      throw Exception('Unable to fetch data from the REST API');
    }
  }
  else{
    print('saved call');
    final menu = localMenu.get(date);
    print(localMenu.keys);
    localMenu.close();
    return decodeMenu(menu);
  }



}

List<List<String>> convertToRowwise(List<MenuModel> menuModels) {
  List<List<String>> rowwise = [];

  for (var model in menuModels) {
    rowwise.add(model.items);
  }

  return rowwise;
}

Future<List<List<String>>> fetchRowwiseMenu() async {
  List<MenuModel> menu = await fetchMenu();




  return convertToRowwise(menu);
}
