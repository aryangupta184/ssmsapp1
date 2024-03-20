import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

String test = """
{
  "grub_name": "Sample Restaurant",
  "logo_image_url": "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg",
  "menu": {
    "vegetarian": [
      "Vegetarian Pizza",
      "Vegetable Stir Fry",
      "Caprese Salad"
    ],
    "non_vegetarian": [
      "Pepperoni Pizza",
      "Chicken Alfredo Pasta",
      "Beef Burger"
    ]
  },
  "price": {
    "vegetarian_total_price": 26.97,
    "non_vegetarian_total_price": 34.97
  }
}
""";

class GrubModel {
  final String grubName;
  final String logoImageUrl;
  final Map<String, List<String>> menu;
  final Map<String, double> price;

  GrubModel({
    required this.grubName,
    required this.logoImageUrl,
    required this.menu,
    required this.price,
  });

  factory GrubModel.fromJson(Map<String, dynamic> json) {
    return GrubModel(
      grubName: json['grub_name'],
      logoImageUrl: json['logo_image_url'],
      menu: {
        'vegetarian': List<String>.from(json['menu']['vegetarian']),
        'non_vegetarian': List<String>.from(json['menu']['non_vegetarian']),
      },
      price: {
        'vegetarian_total_price': json['price']['vegetarian_total_price'],
        'non_vegetarian_total_price': json['price']['non_vegetarian_total_price'],
      },
    );
  }
}




Future<GrubModel> fetchGrub() async {
  String url = 'http://143.110.187.184/grub';
  Uri uri = Uri.parse(url);
  final upcomingGrub = await Hive.openBox('upcoming_grub');
  DateTime now = new DateTime.now();
  String date = new DateTime(now.year, now.month, now.day).toString();
  String prevdate = new DateTime(now.year, now.month, now.day - 1).toString();

  if (!upcomingGrub.containsKey(date))
    {
      upcomingGrub.put(date, test);
      final grub = upcomingGrub.get(date);
      upcomingGrub.delete(prevdate);
      print(upcomingGrub.keys);
      upcomingGrub.close();
      return decodeGrub(grub);

    }
   else {
    print('saved call grub');
    final grub = upcomingGrub.get(date);
    // print(test);
    upcomingGrub.close();
    return decodeGrub(grub);
  }


  //   if(true)

  // {
  //   final response = await http.get(uri);
  //   print('called');
  //   if (response.statusCode == 200) {
  //     upcomingGrub.put(date, response.body);
  //     // localMenu.put(date, test);
  //     // print(test);
  //     final grub = upcomingGrub.get(date);
  //     upcomingGrub.delete(prevdate);
  //     print(upcomingGrub.keys);
  //     upcomingGrub.close();
  //
  //     return decodeMenu(menu);
  //   } else {
  //     throw Exception('Unable to fetch data from the REST API');
  //   }
  // } else {
  //   print('saved call');
  //   final menu = upcomingGrub.get(date);
  //   // print(test);
  //   upcomingGrub.close();
  //   return decodeMenu(menu);
  // }
}

GrubModel decodeGrub(String jsonData) {
  // Parse JSON data into a Map
  Map<String, dynamic> jsonMap = json.decode(jsonData);

  // Extract data from the JSON map
  String grubName = jsonMap['grub_name'];
  String logoImageUrl = jsonMap['logo_image_url'];
  Map<String, List<String>> menu = {
    'vegetarian': List<String>.from(jsonMap['menu']['vegetarian']),
    'non_vegetarian': List<String>.from(jsonMap['menu']['non_vegetarian']),
  };
  Map<String, double> price = {
    'vegetarian_total_price': jsonMap['price']['vegetarian_total_price'].toDouble(),
    'non_vegetarian_total_price': jsonMap['price']['non_vegetarian_total_price'].toDouble(),
  };

  // Create a GrubModel object with the extracted data
  return GrubModel(
    grubName: grubName,
    logoImageUrl: logoImageUrl,
    menu: menu,
    price: price,
  );
}
