import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paws_partners_final/consts/string.dart';
import 'package:paws_partners_final/views/auth_screen/signup_screen.dart';
import 'package:paws_partners_final/views/home_screen/home.dart';
import 'package:paws_partners_final/views/reusable_widgets/reusable_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _firebase = FirebaseAuth.instance;

  void _submit() async{
    if (_emailTextController.text.isEmpty || _passwordTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both email and password')),
      );
      return; // Stop execution if fields are empty
    }
    try{
      final userCredentials = await _firebase.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Home()));
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
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png", 180.0, 180.0),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Your Email", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Your Password", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: _submit, child: forgetPass.text.make())),
                signInSignUpButton(context, true, () {
                  _submit();

                }),
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have an account?",
        style: TextStyle(color: Color.fromARGB(255, 2, 38, 52)),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(
              color: Color.fromARGB(255, 2, 38, 52),
              fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
