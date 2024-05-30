import 'package:flutter/material.dart';
import 'adopt_details.dart';

class AdoptPage extends StatefulWidget {
  @override
  _AdoptPageState createState() => _AdoptPageState();
}

class _AdoptPageState extends State<AdoptPage> {
  String selectedType = 'All';
  String selectedGender = 'All';

  List<Map<String, dynamic>> petData = [
    {
      'imageUrl': 'assets/images/dog2.jpg',
      'name': 'Buddy',
      'type': 'Dog',
      'gender': 'Male',
      'description': 'Friendly and playful dog looking for a forever home.',
    },
    {
      'imageUrl': 'assets/images/cat1.jpg',
      'name': 'Whiskers',
      'type': 'Cat',
      'gender': 'Female',
      'description': 'Independent and affectionate cat seeking a loving owner.',
    },
    // Additional examples
    {
      'imageUrl': 'assets/images/dog2.jpg',
      'name': 'Max',
      'type': 'Dog',
      'gender': 'Male',
      'description': 'Energetic and loyal companion ready for adventure.',
    },
    {
      'imageUrl': 'assets/images/cat1.jpg',
      'name': 'Luna',
      'type': 'Cat',
      'gender': 'Female',
      'description': 'Calm and graceful cat looking for a quiet home.',
    },
    {
      'imageUrl': 'assets/images/dog2.jpg',
      'name': 'Rocky',
      'type': 'Dog',
      'gender': 'Male',
      'description': 'Strong and protective dog seeking an active family.',
    },
    {
      'imageUrl': 'assets/images/cat1.jpg',
      'name': 'Mittens',
      'type': 'Cat',
      'gender': 'Female',
      'description': 'Sweet and cuddly cat who loves attention.',
    },
  ];

  List<Map<String, dynamic>> filteredPets() {
    return petData.where((pet) {
      if (selectedType != 'All' && pet['type'] != selectedType) {
        return false;
      }
      if (selectedGender != 'All' && pet['gender'] != selectedGender) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopt a Pet'),
        //centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 208, 208, 0.86), //255,208,208
                  Color.fromRGBO(225, 172, 172, 0.53), //225,172,172
                  Color.fromRGBO(202, 135, 135, 0.40), //202,135,135
                  Color.fromRGBO(168, 118, 118, 0.20), //168,118,118
                  Color.fromRGBO(245, 218, 210, 0.20)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedType,
                    items: [
                      DropdownMenuItem(
                        child: Text('All Types'),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: Text('Dog'),
                        value: 'Dog',
                      ),
                      DropdownMenuItem(
                        child: Text('Cat'),
                        value: 'Cat',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedType = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedGender,
                    items: [
                      DropdownMenuItem(
                        child: Text('All Genders'),
                        value: 'All',
                      ),
                      DropdownMenuItem(
                        child: Text('Male'),
                        value: 'Male',
                      ),
                      DropdownMenuItem(
                        child: Text('Female'),
                        value: 'Female',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredPets().length,
              itemBuilder: (context, index) {
                final pet = filteredPets()[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetDetailScreen(
                          imageUrl: pet['imageUrl'],
                          name: pet['name'],
                          type: pet['type'],
                          gender: pet['gender'],
                          description: pet['description'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(pet['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pet['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${pet['type']} - ${pet['gender']}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
