import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Api/Api.dart';
import '../../Widget/CustumAppBar.dart';
import '../PhoneScreen/PhoneScreen.dart';
import '../Secteuractivité/SecteurActivitéScreen.dart';
import '../pays/PaysScreen.dart';
import '../pays/residence.dart';

class ProfilePictureScreen extends StatefulWidget {
  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  XFile? _imageFile; // Modification de PickedFile? à XFile?
  final ImagePicker _picker = ImagePicker();
  Alignment _imageAlignment = Alignment.center;

  Future<void> _pickImage(ImageSource source) async {
    XFile? selected = await _picker.pickImage(source: source, imageQuality: 50); // Utilisation de XFile à la place de PickedFile
    if (selected != null) {
      File image = File(selected.path);
      int fileSize = await image.length();

      if (fileSize <= 10 * 1024 * 1024) {
        setState(() {
          _imageFile = selected;
          _imageAlignment = Alignment.center;
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Image trop volumineuse'),
              content: Text('Veuillez sélectionner une image inférieure à 10 Mo.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choisir une source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Caméra'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.camera);
                  },
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: const Text('Galerie'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateImageAlignment(Alignment alignment) {
    setState(() {
      _imageAlignment = alignment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _imageAlignment += Alignment(
              details.delta.dx / (MediaQuery.of(context).size.width / 2),
              details.delta.dy / (MediaQuery.of(context).size.height / 2),
            );
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2.0,
                  ),
                ),
                child: Stack(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: _imageFile != null
                            ? Image.file(
                          File(_imageFile!.path),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          alignment: _imageAlignment,
                        )
                            : Container(
                          child: Image.asset('Assets/Images/user.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF391C4A),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _showImageSourceDialog();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Choisissez votre photo de profil',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF391C4A)
                  ),
                ),
                textAlign: TextAlign.center,
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
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResidenceScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                      ),
                      child: const Icon(Icons.arrow_back, color: Color(0xFF391C4A)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 53.0,
                    width: 53.0,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PhoneScreen()),
                        );
                        GlobalVariable.photo = _imageFile!.path;
                        print(GlobalVariable.origine);
                        print(GlobalVariable.activite);
                        print(GlobalVariable.profession);
                        print(GlobalVariable.residence);
                        print(GlobalVariable.photo);

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
}
