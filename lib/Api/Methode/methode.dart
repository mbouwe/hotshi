import 'dart:convert';
import 'package:hotshi/Api/Modele/modele.dart';
import 'package:http/http.dart' as http;


Future<void>registerUser(User user)async{
  const url = 'http://testbackend.hogestion.com/api/auth/register';
  final headers = {'Content-Type':'application/json'};
  final body = json.encode(user.toJson());
  final response = await http.post(Uri.parse(url),headers: headers,body: body);

  if(response.statusCode == 200){
    print('utilisateur inscrit avec succès');
  }else{
    throw Exception('inscription a échouée');
  }
}
