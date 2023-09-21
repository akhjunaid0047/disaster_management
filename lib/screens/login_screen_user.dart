import 'package:disaster_management/screens/signup_screen_user.dart';
import 'package:disaster_management/screens/user_pages.dart';
import 'package:flutter/material.dart';
import 'package:disaster_management/resources/header.dart';
import 'package:disaster_management/resources/logo.dart';
import 'package:disaster_management/resources/text_field_custom.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget currentScreen = const LoginScreen();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
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
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
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
                    'Password',
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
                ],
              ),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {},
              onLongPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserPage(),
                    ));
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
                    'Log In',
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
                    "Don't have an account ? ",
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
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Create One",
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
