import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:paws_partners_final/consts/colors.dart';
import 'package:paws_partners_final/consts/images.dart';
import 'package:paws_partners_final/consts/lists.dart';
import 'package:paws_partners_final/consts/string.dart';
import 'package:paws_partners_final/views/Calendar%20Screen/calendar_screen.dart';
import 'package:paws_partners_final/views/adopt_screen/adopt_home.dart';
import 'package:paws_partners_final/views/auth_screen/signin_screen.dart';
import 'package:paws_partners_final/views/community/community.dart';
import 'package:paws_partners_final/views/home_screen/article_screen.dart';
import 'package:paws_partners_final/views/my_pets/my_pets.dart';
import 'package:paws_partners_final/views/my_pets/profile_screen.dart';
import 'package:paws_partners_final/views/user_profile.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/colors.dart';
import '../../consts/colors.dart';
import '../my_pets/profile.dart';
import 'home_buttons.dart';
import 'package:paws_partners_final/views/community/community_screen.dart';
import 'package:paws_partners_final/views/training/basics_screen.dart';

class Home extends StatelessWidget{
  Home({super.key});


  @override
  Widget build(context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Hub'),
        //centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 208, 208, 0.2),


      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Icon(
                      Icons.power_settings_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen(ownerProfile: user)),
                      );
                    },
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Divider(
            //   color: brownColor,
            //   thickness: 2,
            // ),
            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Community()),
                    );
                  },
                  child: homeButtons(
                    height: context.screenHeight * 0.15,
                    width: context.screenWidth / 2.5,
                    icon: communityImage,
                    title: community,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => basicScreen()),
                    );
                  },
                  child: homeButtons(
                    height: context.screenHeight * 0.15,
                    width: context.screenWidth / 2.5,
                    icon: trainingImage,
                    title: training,
                  ),
                ),
              ],
              /*List.generate(
                2,
                    (index) => homeButtons(
                height: context.screenHeight * 0.15,
                width: context.screenWidth / 2.5,
                icon: index==0? communityImage:trainingImage,
                title: index == 0 ? community: training,
                    )
              ),*/ // List.generate
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPets()),
                    );
                  },
                  child: homeButtons(
                    height: context.screenHeight * 0.15,
                    width: context.screenWidth / 2.5,
                    icon: myPetImage,
                    title: mypets,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdoptPage()),
                    );
                  },
                  child: homeButtons(
                    height: context.screenHeight * 0.15,
                    width: context.screenWidth / 2.5,
                    icon: adoptImage,
                    title: adopt,
                  ),
                ),
              ],
              /*List.generate(
                  2,
                      (index) => homeButtons(

                                          height: context.screenHeight * 0.15,
                                          width: context.screenWidth / 2.5,
                                          icon: index==0? myPetImage:adoptImage,
                                          title: index == 0 ? mypets: adopt,

                      )
              ),*/ // List.generate
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: EventCalendarScreen(),
              // color: Colors.orange,
              // height: 300,

            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: brownColor,
              thickness: 2,
            ),
            Text('Articles About Pets',
            textAlign: TextAlign.center,
              style: TextStyle(
                color: brownColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 180,
              enlargeCenterPage: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleScreen(),
                      ),
                    );
                    print('Image tapped at index $index');
                  },
                  child: Image.asset(
                    'assets/images/art$index.jpg',

                    fit: BoxFit.fill,
                  )
                      .box
                      .rounded
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.symmetric(horizontal: 8.0))
                      .make(),
                );
              },
            ),
            25.heightBox,



          ],
                ),
        ),

      ),
    );
  }
}


