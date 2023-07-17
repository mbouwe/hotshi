import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



import '../Secteuractivité/SecteurActivitéScreen.dart';
import '../Signup/Signup.dart';

class ContinueScreen extends StatefulWidget {
  const ContinueScreen({Key? key}) : super(key: key);

  @override
  State<ContinueScreen> createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/Images/welcome.png',
              width: 400.0,
              height: 200.0,
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
                'Bienvenue sur hotshi !',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFF391C4A),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
                "Nous avons le plaisir de vous confirmer la création de votre compte.\n\nVous pouvez à présent vous connecter et configurer votre profil.\nContruisez dès à présent votre réseau comme les milliers d'utilisateurs nous ayant rejoint. Les opportunités sont désormais à portée de votre main.\n\nL'équipe hotshi vous remercie de votre confiance.",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActiviteScreen()),
                  );
                },
                child: Text(
                  'CONTINUER',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF391C4A),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
