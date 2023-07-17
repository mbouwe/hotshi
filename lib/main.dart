
import 'package:animated_background/animated_background.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

import 'Screen/Signin/Singnup.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return const MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body:  Splashscreen(),
      ),
    );

  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SignInScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'Assets/Images/logo.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('Assets/Images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 20.0,

      ),
    );

     var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF391C4A)

        ),
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.all(5),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
      contentMargin: const EdgeInsets.all(5),
      footerPadding: EdgeInsets.zero,
      bodyAlignment: Alignment.center,
      footerFlex: 0,
      footerFit: FlexFit.loose,
      safeArea: 15




    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,




      pages: [
        PageViewModel(

          title:'' ,
          footer:  Center(child: Text('Être sur Hotshi',style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF391C4A)

            ),
          ),)),


          decoration: pageDecoration,
          bodyWidget: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: double.infinity,
                height: 580,
                child: Stack(
                  children: [
                    Positioned(
                      left: 110,
                      top: 370,
                      child: Container(
                        width: 300,
                        height: 250,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('Assets/Images/Capture _ 4.png'),fit: BoxFit.cover),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 170,
                      top: 70,
                      child: Container(
                        width: 200,
                        height: 300,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('Assets/Images/Capture _ 6.png')),

                          color: Colors.green,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 180,
                      top: 220,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration:  const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('Assets/Images/Capture _1.png')),

                        ),
                      ),
                    ),
                    Positioned(
                      right: 140,
                      top: -20,
                      child: Container(
                        width: 300,
                        height: 230,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('Assets/Images/Capture _ 5.png')),

                        ),
                      ),
                    ),


                  ],
                ),
              );
            },
          ),


        ),
        PageViewModel(
          titleWidget: const Text(''),
          footer:  Center(child: Text('Être sur Hotshi',style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF391C4A)

            ),
          ),)),

          decoration: pageDecoration,
          bodyWidget: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                padding: const EdgeInsets.all(8),
                width: 900,
                height: 590,
                child: Stack(
                  children: [
                    Positioned(
                      left: 100,
                      top: 320,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('Assets/Images/Capture _ 6.png'),fit: BoxFit.cover),


                        ),
                      ),
                    ),
                    Positioned(
                      left: 170,
                      top: -60,
                      child: Container(
                        width: 190,
                        height: 300,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('Assets/Images/Capture _ 2.png'),fit: BoxFit.cover),

                        ),
                      ),
                    ),
                    Positioned(
                      right: 140,
                      top: 130,
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('Assets/Images/Capture _.png'),fit: BoxFit.cover),


                        ),
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),

        PageViewModel(
          title: "Qu'est ce que Hotshi",
          // Remove the 'body' property since we'll use 'bodyWidget' instead
          image: _buildImage('4367.png'),
          decoration: pageDecoration,
          // Use 'bodyWidget' to wrap the content with a container
          bodyWidget: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 1.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children:  [
                Text(
                  "LE RÉSEAU SOCIAL PANAFRICAIN ET AU-DELÀ \n Hotshi connecte la carte des pays africains et le reste du monde dans le but de stimuler l'économie africaine. Grâce à une combinaison d'offres d'emploi et d'appels à projet, Hotshi a permis de construire des réseaux dynamiques en Afrique et à travers le monde, où les startups sont pleines de talent.",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 16.0,

                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),




      ],

      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text('PRECEDENT', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Text('SUIVANT', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      done: const Text('TERMINER', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(6),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator:  const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: Colors.white,
        color: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator:  const ShapeDecoration(
        color: Color(0xFF391C4A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children: [
          Image.asset(
            'Assets/Images/Fond.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset('Assets/Images/logo2.png', width: 250, height: 100,color: Colors.white,),
                Center(
                  child: Text(
                    'Le réseau social Professionnel que vous attendez',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: CupertinoColors.white,
                    ),  ),
                ),
                const SizedBox(height: 10,),
                const SpinKitWave(
                  color: Colors.purple,
                  size: 30,
                  type: SpinKitWaveType.start,
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.purple,
      nextScreen: OnBoardingPage(),
      splashIconSize: 2000,
      duration: 5000,
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );


  }
}

