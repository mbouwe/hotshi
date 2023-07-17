import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotshi/Screen/Signin/Singnup.dart';
import 'package:hotshi/Screen/Signin/login.dart';
import 'package:hotshi/Widget/CustumAppBar.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  final String code;

  ResetPassword({required this.code});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordObscured = true;
  bool _isPasswordObscured1 = true;
  TextEditingController passwordControler = TextEditingController();
  TextEditingController passwordControler1 = TextEditingController();
  bool _isloading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 40, right: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'Votre Nouveau mot de Passe ',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),


                  const SizedBox(height: 10.0),
                  TextFormField(
                      controller: passwordControler,
                      obscureText: _isPasswordObscured,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10),
                        labelText: 'Nouveau Mot de passe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        prefixIcon: const Icon(
                            Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured =
                              !_isPasswordObscured;
                            });
                          },
                        ),
                      ),
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '         Veuillez entrer votre mot de passe';
                        }

                        if (value.length < 8) {
                          return '         Le mot de passe doit contenir au moins 8 caractères';
                        }

                        if (!RegExp(r'\d').hasMatch(value)) {
                          return '          Le mot de passe doit contenir au moins un chiffre';
                        }

                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                          return 'Le mot de passe doit contenir au moins un caractère spécial';
                        }

                        return null;
                      }

                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                      controller: passwordControler1,
                      obscureText: _isPasswordObscured,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10),
                        labelText: 'Confirmer mot de passe',
                        labelStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        prefixIcon: const Icon(
                            Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured =
                              !_isPasswordObscured;
                            });
                          },
                        ),
                      ),
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '         Veuillez entrer votre mot de passe';
                        }

                        if (value.length < 8) {
                          return '         Le mot de passe doit contenir au moins 8 caractères';
                        }

                        if (!RegExp(r'\d').hasMatch(value)) {
                          return 'Le mot de passe doit contenir au moins un chiffre';
                        }

                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                          return 'Le mot de passe doit contenir au moins un caractère spécial';
                        }

                        return null;
                      }

                  ),
                  const SizedBox(height: 15.0),


                  const SizedBox(height: 20.0),
                  // Ajout d'un espace entre les boutons
                  Container(
                    height: 60.0,
                    width: 60.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if ( passwordControler.text==passwordControler1.text) {
                            print(widget.code);
                            _resetpassword();


                          }else{
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(

                                  content: const Text('les emails et les mots de passe doivent être identiquent'),
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
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _resetpassword() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/reset-password';
    // Récupérer les valeurs des contrôleurs du code OTP





    final Map<String, dynamic> requestData = {
      'code': widget.code,
      'password': passwordControler.text,
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
        MaterialPageRoute(
            builder: (context) => SignInScreen()),
      );
      print('Code OTP validé !');
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
