import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';



// String test = """{"data":[["THURSDAY","2023-11-16T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Vada pav","Green chutney","Sweet daliya","Watermelon","Tea + coffee","Milk","THURSDAY","LUNCH","Aloo chips","Jeera aloo ","Kadhi pakoda","Veg khichdi","Chapati","Plain rice","Sambar","Shkanji ","THURSDAY","DINNER","Green salad","Aloo gobhi ","Mix dal ","Chapati","Plain rice","Rasam","Suji pineapple halwa"],["FRIDAY","2023-11-17T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Aloo bhaji","Palak puri ","Cut onion lemon","Papaya","Tea + coffee","Milk","FRIDAY","LUNCH","Macroni salad","Soya handi ","Palak corn","Dal panchratan","Chapati","Plain rice","Sambar","Choco chip i/c","FRIDAY","DINNER","Green salad","Veg kohlapuri","Dhaba dal ","Chapati","Plain rice","Rasam","Fruit custard "],["SATURDAY","2023-11-18T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Seeviyaam upma","Adrak chutney","**********`","Honeydew","Tea + coffee","Milk","SATURDAY","LUNCH","Tomato chutney","Mix bhajia","Ragda mutter","Curd /butter","Mix veg paratha","Plain rice","Sambar","Litchi sherbet","SATURDAY","DINNER","Green salad","Dum aloo","Dal tadka","Chapati","Plain rice","Rasam","Hot badam milk "],["SUNDAY","2023-11-19T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Masala dosa","Sambhar","Coconut chutney","Apple","Tea + coffee","Milk","SUNDAY","LUNCH","Onion salad","Paneer lababdar","Dhaba chicken","Naan / chapati","Biryani rice","Boondi raita","SUNDAY","DINNER","Corn salad","Aloo palak","Aarhar dal tadka","Chapati","Plain rice","Rasam","Gulab jamuin"],["MONDAY","2023-11-20T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Poha","Sev","Cut onion lemon","Pineapple","Tea + coffee","Milk","MONDAY","LUNCH","Green salad","Tori masala","Rajma masala","Dal palak","Chapati","Plain rice","Sambar","MONDAY","DINNER","Green salad","Methi mutter malai ","Dal lahsuni","Chapati","Plain rice","Rasam","Veg manchow soup "],["TUESDAY","2023-11-21T00:00:00.000Z","BREAKFAST","No egg","Cornflakes","Bread + jam","Aloo paratrha","Curd","Pickle","Watermelon","Tea + coffee","Milk","TUESDAY","LUNCH","Bhel poori","Baingan bharta","Veg kofta curry ","Dal maharani ","Chapati","Plain rice","Sambar","Tang","TUESDAY","DINNER","Lemon + onion","Khatta meetha pumpkin","Chole masala","Bhatora/ chapati","Jeera rice","Mix veg raita","Coconut burfi "],["WEDNESDAY","2023-11-22T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Idli/ sautee idli ","Sambar","Coconut chutney","Banana","Tea + coffee","Milk","WEDNESDAY","LUNCH","Onion salad","Paneer korma","Chicken makhani ","Chapati","Pulao rice","Pineapple raita ","WEDNESDAY","DINNER","Aloo chana chaat","Mix tawa veg ","Dal panchratan","Chapati","Plain rice","Rasam","Lemon corriender soup "],["THURSDAY","2023-11-23T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Bread pakora","Green chutney","Sweet daliya","Papaya","Tea + coffee","Milk","THURSDAY","LUNCH","Roasted papad ","Pakoda kadhi","Achari aloo","Curd rice","Chapati","Plain rice","Sambar","Sweet lassi ","THURSDAY","DINNER","Mirch ke tapore/ lahsun chutney","Aloo rassa","Dal fry","Bati/ chapati","Plain rice","Rasam","Churma"],["FRIDAY","2023-11-24T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Suji upma","Adrak chutney","Pineapple","Tea + coffee","Milk","FRIDAY","LUNCH","Macroni salad","Gobhi mutter","Mix kathol ","Dal palak ","Chapati","Plain rice","Mix veg raita","FRIDAY","DINNER","Green salad","Veg in hot garlic sauce","Dal makhani","Egg fried rice / veg fried rice","Chapati","Rasam"],["SATURDAY","2023-11-25T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Masala s/w","Tomato ketchup","Sweet daliya","Apple","Tea + coffee","Milk","SATURDAY","LUNCH","Green chutney","Sabudana wada","Kala channa masala","Curd /butter","Aloo paratha","Plain rice","Sambar","SATURDAY","DINNER","Cut onion + lemon ","Pao","Bhaji","Dal tadka","Plain rice","Chapati limited","Seeviyaan kheer "],["SUNDAY","2023-11-26T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Methi paratha","Curd","Pickle","Hoenydew","Tea + coffee","Milk","SUNDAY","LUNCH","Onion salad","Paneer lahori","Butter chicken","Naan / chapati","Biryani rice","Boondi raita","SUNDAY","DINNER","Green salad","Aloo gobhi ","Mix dal ","Chapati","Plain rice","Pineapple raita ","Tomato soup"],["MONDAY","2023-11-27T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Poha","Sev","Cut onion lemon","Water melon","Tea + coffee","Milk","MONDAY","LUNCH","Green salad","Cabbage mutter","Rajma masala","Dal tadka ","Chapati","Plain rice","Sambar","Shikanji","MONDAY","DINNER","Hara bhara kabab","Sahi paneer","Dal makhani ","Tikona paratha","Kashmiri pulao","Burani raita","Aate ka halwa"],["TUESDAY","2023-11-28T00:00:00.000Z","BREAKFAST","No egg","Cornflakes","Bread + jam","Mutter ","Kulcha","Cut onion + lemon","Papaya","Tea + coffee","Milk","TUESDAY","LUNCH","Papadi chaat","Soya masala","Gatta curry ","Moong dal tadka","Chapati","Plain rice","Sambar","TUESDAY","DINNER","Lemon + onion","Khatta meetha pumpkin","Chole masala","Bhatora/ chapati","Jeera rice","Rasam","Veg soup "],["WEDNESDAY","2023-11-29T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Idli / sautee idli","Sambhar","Coconut chutney","Banana","Tea + coffee","Milk","WEDNESDAY","LUNCH","Onion salad","Palak paneer","Dal makhani ","Chapati","Veg pulao ","Mix veg raita","WEDNESDAY","DINNER","Bhel poori","Methi mutter malai","Dhaba dal ","Chapati","Plain rice","Rasam","Jalebi"],["THURSDAY","2023-11-30T00:00:00.000Z","BREAKFAST","Choice of egg","Cornflakes","Bread + jam","Missal","Pao","Onion + lemom","Hoenydew","Tea + coffee","Milk","THURSDAY","LUNCH","Fryms","Jeera aloo ","Kadhi pakoda","Veg khichdi","Chapati","Plain rice","Sambar","Tang","THURSDAY","DINNER","Green salad","Vada ","Sambhar","Masala dosa","Tamrind rice","Coconut chutney","Hot badam milk "]]}""";

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


  // if(!localMenu.containsKey(date))

    // {
    //   localMenu.put(date, test);
    //       // localMenu.put(date, test);
    //       // print(test);
    //       final menu = localMenu.get(date);
    //       localMenu.delete(prevdate);
    //       print(localMenu.keys);
    //       localMenu.close();
    //
    //       return decodeMenu(menu);
    //
    // }


    if(!localMenu.containsKey(date))
    {
    print("making call for menu");

    final response = await http.get(uri);
    print('called menu');



    print(response.body.toString());


    if (response.statusCode == 200) {

      localMenu.put(date, response.body);
      // localMenu.put(date, test);
      // print(test);
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
  print(rowwise);
  return rowwise;
}

Future<List<List<String>>> fetchRowwiseMenu() async {

  List<MenuModel> menu = await fetchMenu();






  return convertToRowwise(menu);
}
