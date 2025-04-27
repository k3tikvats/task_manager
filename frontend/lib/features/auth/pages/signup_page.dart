import 'package:flutter/material.dart';
import 'package:task_manager/features/auth/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  static route()=>MaterialPageRoute(
    builder: (context) => const LoginPage(),
  );
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  //why did we create a stateful widget? because we need to manage the state of the form fields and later on dispose of the controllers

  final formKey = GlobalKey<FormState>();
  //generic type form key
  //global key is used to contain info about the form state and formstate is the state associated with the form widget
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose(); //dispose all the controllers to free up resources
    // This is important to avoid memory leaks and other issues.

    formKey.currentState!
        .validate(); //this will call all the validator functions of all the text form fields present in the form

    super
        .dispose(); // Call the superclass dispose method(dispose all the flutter related items)
  }
  //in init we first init the flutter related items and then we init the controllers

  void SignUpUser() {
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
              'Sign Up.',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name field cannot be empty";
                  }
                  return null;
                }),
            const SizedBox(height: 15),
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
              onPressed: SignUpUser,
              child: Text(
                'Sign Up',
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
                Navigator.of(context).push(LoginPage.route());
              },
              child: RichText(
                  text: TextSpan(
                text: 'Already have an account?',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: ' Sign In',
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
