import 'package:flutter/material.dart';
import 'owner_profile.dart';
import 'my_pets.dart'; 

class ProfileScreen extends StatelessWidget {
  final OwnerProfile ownerProfile;

  const ProfileScreen({Key? key, required this.ownerProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          // Use Stack to layer the Log Out button on top
          children: [
            SingleChildScrollView(
              // Wrap the Column with SingleChildScrollView
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(ownerProfile.imageUrl),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ownerProfile.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildProfileItem('DOB', ownerProfile.dob),
                    _buildProfileItem('Gender', ownerProfile.gender),
                    _buildProfileItem('Contact', ownerProfile.contact),
                    _buildProfileItem('Email', ownerProfile.email),
                    _buildProfileItem('Address', ownerProfile.address),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyPets()), // Navigate to MyPetsScreen
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 202, 135, 135), // Background color
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'My Pets',
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
            Positioned(
              // Position the Log Out button to the top right corner
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: () {
                  // Implement the log out functionality here
                },
                icon: const Icon(Icons.logout),
                color: Colors.black,
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 73, 36, 62)
              ),
            ),
          ),
        ],
      ),
    );
  }
}





