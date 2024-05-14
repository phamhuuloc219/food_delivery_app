import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? ontap;

  const RegisterPage({
    super.key,
    required this.ontap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  void register() async{
    //get auth service
    final _authService = AuthService();

    // check if passwords match => create user
    if(passwordController.text == confirmPasswordController.text){
      // try creating user
      try{
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      }
      // display any error
      catch(e){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // check if passwords don't match => show error
    else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password don't match"),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 45,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 15,),

            //message, app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),

            const SizedBox(height: 25,),

            //email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10,),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10,),

            //confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obscureText: true,
            ),

            const SizedBox(height: 10,),

            //sign up button
            MyButton(
                ontap: () => register(),
                text: "Sign Up"),

            const SizedBox(height: 25,),

            //already have an account? login here

            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}