import 'package:disaster_management/resources/auth_methods.dart';
import 'package:disaster_management/screens/login_screen_user.dart';
import 'package:disaster_management/screens/signup_screen_agency.dart';
import 'package:flutter/material.dart';
import 'package:disaster_management/resources/header.dart';
import 'package:disaster_management/resources/logo.dart';
import 'package:disaster_management/resources/text_field_custom.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 203, 250, 255),
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          physics: const BouncingScrollPhysics(),
          children: [
            const Stack(
              children: [HeaderLogin(), LogoHeader()],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: Text(
                    'As User/',
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 41, 61),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreenAgency(),
                        ));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: const Text(
                    'As Agency',
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 19, 41, 61), // Set the color of the text
                      fontSize: 20, // Set the font size
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name*',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 19, 41, 61),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldInput(
                    textEditingController: _nameController,
                    hintext: 'Enter your name',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Email*',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 19, 41, 61),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldInput(
                    textEditingController: _emailController,
                    hintext: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Password*',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 19, 41, 61),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldInput(
                    textEditingController: _passwordController,
                    hintext: 'Enter your password',
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Phone Number*',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 19, 41, 61),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldInput(
                    textEditingController: _numberController,
                    hintext: 'Your contact number',
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () async {
                String res = await AuthMethods().signUpUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    username: _nameController.text,
                    number: _numberController.text);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    color: Color.fromARGB(255, 19, 41, 61),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 223, 235, 246),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: const Text(
                    "Already have an Account ? ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 103, 154),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color.fromARGB(255, 19, 41, 61),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
