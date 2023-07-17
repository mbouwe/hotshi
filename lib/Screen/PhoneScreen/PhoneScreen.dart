import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotshi/Api/Api.dart';
import 'package:hotshi/Screen/PhotoProfil/PhotoProfil.dart';
import 'package:hotshi/Screen/suggestioncontact/SuggestionContact.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;


import '../../Widget/CustumAppBar.dart';




class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController controller = TextEditingController();
  bool _isloading = false;
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                'votre Numéro de téléphone',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 20.0,

                  ),
                ),
                textAlign: TextAlign.center,
            ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black.withOpacity(0.13)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.purple,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          setState(() {
                            phoneNumber = number.phoneNumber!;
                          });
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        textFieldController: controller,
                        formatInput: false,
                        maxLength: 9,
                        keyboardType:
                        const TextInputType.numberWithOptions(signed: true, decimal: true),
                        cursorColor: Colors.black,
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          fillColor: Colors.purple,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                        ),
                        onSaved: (PhoneNumber number) {

                          print('On Saved: $number');

                        },
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        bottom: 8,
                        child: Container(
                          height: 40,
                          width: 1,
                          color: Colors.black.withOpacity(0.13),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
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
                          MaterialPageRoute(builder: (context) => ProfilePictureScreen()),
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
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.purple,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if(phoneNumber!=''){
                       //   _onbaording();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SuggestionContact()),
                          );

                        }else{
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(

                                content: const Text('le numero de telephone ne peut pas etre vide'),
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
                        print(phoneNumber);


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
        ),
      ),
    );
  }

  Future<void> _onbaording() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/on-boarding';



    final Map<String, dynamic> requestData = {
      'account_type': GlobalVariable.accounttype,
      'profession': GlobalVariable.profession,
      'activity_sector_id': GlobalVariable.activite,
      'origin_country_id': GlobalVariable.origine,
      'location_country_id': GlobalVariable.residence,
      'phone': phoneNumber,
      'avatar': GlobalVariable.photo,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Inscription réussie
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuggestionContact()),
      );

      print('Inscription réussie !');
      final body = json.decode(response.body);
      print(body);
    } else {
      // Erreur lors de l'inscription
      print('Erreur lors de l\'inscription. Code d\'erreur : ${response.statusCode}');
      final errorData = json.decode(response.body);
      print(errorData);


    }
    setState(() {
      _isloading = false;
    });
  }
}
