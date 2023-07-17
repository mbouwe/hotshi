import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotshi/Screen/Code/CodeScreen.dart';
import 'package:hotshi/Screen/Reset%20Password/ResetPassword.dart';
import 'package:http/http.dart' as http;
import 'package:hotshi/Screen/Signin/login.dart';

import '../../Widget/CustumAppBar.dart';
import '../Signup/Signup.dart';

class SignInScreen extends StatefulWidget {
   SignInScreen({Key? key}) : super(key: key);


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController emailControler1 = TextEditingController();
  final TextEditingController _code1Controller = TextEditingController();
  final TextEditingController _code2Controller = TextEditingController();
  final TextEditingController _code3Controller = TextEditingController();
  final TextEditingController _code4Controller = TextEditingController();
  final TextEditingController _code5Controller = TextEditingController();
  String type="email";
  String otpCode = '';

  bool _isloading = false;
  String text ='';
  bool visible = false;
  String color = '';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Connectez-vous',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                          color: const Color(0xFF391c4a)
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25.0),
                  const Padding(
                    padding: EdgeInsets.only(right: 70.0, left: 70),
                    child: Divider(color: Colors.grey),
                  ),
                  const SizedBox(height: 25.0),
                  TextFormField(
                    controller: emailControler,
                    decoration: InputDecoration(
                      focusColor: Colors.purple,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      prefixIcon: const Icon(Icons.email_outlined, color: Colors.black),
                    ),
                    style: GoogleFonts.montserrat(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '         Veuillez entrer votre email';
                      }
                      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                      if (!emailRegex.hasMatch(value)) {
                        return '            Veuillez entrer une adresse e-mail valide';
                      }

                      return '             adresse e-mail valide';
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Visibility(
                    visible: visible,
                    child: Text(
                      text,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,

                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  Container(
                    height: 60.0,
                    width: 60.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Logique de connexion
                          _checkemail();

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: const Color(0xFF391C4A),
                      ),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                  const SizedBox(height: 10.0), // Ajout d'un espace entre les boutons
                  TextButton(
                    onPressed: () {
                      // Action pour le bouton "Mot de passe oublié"
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            actionsPadding: const EdgeInsets.only(top: 40,bottom: 30,left: 10,right: 10),
                            titlePadding: EdgeInsets.zero,

                            title: Container(
                              padding: const EdgeInsets.only(top: 18.0,bottom: 18), // Ajustement du rembourrage
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
                                color: Color(0xFF391C4A), // Couleur violette (Purple)
                              ),
                              child: const Text(
                                'Reset Password',
                                textAlign: TextAlign.center,

                              ),
                            ),
                            titleTextStyle: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),

                            actions: [
                              Form(
                                key: _formKey1,
                                child: Column(
                                  children: [
                                     Text(
                                      'Veuillez Saisir votre Email',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                          fontSize: 16.0,

                                        ),
                                      ),

                                      textAlign: TextAlign.center,

                                    ),
                                    const SizedBox(height: 25.0),
                                    TextFormField(
                                      controller: emailControler1,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                        labelText: 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: const Icon(Icons.email_outlined, color: Colors.black),
                                      ),
                                      style: GoogleFonts.montserrat(),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '         Veuillez entrer votre email';
                                        }
                                        final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return '            Veuillez entrer une adresse e-mail valide';
                                        }

                                        return '               adresse e-mail valide';
                                      },
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: const [

                                      ],
                                    ),

                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(

                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape:RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            backgroundColor: Colors.white,
                                            shadowColor: const Color(0xFF391C4A),
                                            // Couleur violette (Purple)
                                          ),
                                          child: const Text('Annuler',style: TextStyle(color: Color(0xFF391C4A)),),
                                        ),
                                        const SizedBox(width: 10,),
                                        ElevatedButton(

                                          onPressed: () {

                                            if (_formKey1.currentState!.validate()) {
                                              // Logique de connexion
                                              _forgetpassword();

                                            }



                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape:RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            backgroundColor: const Color(0xFF391C4A), // Couleur violette (Purple)
                                          ),
                                          child: const Text('Confirmer'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),



                            ],
                          );
                        },
                      );

                    },
                    child: Text(
                      'Mot de passe oublié',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pas de compte ?',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 16.0,

                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text(
                  'Inscrivez-vous',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _checkemail() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/check-email';



    final Map<String, dynamic> requestData = {

      'email': emailControler.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Inscription réussie
      text ="cette adresse email est enregistré";
      visible=true;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen(email: emailControler.text)),
      );

      print('Inscription réussie !');
      final body = json.decode(response.body);
      print(body);
    } else {
      // Erreur lors de l'inscription
      text ="Cette adresse e-mail n’est associée à aucun compte, nouveau sur Hotshi! inscrivez-vous gratuitement";
      visible=true;
      print('Erreur lors de l\'inscription. Code d\'erreur : ${response.statusCode}');
      final errorData = json.decode(response.body);
      print(errorData);


    }
    setState(() {
      _isloading = false;
    });
  }
  Future<void> _forgetpassword() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/forgot-password';



    final Map<String, dynamic> requestData = {

      'email': emailControler1.text,

    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Inscription réussie
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.only(top: 40,bottom: 30,left: 10,right: 10),
            titlePadding: EdgeInsets.zero,

            title: Container(
              padding: const EdgeInsets.only(top: 18.0,bottom: 18), // Ajustement du rembourrage
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
                color: Color(0xFF391C4A), // Couleur violette (Purple)
              ),
              child: const Text(
                'Code',
                textAlign: TextAlign.center,

              ),
            ),
            titleTextStyle: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),

            actions: [
              Column(
                children: [
                  const Text(
                    'Veuillez Saisir votre code OTP',

                    textAlign: TextAlign.center,

                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        child: TextFormField(
                          controller: _code1Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),



                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        decoration: BoxDecoration(

                        ),
                        child: TextFormField(
                          controller: _code2Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              counterText: '',

                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()


                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        child: TextFormField(
                          controller: _code3Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              counterText: '',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()

                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        child: TextFormField(

                          controller: _code4Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              counterText: '',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()


                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        child: TextFormField(

                          controller: _code5Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              counterText: '',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()


                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mail non réçu ?",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,

                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      TextButton(
                        onPressed: () {
                          _renvoieOtp();
                        },
                        child: Text(
                          'Renvoyez',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(

                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: Colors.white,
                          shadowColor: const Color(0xFF391C4A),
                          // Couleur violette (Purple)
                        ),
                        child: const Text('Annuler',style: TextStyle(color: Color(0xFF391C4A)),),
                      ),
                      const SizedBox(width: 10,),
                      ElevatedButton(

                        onPressed: () {
                          if(_code1Controller.text !='' && _code2Controller.text !='' && _code3Controller.text !='' && _code4Controller.text !='' && _code5Controller.text !=''){
                            String code1 = _code1Controller.text;
                            String code2 = _code2Controller.text;
                            String code3 = _code3Controller.text;
                            String code4 = _code4Controller.text;
                            String code5 = _code5Controller.text;

                            // Concaténer les codes pour former le code OTP complet
                            otpCode = code1 + code2 + code3 + code4 + code5;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword(code:otpCode)),
                            );

                          }

                        },
                        style: ElevatedButton.styleFrom(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: const Color(0xFF391C4A), // Couleur violette (Purple)
                        ),
                        child: const Text('Confirmer'),
                      ),
                    ],
                  ),
                ],
              ),



            ],
          );
        },
      );


      final body = json.decode(response.body);
      print(body);
    } else {
      // Erreur lors de l'inscription
      text ="Adresse mail ou mot de passe incorrect!";
      visible=true;
      print('Erreur lors de l\'inscription. Code d\'erreur : ${response.statusCode}');
      final errorData = json.decode(response.body);
      print(errorData);


    }
    setState(() {
      _isloading = false;
    });
  }

  Future<void> _renvoieOtp() async {


    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/ask-otp';





    final Map<String, dynamic> requestData = {
      'vector': emailControler1.text,
      'type_vector': type,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Inscription réussie
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            content: const Text('Code OTP renvoyé'),
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

      print('Code OTP renvoyé !');
      final body = json.decode(response.body);
      print(body);
    } else {
      // Erreur lors de l'inscription
      print('Erreur lors de l\'inscription. Code d\'erreur : ${response.statusCode}');
      final errorData = json.decode(response.body);
      print(errorData);


    }

  }


}


