import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';


String test = '''{
    "data": [
        [
            "THURSDAY",
            "2024-03-21",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Onion tomato utappam",
            "Sambhar",
            "Coconut chutney",
            "Pineapple",
            "Tea + coffee + bv",
            "Milk",
            "THURSDAY",
            "LUNCH",
            "Roasted papad",
            "Aloo do piyaza",
            "Kadhi pakoda",
            "Veg khichdi",
            "Chapati",
            "Plain rice",
            "Sambhar",
            "Cookies & cream ",
            "THURSDAY",
            "DINNER",
            "Green salad",
            "Veg korma",
            "Arhar dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam"
        ],
        [
            "FRIDAY",
            "2024-03-22",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Tikona paratha",
            "Aloo bhaji",
            "Lemon + onion",
            "Honey dew",
            "Tea + coffee + bv",
            "Milk",
            "FRIDAY",
            "LUNCH",
            "Mix salad",
            "Tinda masala",
            "Rajma masala",
            "Dal tadka",
            "Chapati",
            "Plain rice",
            "Sambhar",
            "Sweet lassi",
            "FRIDAY",
            "DINNER",
            "Corn salad",
            "Veg manchurian",
            "Moong dal tadka",
            "Egg fried rice / veg fried rice/",
            "Chapati",
            "Fruit custard"
        ],
        [
            "SATURDAY",
            "2024-03-23",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Suji upma",
            "Adrak chutney",
            "Tomato ketchup",
            "Papapya",
            "Tea + coffee + bv",
            "Milk",
            "SATURDAY",
            "LUNCH",
            "Veg bullet",
            "Tomato ketchup",
            "Ragda mutter",
            "Curd /butter",
            "Aloo gobhi paratha",
            "Plain rice",
            "Sambar",
            "Mint cooler",
            "SATURDAY",
            "DINNER",
            "Green salad",
            "Aloo mutter tamatar",
            "Black masoor tadka",
            "Chapati",
            "Plain rice"
        ],
        [
            "SUNDAY",
            "2024-03-24",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Masala dosa",
            "Sambhar",
            "Coconut chutney",
            "Papaya",
            "Tea + coffee + bv",
            "Milk",
            "SUNDAY",
            "LUNCH",
            "Onion salad",
            "Paneer lahori",
            "Butter chicken ",
            "Biryani rice",
            "Naan / chapati",
            "Boondi raita",
            "Choco chip i/c",
            "SUNDAY",
            "DINNER",
            "Green salad",
            "Methi mutter malai ",
            "Butter dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam"
        ],
        [
            "MONDAY",
            "2024-03-25",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Masala s/w",
            "Tomato ketchup",
            "Sweet daliya",
            "Grapes",
            "Tea + coffee + bv",
            "Milk",
            "MONDAY",
            "LUNCH",
            "MONDAY",
            "DINNER",
            "Happy holi",
            "Happy holi",
            "Happy holi",
            "Happy holi",
            "Happy holi",
            "Happy holi",
            "Happy holi"
        ],
        [
            "TUESDAY",
            "2024-03-26",
            "BREAKFAST",
            "Kala channa sprout",
            "Cornflakes",
            "Bread + jam",
            "Mix veg paratha",
            "Curd",
            "Pickel",
            "Banana",
            "Tea + coffee + bv",
            "Milk",
            "TUESDAY",
            "LUNCH",
            "Green salad",
            "Capsicum pitla",
            "Raw banana kofta curry",
            "Dhaba dal ",
            "Chapati",
            "Plain rice",
            "Sambar",
            "Shikanji",
            "TUESDAY",
            "DINNER",
            "Lemon + onion",
            "Jeera aloo ",
            "Chole masala",
            "Puri / chapati",
            "Plain rice",
            "Rasam",
            "Gulab jamun"
        ],
        [
            "WEDNESDAY",
            "2024-03-27",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Mysore bonda",
            "Adrak chutney",
            "Sweet daliya ",
            "Pineapple",
            "Tea + coffee + bv",
            "Milk",
            "WEDNESDAY",
            "LUNCH",
            "Onion salad",
            "Paneer lababdar",
            "Dal makhani",
            "Chapati",
            "Plain rice",
            "Pine apple raita",
            "Mint cooler",
            "WEDNESDAY",
            "DINNER",
            "Green salad",
            "Kadhai veg ",
            "Dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam"
        ],
        [
            "THURSDAY",
            "2024-03-28",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Poha",
            "Sev",
            "Lemon + onion",
            "Water melon",
            "Tea + coffee + bv",
            "Milk",
            "THURSDAY",
            "LUNCH",
            "Fryms",
            "Madrasi aloo ",
            "Onion kadhi",
            "Masala khinchadi",
            "Chapati",
            "Plain rice",
            "Sambhar",
            "Tutty fruity i/c",
            "THURSDAY",
            "DINNER",
            "Papdi chat",
            "Soya chaap masala",
            "Dal masala",
            "Chapati",
            "Onion rice",
            "Onion raita"
        ],
        [
            "FRIDAY",
            "2024-03-29",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Rawa idli",
            "Sambhar",
            "Coconut chutney",
            "Grapes",
            "Tea + coffee + bv",
            "Milk",
            "FRIDAY",
            "LUNCH",
            "Bhel puri",
            "Baingan bhartha",
            "Rajam masala",
            "Dal lahshuni",
            "Chapati",
            "Plain rice",
            "Sambar",
            "Masala chacch",
            "FRIDAY",
            "DINNER",
            "Green salad",
            "White sauce pasta",
            "Moong dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam"
        ],
        [
            "SATURDAY",
            "2024-03-30",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Seviya upma",
            "Adrak chutney",
            "Banana",
            "Tea + coffee + bv",
            "Milk",
            "SATURDAY",
            "LUNCH",
            "Green chutney",
            "Corn tikki",
            "Kala chana masala",
            "Curd /butter",
            "Mix veg paratha",
            "Plain rice",
            "Sambar",
            "Butter scotch i/c",
            "SATURDAY",
            "DINNER",
            "Green salad",
            "Veg diwani handi",
            "Dal maharani ",
            "Chapati",
            "Plain rice",
            "Rasam"
        ],
        [
            "SUNDAY",
            "2024-03-31",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Masala dosa",
            "Sambhar",
            "Coconut chutney",
            "Water melon",
            "Tea + coffee + bv",
            "Milk",
            "SUNDAY",
            "LUNCH",
            "Onion salad",
            "Paneer makhani ",
            "Chicken lahori",
            "Biryani rice",
            "Naan / chapati",
            "Boondi raita",
            "Rooh afza",
            "SUNDAY",
            "DINNER",
            "Green salad",
            "Aloo mutter rassa",
            "Dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam",
            "Coconut burfi"
        ],
        [
            "SUNDAY",
            "2024-03-31",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Masala dosa",
            "Sambhar",
            "Coconut chutney",
            "Water melon",
            "Tea + coffee + bv",
            "Milk",
            "SUNDAY",
            "LUNCH",
            "Onion salad",
            "Paneer makhani ",
            "Chicken lahori",
            "Biryani rice",
            "Naan / chapati",
            "Boondi raita",
            "Rooh afza",
            "SUNDAY",
            "DINNER",
            "Green salad",
            "Aloo mutter rassa",
            "Dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam",
            "Coconut burfi"
        ],
        [
            "SUNDAY",
            "2024-03-31",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Masala dosa",
            "Sambhar",
            "Coconut chutney",
            "Water melon",
            "Tea + coffee + bv",
            "Milk",
            "SUNDAY",
            "LUNCH",
            "Onion salad",
            "Paneer makhani ",
            "Chicken lahori",
            "Biryani rice",
            "Naan / chapati",
            "Boondi raita",
            "Rooh afza",
            "SUNDAY",
            "DINNER",
            "Green salad",
            "Aloo mutter rassa",
            "Dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam",
            "Coconut burfi"
        ],
        [
            "SUNDAY",
            "2024-03-31",
            "BREAKFAST",
            "Choice of egg",
            "Cornflakes",
            "Bread + jam",
            "Masala dosa",
            "Sambhar",
            "Coconut chutney",
            "Water melon",
            "Tea + coffee + bv",
            "Milk",
            "SUNDAY",
            "LUNCH",
            "Onion salad",
            "Paneer makhani ",
            "Chicken lahori",
            "Biryani rice",
            "Naan / chapati",
            "Boondi raita",
            "Rooh afza",
            "SUNDAY",
            "DINNER",
            "Green salad",
            "Aloo mutter rassa",
            "Dal tadka",
            "Chapati",
            "Plain rice",
            "Rasam",
            "Coconut burfi"
        ]
    ]
}''';

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


  var uri = Uri.parse('https://api.ssms-pilani.in/menu');

  final localMenu = await Hive.openBox('local_menu');


  DateTime now = new DateTime.now();
  String date = new DateTime(now.year, now.month, now.day).toString();
  String prevdate = new DateTime(now.year, now.month, now.day-1).toString();


  if(true)

    {
      localMenu.put(date, test);

      // localMenu.put(date, test);
          // print(test);
          final menu = localMenu.get(date);
          localMenu.delete(prevdate);

          localMenu.close();

      return decodeMenu(menu);
    }


  //   if(!localMenu.containsKey(date))
  //   {
  //   print("making call for menu");
  //
  //   final response = await http.get(uri);
  //   print('called menu');
  //
  //
  //
  //   print(response.body.toString());
  //
  //
  //   if (response.statusCode == 200) {
  //
  //     localMenu.put(date, response.body);
  //     // localMenu.put(date, test);
  //     // print(test);
  //     final menu = localMenu.get(date);
  //     localMenu.delete(prevdate);
  //     print(localMenu.keys);
  //     localMenu.close();
  //
  //     return decodeMenu(menu);
  //   } else {
  //     throw Exception('Unable to fetch data from the REST API');
  //   }
  // }
  else{
    print('saved call');
    final menu = localMenu.get(date);
    // print(test);
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
