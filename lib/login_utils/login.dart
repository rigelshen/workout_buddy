import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:workout_buddy/utils/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController _emailController;
  // TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _emailController = TextEditingController(text: "");
    // _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Login"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16.0,),
                Image(
                  image: AssetImage("assets/logo_2.jpg"),
                ),
                SignInButton(
                  Buttons.Google,
                  onPressed: () async {
                    bool res = await AuthProvider().loginWithGoogle();
                    if(!res)
                      print("error logging in with google");
                  },
                ),
                // TextField(
                //   controller: _emailController,
                //   decoration: InputDecoration(
                //     hintText: "Enter email"
                //   ),
                // ),
                // const SizedBox(height: 10.0,),
                // TextField(
                //   controller: _passwordController,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //       hintText: "Enter password"
                //   ),
                // ),
                const SizedBox(height: 10.0,),
                // RaisedButton(
                //   child: Text("Login"),
                //   onPressed: () async {
                //     if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                //       print("Email and password cannot be empty");
                //       return;
                //     }
                //     bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                //     if (!res){
                //       print("Login Failed");
                //     }
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}