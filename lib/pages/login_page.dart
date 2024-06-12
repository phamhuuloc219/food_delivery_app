import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/register_page.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

//User Sign In method
  void signUserIn() async {
    // get instance auth service
    final _authService = AuthService();

    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );

    //try sign in
    try {
      //try sign in
      //await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop the circle
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);

      //show alert dialog with error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign in Failed'),
            content: const Text('Username Or Password Incorrect'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //logo
              Image(image:AssetImage("assets/images/logo.png"),width: 135,height: 135,),

              const SizedBox(height: 25),

              //message,app slogan
              Text(
                'RASCHJRS Restaurant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 25),

              //email textfield

              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              //sign in button

              MyButton(
                ontap: signUserIn,
                text: 'Login',
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                            color:
                            Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              //not a member? register now

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(onTap: () {}),
                          ),
                        );
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}