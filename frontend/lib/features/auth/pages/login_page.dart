import 'package:flutter/material.dart';

import 'package:task_manager/features/auth/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  static route()=>MaterialPageRoute(
    builder: (context) => const SignUpPage(),
  );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  

  final formKey = GlobalKey<FormState>();
  //generic type form key
  //global key is used to contain info about the form state and formstate is the state associated with the form widget
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    //dispose all the controllers to free up resources
    // This is important to avoid memory leaks and other issues.

    formKey.currentState!
        .validate(); //this will call all the validator functions of all the text form fields present in the form

    super
        .dispose(); // Call the superclass dispose method(dispose all the flutter related items)
  }
  //in init we first init the flutter related items and then we init the controllers

  void loginUser() {
    if (formKey.currentState!.validate()) {
      //store the user data and call the nodejs and express stuff
      //if the form is valid then we can proceed with the Login process
      //call the Login api here and pass the email and password to it
      //after that navigate to the home page or whatever page you want to navigate to
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login.',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.trim().contains('@')) {
                    //this is a simple regex to check if the email is valid or not
                    return "Email field is invalid!";
                  }
                  return null;
                }),
            const SizedBox(height: 15),
            TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 6) {
                    return "Password field is invalid!";
                  }
                  return null;
                }),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: loginUser,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigate to the signup page
                // Navigator.pushNamed(context, '/signup');
                // Navigator.push(context, SignupPage.route());
                Navigator.of(context).push(SignUpPage.route());//if i want to go to sign up pg from any other pg i just have to do this
                //instead of material page route and all that stuff
              },
              child: RichText(
                  text: TextSpan(
                text: 'Don\'t have an account?',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    ));
  }
}
