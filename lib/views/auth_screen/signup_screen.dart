import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:paws_partners_final/views/auth_screen/firebase_auth.dart';
import 'package:paws_partners_final/views/auth_screen/signin_screen.dart';
import 'package:paws_partners_final/views/home_screen/home.dart';
import 'package:paws_partners_final/views/reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final  TextEditingController _passwordTextController = TextEditingController();
  final  TextEditingController _repasswordTextController = TextEditingController();
  final  TextEditingController _emailTextController = TextEditingController();
  final  TextEditingController _userNameTextController = TextEditingController();
  final  TextEditingController _fullNameTextController = TextEditingController();

  //final FirebaseAuthService _auth = FirebaseAuthService();
  final _firebase = FirebaseAuth.instance;
  /*Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim()
    );
  }*/

  void _submit() async
  {
    try{
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text);
      /*Navigator.push(context,
            MaterialPageRoute(builder:  (context)=> const HomeScreen()));*/
    }
    on FirebaseAuthException catch(error){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              color: Color.fromARGB(255, 1, 27, 36),
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Your Full Name", Icons.person_outline,
                        false, _fullNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Your UserName", Icons.person_outline,
                        false, _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Your Email Id", Icons.alternate_email,
                        false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Your Password", Icons.lock_outlined,
                        true, _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Retype Your Password", Icons.lock_outlined,
                        true, _repasswordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    signInSignUpButton(
                      context,
                      false,
                      _submit,
                      /*{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },*/
                    ),
                    signInOption(context),
                  ],
                ),
              ))),
    );
  }

  /*void _signUp() async{
    String username = _userNameTextController.text;
    String password = _passwordTextController.text;
    String email = _emailTextController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if(user!=null)
    {
      print('User created');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()) );
    }
    else
    {
      print('Some error');
    }

  }*/
}

Row signInOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Already have an account?",
          style: TextStyle(color: Color.fromARGB(255, 2, 38, 52))),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()));
        },
        child: const Text(
          " Log in",
          style: TextStyle(
              color: Color.fromARGB(255, 2, 38, 52),
              fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
