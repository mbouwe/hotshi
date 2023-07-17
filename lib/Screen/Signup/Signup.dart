import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotshi/Api/Api.dart';
import 'package:hotshi/Api/Modele/modele.dart';
import 'package:hotshi/Screen/Continue/ContinueScreen.dart';
import 'package:hotshi/Screen/PhotoProfil/PhotoProfil.dart';
import 'package:hotshi/Screen/Signin/Singnup.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:http/http.dart' as http;

import '../../Widget/CustumAppBar.dart';
import '../Signin/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  bool isToggleOn = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  bool _isPasswordObscured = true;
  bool _isPasswordObscured1 = true;
  bool _isloading = false;
  bool visible=false;
  bool visible1=false;
  String type="email";
  String otpCode = '';
  TextEditingController nameControler = TextEditingController();
  TextEditingController nameControler1 = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController email1Controler = TextEditingController();
  TextEditingController emailControler1 = TextEditingController();
  TextEditingController email1Controler1 = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController password1Controler = TextEditingController();
  TextEditingController passwordControler1 = TextEditingController();
  TextEditingController password1Controler1 = TextEditingController();
  final TextEditingController _code1Controller = TextEditingController();
  final TextEditingController _code2Controller = TextEditingController();
  final TextEditingController _code3Controller = TextEditingController();
  final TextEditingController _code4Controller = TextEditingController();
  final TextEditingController _code5Controller = TextEditingController();

  late TabController _tabController;
  int _currentIndex = 0;
  String text ='';
  String text1 ='';






  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 56.0, vertical: 10),
              child: TabBar(
                controller: _tabController,

                indicator: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: isToggleOn ? const Radius.circular(0.0) : const Radius.circular(
                        80.0),
                    right: isToggleOn ? const Radius.circular(80.0) : const Radius.circular(
                        0.0),
                  ),

                  color: const Color(0xFF391c4a),
                ),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: GoogleFonts.montserrat(),

                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Professionnel',),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Entreprise'),
                    ),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    isToggleOn = index == 1;
                    print(_currentIndex);
                  });
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 40, right: 40),
                        child: Form(
                          key: _formKey1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: nameControler,
                                decoration: InputDecoration(

                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: 'Prénoms & Nom',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.person, color: Colors.black,),
                                ),
                                style: GoogleFonts.montserrat(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '        Veuillez entrer votre Nom complet';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: emailControler,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),

                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined, color: Colors.black,),
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

                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
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
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: emailControler1,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: "Confirmation de l'email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined, color: Colors.black,),
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
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: passwordControler,
                                obscureText: _isPasswordObscured,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: 'Mot de passe',
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
                                      return 'Veuillez entrer votre mot de passe';
                                    }

                                    if (value.length < 8) {
                                      return 'Le mot de passe doit contenir au moins 8 caractères';
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
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: passwordControler1,
                                obscureText: _isPasswordObscured,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: 'Confirmation de mot de passe',
                                  labelStyle: const TextStyle(fontSize: 12),
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
                                      return 'Veuillez entrer votre mot de passe';
                                    }

                                    if (value.length < 8) {
                                      return 'Le mot de passe doit contenir au moins 8 caractères';
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
                              const Center(child: Text(
                                  "En vous inscrivant sur hotshi vous acceptez")),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePictureScreen()),
                                  );


                                },
                                child: Text(
                                  "les conditions générales d'utilisation",
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              // Ajout d'un espace entre les boutons
                              Container(
                                height: 60.0,
                                width: 60.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey1.currentState!.validate()) {
                                      if (emailControler.text==emailControler1.text && passwordControler.text==passwordControler1.text) {
                                        _checkemail();


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
                  SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 40, right: 40),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: nameControler1,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: "Nom de l'entreprise",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.person, color: Colors.black,),
                                ),
                                style: GoogleFonts.montserrat(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "          Veuillez entrer votre Nom d'entreprise";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: email1Controler,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),

                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined, color: Colors.black,),
                                ),
                                style: GoogleFonts.montserrat(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '           Veuillez entrer votre email';
                                  }
                                  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return '           Veuillez entrer une adresse e-mail valide';
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: email1Controler1,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: "Confirmation de l'email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined, color: Colors.black,),
                                ),
                                style: GoogleFonts.montserrat(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '           Veuillez entrer votre email';
                                  }
                                  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return '           Veuillez entrer une adresse e-mail valide';
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              Visibility(
                                visible: visible1,
                                child: Text(
                                  text1,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.red,

                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                controller: password1Controler,
                                obscureText: _isPasswordObscured1,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: 'Mot de passe',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  prefixIcon: const Icon(
                                      Icons.lock, color: Colors.black),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordObscured1
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordObscured1 =
                                        !_isPasswordObscured1;
                                      });
                                    },
                                  ),
                                ),
                                style: GoogleFonts.montserrat(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '        Veuillez entrer votre mot de passe';
                                    }

                                    if (value.length < 8) {
                                      return '        Le mot de passe doit contenir au moins 8 caractères';
                                    }

                                    if (!RegExp(r'\d').hasMatch(value)) {
                                      return '        Le mot de passe doit contenir au moins un chiffre';
                                    }

                                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                      return '         Le mot de passe doit contenir au moins un caractère spécial';
                                    }
                                    if (value.contains(' ')) {
                                      return 'Le mot de passe ne peut pas contenir d\'espaces';
                                    }

                                    return null;
                                  }
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(

                                controller: password1Controler1,
                                obscureText: _isPasswordObscured1,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  labelText: 'Confirmation de mot de passe',
                                  labelStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  prefixIcon: const Icon(
                                      Icons.lock, color: Colors.black),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordObscured1
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordObscured1 =
                                        !_isPasswordObscured1;
                                      });
                                    },
                                  ),
                                ),
                                style: GoogleFonts.montserrat(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '        Veuillez entrer votre mot de passe';
                                    }

                                    if (value.length < 8) {
                                      return '        Le mot de passe doit contenir au moins 8 caractères';
                                    }

                                    if (!RegExp(r'\d').hasMatch(value)) {
                                      return '        Le mot de passe doit contenir au moins un chiffre';
                                    }

                                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                      return '         Le mot de passe doit contenir au moins un caractère spécial';
                                    }
                                    if (value.contains(' ')) {
                                      return 'Le mot de passe ne peut pas contenir d\'espaces';
                                    }

                                    return null;
                                  }

                              ),
                              const SizedBox(height: 15.0),
                              const Center(child: Text(
                                  "En vous inscrivant sur hotshi vous acceptez")),
                              TextButton(
                                onPressed: () {
                                  // Action pour le bouton "Mot de passe oublié"
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ContinueScreen()),
                                  );
                                },
                                child: Text(
                                  "les conditions générales d'utilisation",
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              // Ajout d'un espace entre les boutons
                              Container(
                                height: 60.0,
                                width: 60.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (email1Controler.text==email1Controler1.text && password1Controler.text==password1Controler1.text) {
                                        _checkemail1();

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
                                  child: _isloading
                                      ? const CircularProgressIndicator(
                                    color: Colors.white,)
                                      : const Icon(Icons.arrow_forward),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vous avez un compte ?',
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
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  child: Text(
                    'Connectez-vous',
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
      ),
    );
  }
  //fonction de connection
  Future<void> _register() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/register';
    var account='';
    if(_currentIndex==0){
      account='pro';
    }else{
      account='ent';
    }
    print(account);
    print(type);

    final Map<String, dynamic> requestData = {
      'name': nameControler.text,
      'first_name': nameControler.text,
      'vector': emailControler.text,
      'password': passwordControler.text,
      'type_vector': type,
      'account_type': account,
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
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code1Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),



                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        decoration: const BoxDecoration(

                        ),
                        child: TextFormField(
                          autofocus: true,
                          controller: _code2Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              counterText: '',

                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()


                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code3Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              counterText: '',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()

                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code4Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              counterText: '',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()


                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code5Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
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
                            _ValidateOtp();

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
  Future<void> _register1() async {
    setState(() {
      _isloading = true;
    });
    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/register';
    var account='';
    if(_currentIndex==0){
      account='pro';
    }else{
      account='ent';
    }
    print(account);
    print(type);

    final Map<String, dynamic> requestData = {
      'name': nameControler1.text,
      'first_name': nameControler1.text,
      'vector': email1Controler.text,
      'password': password1Controler.text,
      'type_vector': type,
      'account_type': account,
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
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code1Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),



                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        decoration: const BoxDecoration(

                        ),
                        child: TextFormField(
                          autofocus: true,
                          controller: _code2Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              counterText: '',

                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()


                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code3Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              counterText: '',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()

                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code4Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              counterText: '',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()


                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 50,
                        height:50,
                        child: TextFormField(
                          autofocus: true,
                          controller: _code5Controller,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
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
                            _ValidateOtp();

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
      GlobalVariable.accounttype=account;

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

  //validation du code OTP

  Future<void> _ValidateOtp() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/validate-otp';
    var account='';
    if(_currentIndex==0){
      account='pro';
    }else{
      account='ent';
    }
    // Récupérer les valeurs des contrôleurs du code OTP
    String code1 = _code1Controller.text;
    String code2 = _code2Controller.text;
    String code3 = _code3Controller.text;
    String code4 = _code4Controller.text;
    String code5 = _code5Controller.text;

    // Concaténer les codes pour former le code OTP complet
    otpCode = code1 + code2 + code3 + code4 + code5;




    final Map<String, dynamic> requestData = {
      'code': otpCode,
      'vector': emailControler.text,
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
            builder: (context) => ContinueScreen()),
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
  Future<void> _ValidateOtp1() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/validate-otp';
    // Récupérer les valeurs des contrôleurs du code OTP
    String code1 = _code1Controller.text;
    String code2 = _code2Controller.text;
    String code3 = _code3Controller.text;
    String code4 = _code4Controller.text;
    String code5 = _code5Controller.text;

    // Concaténer les codes pour former le code OTP complet
    otpCode = code1 + code2 + code3 + code4 + code5;




    final Map<String, dynamic> requestData = {
      'code': otpCode,
      'vector': email1Controler.text,
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
            builder: (context) =>  ContinueScreen()),
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

  //renvoie du code OTP

  Future<void> _renvoieOtp1() async {


    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/ask-otp';





    final Map<String, dynamic> requestData = {
      'vector': email1Controler.text,
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
  Future<void> _renvoieOtp() async {


    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/ask-otp';





    final Map<String, dynamic> requestData = {
      'vector': emailControler.text,
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
  Future<void> _checkemail1() async {
    setState(() {
      _isloading = true;
    });

    const String apiUrl = 'http://testbackend.hogestion.com/api/fr/auth/check-email';



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
      text1 ="cette adresse email est enregistré sur Hotshi! Connectez-vous";
      visible1=true;
      print('Inscription réussie !');
      final body = json.decode(response.body);
      print(body);
    } else {
      // Erreur lors de l'inscription
      _register1();
    }
    setState(() {
      _isloading = false;
    });
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
      text ="cette adresse email est enregistré sur Hotshi! Connectez-vous";
      visible=true;
      print('Inscription réussie !');
      final body = json.decode(response.body);
      print(body);
    } else {
      // Erreur lors de l'inscription
      _register();
    }
    setState(() {
      _isloading = false;
    });
  }




}

