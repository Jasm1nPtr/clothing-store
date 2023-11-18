import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
 LoginView({Key? key}) : super(key: key);
  
  @override
  State <LoginView> createState() => _LoginVIewState();
}

class _LoginVIewState extends State<LoginView> {

  // text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 75),
                // Heloo Again
                Text(
                  'HELLO AGAIN',
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome Back!!',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 50),

                // EMAIL TEXFIELD
                Padding(
                  padding:EdgeInsets.all(25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input Email',
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //PASSWORD TEXTFIELD
                Padding(
                  padding:EdgeInsets.all(25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input Password',
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // SIGN IN BUTTON
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // REGISTER 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      ' Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        )
      ),
    );
  }
}
