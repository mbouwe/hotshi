import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi{
  final String _url ='http://testbackend.hogestion.com/api/fr/auth/';

  postData(data,apiUrl) async{
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl) ,
      body:jsonEncode(data),
      headers:_setHeaders()
    );

  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl),headers: _setHeaders());
  }

  _setHeaders()=>{
    'Content-Type':'application/json',
    'Accept':'application/json',
  };

}



class GlobalVariable{
  static int? activite = 0;
  static String? profession = '';
  static int? origine = 0;
  static int? residence = 0;
  static String? photo = '';
  static String? phone = '';
  static String? accounttype = '';


}