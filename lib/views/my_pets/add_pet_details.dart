import 'package:flutter/material.dart';
import 'pet.dart';

class AddPetDetailsScreen extends StatefulWidget {
  @override
  _AddPetDetailsScreenState createState() => _AddPetDetailsScreenState();
}

class _AddPetDetailsScreenState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet Details'),
        backgroundColor: const Color.fromRGBO(245, 218, 210, .20),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
                  Color.fromRGBO(225, 172, 172, .53), //225,172,172
                  Color.fromRGBO(202, 135, 135, .40), //202,135,135
                  Color.fromRGBO(168, 118, 118, .20), //168,118,118
                  Color.fromRGBO(245, 218, 210, .20),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: breedController,
                  decoration: const InputDecoration(
                    labelText: 'Breed',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String breed = breedController.text;
                    String age = ageController.text;
                    Pet newPet = Pet(name, breed, age, ""); // No image provided
                    Navigator.pop(context,
                        newPet); // Return the new pet to the previous screen
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 202, 135, 135), // Background color
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Add Pet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 63, 29, 56), // Text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
