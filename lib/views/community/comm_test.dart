import 'package:flutter/material.dart';

class CommunityFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Feature'),
        backgroundColor: Color.fromRGBO(255, 208, 208, 0.2),
      ),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Community Section',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  // Add your community cards here
                  CommunityCard(
                    title: 'Community 1',
                    description: 'Description for Community 1',
                    //imageUrl: 'assets/images/manpuppy.jpg',
                    memberCount: 1000,
                  ),
                  CommunityCard(
                    title: 'Community 2',
                    description: 'Description for Community 2',
                    //imageUrl: 'https://example.com/community2.jpg',
                    memberCount: 500,
                  ),
                  // Add more community cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String title;
  final String description;
  //final String imageUrl;
  final int memberCount;

  CommunityCard({
    required this.title,
    required this.description,
    //required this.imageUrl,
    required this.memberCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 202, 135, 135),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            // child: Image.network(
            //   imageUrl,
            //   height: 120.0,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      size: 16.0,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      '$memberCount members',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
