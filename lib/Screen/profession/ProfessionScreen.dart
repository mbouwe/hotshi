import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:hotshi/Screen/pays/PaysScreen.dart';

import '../../Api/Api.dart';
import '../../Widget/CustumAppBar.dart';
import '../../Widget/CustumAppBar1.dart';
import '../Secteuractivité/SecteurActivitéScreen.dart';





class ProfessionScreen extends StatefulWidget {
  const ProfessionScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionScreen> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {


  List items = [];
  Map<String, dynamic>? selectedValue;


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String apiUrl = 'http://testbackend.hogestion.com/api/fr/competences'; // Replace with your API URL

    try {
      http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {

        dynamic jsonData = json.decode(response.body);
        print(jsonData['data']);

        if (jsonData['data'] is List) {
          setState(() {
            items = jsonData['data'];
          });
        } else {
          print('Invalid JSON format: Expected a list');
        }
      } else {
        print('Request Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'Quel est votre Profession ?',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 18.0,
                color: Color(0xFF391C4A),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            width: 320,
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: DropdownButton<Map<String, dynamic>>(
                alignment: Alignment.center,
                hint: const Text('Sélectionnez une option'),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                items: items.map((item) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: item,
                    child: Text(item['name']),
                  );
                }).toList(),
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF391C4A),
                ),
                underline: Container(),
                // Supprime la bordure

              ),

            ),
          ),


          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF391C4A),
                      spreadRadius: 1,


                    )

                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),

                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ActiviteScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: const Icon(Icons.arrow_back, color: Color(0xFF391C4A)),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                height: 53.0,
                width: 53.0,
                child: ElevatedButton(
                  onPressed: () {
                    if(selectedValue!['id']!=""){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaysScreen()),
                      );
                      GlobalVariable.profession = selectedValue!['id'];
                    }else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(

                            content: const Text("Choisir une profession et recommencé" ),
                            actions: [
                              ElevatedButton(

                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF391C4A), // Couleur violette (Purple)
                                ),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: const Color(0xFF391C4A),
                  ),
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
