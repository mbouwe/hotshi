import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotshi/Screen/Reset%20Password/ResetPassword.dart';

import '../../Widget/CustumAppBar.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final TextEditingController _code1Controller = TextEditingController();
  final TextEditingController _code2Controller = TextEditingController();
  final TextEditingController _code3Controller = TextEditingController();
  final TextEditingController _code4Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(

          children: [
            Text(
              'Entrez votre Code ',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
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
                  decoration: const InputDecoration(
                    counterText: '',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),



                  ),
                ),
              ),
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
            ],
           ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vous n'avez pas réçu de code ?",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,

                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  'Renvoyez',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              height: 60.0,
              width: 60.0,
              child: ElevatedButton(
                onPressed: () {


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
    );
  }
}
