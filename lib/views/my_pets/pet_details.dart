import 'package:flutter/material.dart';

class PetDetailsScreen extends StatelessWidget {
  final String petName;
  final String petImage;
  final String breed;
  final String age;

  const PetDetailsScreen(this.petName, this.petImage, this.breed, this.age);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Details'),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Pet Details',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(petImage),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Name: $petName',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Breed: $breed',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Age: $age years',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 350.0, left: 16.0, right: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Action for scheduling appointment
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color.fromARGB(255, 202, 135, 135),
                          minimumSize: const Size(double.infinity, 60)
                        ),
                        child: const Text(
                          'Schedule Appointment',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 63, 29, 56),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 350.0, right: 16.0, left: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Action for viewing history
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color.fromARGB(255, 202, 135, 135),
                          minimumSize: const Size(double.infinity, 60),
                        ),
                        child: const Text(
                          'View History',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 63, 29, 56),
                          ),
                        ),
                      ),
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