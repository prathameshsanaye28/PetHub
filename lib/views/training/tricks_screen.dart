import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paws_partners_final/views/training/basics_screen.dart';
import 'package:paws_partners_final/views/home_screen/home.dart';
import 'package:velocity_x/velocity_x.dart';

import 'basic_info.dart';

class tricksScreen extends StatelessWidget{
  tricksScreen({super.key});

  @override
  Widget build(context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Training for Pets'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())); // Navigate back to the previous screen
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => basicScreen()),
                          );
                        },
                        child: Text('Basics'),
                      ),
                    ),
                    SizedBox(width: 20), // Add spacing between buttons
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 202, 135, 135),
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => tricksScreen()),
                          );
                        },
                        child: Text('Tricks', style: TextStyle(
                          color: Color.fromARGB(255, 63, 29, 56),
                        ),),
                      ),
                    ),
                  ],
                ),
          
              ),
              SizedBox(height: 20,),
            Divider(
          color: Colors.black,
              thickness: 2,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 220,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 185,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Card(
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 10.0),
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 220,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/cardtemplate.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 20.0, 20.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Top left container
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              184, 190, 218, 251),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ), // Your color here
                                        child: const Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.indigo,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Min",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.indigo,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ) // Your content here
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Advanced Tricks for Pets",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          /*Text(
                                              "\$1000",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),*/
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              /*Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),*/
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Description->",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              /*Icon(
                                                  Icons.zoom_out_map,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),*/
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Description about the exercise",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "4 Reviews",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Top right heart icon
                          /*const FavoriteIcon(
                            iconColor: Colors.white,
                            iconSize: 32.0,
                          ),*/
                        ],
                      ),
                    ).onTap(() {
                      Get.to(
                            () =>
                        const basicInfo(),
                      );
                    }),
                  );
                },
              )
            ],
          ),
        )
    );
  }

}