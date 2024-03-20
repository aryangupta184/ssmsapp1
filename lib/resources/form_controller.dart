import 'dart:convert' as convert;
import 'package:ssmsapp1/models/form.dart';
import 'package:http/http.dart' as http;


class FormController {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  static const String URL = "https://script.google.com/macros/s/AKfycbyh2s_MFw6UPU2psafoyxAAYKcYdGgQbodB1EAXEKR9Y1i7pxb9p7bqpxtinIpSfaBpZA/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async{
    try{

      String send= URL+feedbackForm.toParams();
      print(send);
      Uri uri = Uri.parse(send);
      await http.get(uri).then(
              (response){
            callback(convert.jsonDecode(response.body)['status']);
          });
    } catch(e){
      print(e);
    }
  }
}