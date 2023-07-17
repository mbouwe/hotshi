import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widget/CustumAppBar.dart';
import '../PhotoProfil/PhotoProfil.dart';


class SuggestionContact extends StatefulWidget {
  const SuggestionContact({Key? key}) : super(key: key);


  @override
  State<SuggestionContact> createState() => _SuggestionContactState();
}

class _SuggestionContactState extends State<SuggestionContact> {
  final List<Person> people = [
    Person(
      name: 'John Doe',
      country: 'USA',
      imageUrl: 'https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/274139913_5189679651082761_8101934030444281710_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHT6QnoTQs4nDgrqpIfFPLqV7pEodxPaOxXukSh3E9o7JlNLrRHNer6wdsVL6af6DTYL2GWe9AglAiXic97p6d1&_nc_ohc=8A-qAqAUvGYAX8BFcHE&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AfAFU6ZzSQQcp7CYhJNYoBQMnL2c9XkTskc1xL9Xw_E55Q&oe=64B2F911',
    ),
    Person(
      name: 'John Doe',
      country: 'USA',
      imageUrl: 'https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/274139913_5189679651082761_8101934030444281710_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHT6QnoTQs4nDgrqpIfFPLqV7pEodxPaOxXukSh3E9o7JlNLrRHNer6wdsVL6af6DTYL2GWe9AglAiXic97p6d1&_nc_ohc=8A-qAqAUvGYAX8BFcHE&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AfAFU6ZzSQQcp7CYhJNYoBQMnL2c9XkTskc1xL9Xw_E55Q&oe=64B2F911',
    ),
    Person(
      name: 'John Doe',
      country: 'USA',
      imageUrl: 'https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/274139913_5189679651082761_8101934030444281710_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHT6QnoTQs4nDgrqpIfFPLqV7pEodxPaOxXukSh3E9o7JlNLrRHNer6wdsVL6af6DTYL2GWe9AglAiXic97p6d1&_nc_ohc=8A-qAqAUvGYAX8BFcHE&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AfAFU6ZzSQQcp7CYhJNYoBQMnL2c9XkTskc1xL9Xw_E55Q&oe=64B2F911',
    ),
    Person(
      name: 'John Doe',
      country: 'USA',
      imageUrl: 'https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/274139913_5189679651082761_8101934030444281710_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHT6QnoTQs4nDgrqpIfFPLqV7pEodxPaOxXukSh3E9o7JlNLrRHNer6wdsVL6af6DTYL2GWe9AglAiXic97p6d1&_nc_ohc=8A-qAqAUvGYAX8BFcHE&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AfAFU6ZzSQQcp7CYhJNYoBQMnL2c9XkTskc1xL9Xw_E55Q&oe=64B2F911',
    ),
    Person(
      name: 'John Doe',
      country: 'USA',
      imageUrl: 'https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/274139913_5189679651082761_8101934030444281710_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHT6QnoTQs4nDgrqpIfFPLqV7pEodxPaOxXukSh3E9o7JlNLrRHNer6wdsVL6af6DTYL2GWe9AglAiXic97p6d1&_nc_ohc=8A-qAqAUvGYAX8BFcHE&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AfAFU6ZzSQQcp7CYhJNYoBQMnL2c9XkTskc1xL9Xw_E55Q&oe=64B2F911',
    ),
    Person(
      name: 'John Doe',
      country: 'USA',
      imageUrl: 'https://z-p3-scontent.fdla3-2.fna.fbcdn.net/v/t39.30808-6/274139913_5189679651082761_8101934030444281710_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHT6QnoTQs4nDgrqpIfFPLqV7pEodxPaOxXukSh3E9o7JlNLrRHNer6wdsVL6af6DTYL2GWe9AglAiXic97p6d1&_nc_ohc=8A-qAqAUvGYAX8BFcHE&_nc_zt=23&_nc_ht=z-p3-scontent.fdla3-2.fna&oh=00_AfAFU6ZzSQQcp7CYhJNYoBQMnL2c9XkTskc1xL9Xw_E55Q&oe=64B2F911',
    ),

    // Add more people here...
  ];

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
              const SizedBox(height: 50),
              Center(

                child: Text(
                  'Suggestion de contacts',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 20.0,

                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(onPressed: (){
                        print(people.length);
                      }, icon: const Icon(Icons.add,color: Color(0xFF391C4A),size: 30,)),
                      leading: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(people[index].imageUrl),
                      ),
                      title: Text(people[index].name),
                      subtitle: Text(people[index].country),
                      onTap: () {
                        // Handle item tap
                      },
                    );
                  },
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
                    height: 50.0,
                    width: 50.0,
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

            ],
          ),
        ),
      ),
    );
  }
}
class Person {
  final String name;
  final String country;
  final String imageUrl;

  Person({
    required this.name,
    required this.country,
    required this.imageUrl,
  });
}