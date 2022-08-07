import 'package:flutter/material.dart';
import 'package:wastinnova/components/text_input.dart';
import 'package:wastinnova/constants.dart';
import 'package:wastinnova/resources/auth_methods.dart';
import 'package:wastinnova/screens/home.dart';
import 'package:wastinnova/utils/utils.dart';


bool _isLoading=false;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text,
        password: _passwordController.text);
    
    setState(() {
      _isLoading = false;
    });
    if (res!="Success") {
      showSnackBar(context, res);
    } else {
      //go to home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  const Home())
      );
    }
  }
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:const EdgeInsets.all(20),
          child: Column(children: [
            Flexible(child: Image.asset('assets/authIllus.png')),
            SizedBox(
                height: 25,
              ),
              Text("Enter your email and password", style: TextStyle(fontSize: 15,color: Colors.black45),),
              SizedBox(
                height: 25,
              ),
            TextFieldInput(
                    hintText: 'Enter E-mail',
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress),
            SizedBox(
                height: 25,
              ),
              
              //password
              TextFieldInput(
                hintText: 'Enter Password',
                textEditingController: _passwordController,
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: loginUser,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Log in"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 45),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Don't have an account?",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('signup');
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                      )),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
