import 'package:flutter/material.dart';
import 'pet.dart'; 
import 'add_pet_details.dart'; 
import 'pet_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  List<Pet> pets = []; // List to store added pets

  @override
  void initState() {
    super.initState();
    // Load pets when the screen initializes
    _loadPets();
  }

  // Load pets from shared preferences
  Future<void> _loadPets() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (var key in keys) {
      if (key.startsWith('pet_')) {
        final petData = prefs.getString(key);
        if (petData != null) {
          final pet = Pet.fromMap(jsonDecode(petData));
          setState(() {
            pets.add(pet);
          });
        }
      }
    }
  }

  // Save pet to shared preferences
  Future<void> _savePet(Pet pet) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'pet_${pets.length + 1}'; // Generate unique key for each pet
    prefs.setString(key, jsonEncode(pet.toMap()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        backgroundColor: const Color.fromRGBO(245, 218, 210, .20),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
              Color.fromRGBO(225, 172, 172, .53), //225,172,172
              Color.fromRGBO(202, 135, 135, .40), //202,135,135
              Color.fromRGBO(168, 118, 118, .20), //168,118,118
              Color.fromRGBO(245, 218, 210, .20) //245,218,210
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Display added pets
              for (var pet in pets)
                _buildPetButton(
                    context, pet.name, pet.image, pet.breed, pet.age),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPet = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddPetDetailsScreen()));
          // Add the new pet to the list
          if (newPet != null) {
            setState(() {
              pets.add(newPet);
            });
            _savePet(newPet); // Save the new pet
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Widget to build pet button
  Widget _buildPetButton(BuildContext context, String petName, String petImage,
      String breed, String age) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(196, 153, 243, 0.50),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            onPressed: () {
              // Action when pet button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PetDetailsScreen(petName, petImage, breed, age)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(petImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//APNA MAIN CODE
/*import 'package:flutter/material.dart';
import 'pet.dart'; // Import the Pet class
import 'add_pet_details.dart'; // Import the AddPetDetailsScreen
import 'pet_details.dart';

class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  List<Pet> pets = []; // List to store added pets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        backgroundColor: const Color.fromRGBO(245, 218, 210, .20),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
              Color.fromRGBO(225, 172, 172, .53), //225,172,172
              Color.fromRGBO(202, 135, 135, .40), //202,135,135
              Color.fromRGBO(168, 118, 118, .20), //168,118,118
              Color.fromRGBO(245, 218, 210, .20) //245,218,210
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        /*child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Display added pets
            for (var pet in pets)
              _buildPetButton(context, pet.name, pet.image, pet.breed, pet.age),
          ],
        ),
        //),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPet = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPetDetailsScreen()));
          // Add the new pet to the list
          if (newPet != null) {
            setState(() {
              pets.add(newPet);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Widget to build pet button
  Widget _buildPetButton(BuildContext context, String petName, String petImage,
      String breed, String age) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            //gradient: const LinearGradient(
              color: //[
                const Color.fromRGBO(196, 153, 243, 0.50),
                
              //],
              //begin: Alignment.centerRight,
              //end: Alignment.centerLeft,
            //),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            onPressed: () {
              // Action when pet button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PetDetailsScreen(petName, petImage, breed, age)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      /*const SizedBox(height: 5),
                      Text(
                        'Breed: $breed',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Age: $age years',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),*/
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(petImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'pet.dart'; // Import the Pet class
import 'add_pet_details.dart'; // Import the AddPetDetailsScreen
import 'pet_details.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  List<Pet> pets = [];

  @override
  void initState() {
    super.initState();
    // Load pets when the screen initializes
    _loadPets();
  }

  // Load pets from shared preferences
  Future<void> _loadPets() async {
    final prefs = await SharedPreferences.getInstance();
    final petList = prefs.getStringList('pets');
    if (petList != null) {
      setState(() {
        pets = petList.map((petData) => Pet.fromMap(jsonDecode(petData))).toList();
      });
    }
  }

  // Save pets to shared preferences
  Future<void> _savePets() async {
    final prefs = await SharedPreferences.getInstance();
    final petList = pets.map((pet) => jsonEncode(pet.toMap())).toList();
    prefs.setStringList('pets', petList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        backgroundColor: const Color.fromRGBO(245, 218, 210, .20),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
              Color.fromRGBO(225, 172, 172, .53), //225,172,172
              Color.fromRGBO(202, 135, 135, .40), //202,135,135
              Color.fromRGBO(168, 118, 118, .20), //168,118,118
              Color.fromRGBO(245, 218, 210, .20) //245,218,210
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        /*child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Display added pets
            for (var pet in pets)
              _buildPetButton(context, pet.name, pet.image, pet.breed, pet.age),
          ],
        ),
        //),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPet = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPetDetailsScreen()));
          if (newPet != null) {
            setState(() {
              pets.add(newPet);
              _savePets(); // Save pets when a new pet is added
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Widget to build pet button
  Widget _buildPetButton(BuildContext context, String petName, String petImage,
      String breed, String age) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            //gradient: const LinearGradient(
              color: //[
                const Color.fromRGBO(196, 153, 243, 0.50),
                
              //],
              //begin: Alignment.centerRight,
              //end: Alignment.centerLeft,
            //),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            onPressed: () {
              // Action when pet button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PetDetailsScreen(petName, petImage, breed, age)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      /*const SizedBox(height: 5),
                      Text(
                        'Breed: $breed',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Age: $age years',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),*/
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(petImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'pet.dart'; // Import the Pet class
import 'add_pet_details.dart'; // Import the AddPetDetailsScreen
import 'pet_details.dart';

class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  List<Pet> pets = []; // List to store added pets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
      ),
      backgroundColor: Colors.transparent, // Set background color to transparent
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
              Color.fromRGBO(225, 172, 172, .53), //225,172,172
              Color.fromRGBO(202, 135, 135, .40), //202,135,135
              Color.fromRGBO(168, 118, 118, .20), //168,118,118
              Color.fromRGBO(245, 218, 210, .20) //245,218,210
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Display added pets
              for (var pet in pets)
                _buildPetButton(
                    context, pet.name, pet.image, pet.breed, pet.age),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPet = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPetDetailsScreen()));
          // Add the new pet to the list
          if (newPet != null) {
            setState(() {
              pets.add(newPet);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Widget to build pet button
  Widget _buildPetButton(BuildContext context, String petName, String petImage,
      String breed, String age) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white, // Set button background color to white
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            // Action when pet button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PetDetailsScreen(petName, petImage, breed, age)),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent, // Set button background color to transparent
            elevation: 0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Breed: $breed',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Age: $age years',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(petImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/


/*import 'package:flutter/material.dart';
import 'pet.dart'; // Import the Pet class
import 'add_pet_details.dart'; // Import the AddPetDetailsScreen
import 'pet_details.dart';

class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  List<Pet> pets = []; // List to store added pets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pets'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
              Color.fromRGBO(225, 172, 172, .53), //225,172,172
              Color.fromRGBO(202, 135, 135, .40), //202,135,135
              Color.fromRGBO(168, 118, 118, .20), //168,118,118
              Color.fromRGBO(245, 218, 210, .20) //245,218,210
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Display added pets
                for (var pet in pets)
                  _buildPetButton(
                      context, pet.name, pet.image, pet.breed, pet.age),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPet = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddPetDetailsScreen()));
          // Add the new pet to the list
          if (newPet != null) {
            setState(() {
              pets.add(newPet);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Widget to build pet button
  Widget _buildPetButton(BuildContext context, String petName, String petImage,
      String breed, String age) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 204, 95, 131),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: () {
            // Action when pet button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PetDetailsScreen(petName, petImage, breed, age)),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Breed: $breed',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Age: $age years',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(petImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
