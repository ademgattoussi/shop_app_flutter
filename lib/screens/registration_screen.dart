import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/screens/chat_screen.dart';
import 'package:cartelly_shop/screens/signin_screen.dart';
import 'package:cartelly_shop/widgets/my_btn.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const screenRoute = "registration_screen";


  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;

  bool spinner = false;
  
  late String email;
  late String password;

  void _showAuthErrorDialog(FirebaseAuthException e) {
    String errorMessage;

  
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'The email address is badly formatted.';
        break;
      case 'email-already-in-use':
        errorMessage = 'The email is already in use by another account.';
        break;
      case 'weak-password':
        errorMessage = 'The password is too weak.';
        break;
      case 'operation-not-allowed':
        errorMessage = 'Email/password accounts are not enabled.';
        break;
      default:
        errorMessage = 'An unknown error occurred: ${e.message}';
    }

  
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          "Register",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),
        ),
        ),      
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 180,
                child:  const Icon(Icons.support_agent, size: 30),
              ),
              const SizedBox(height: 50,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){
                  email = value;
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter your Email',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kSecondaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                ),
          
              ),
              const SizedBox(height: kDefaultPadding / 2.5,),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value){
                  password = value;
                },
                obscureText: true,  
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter your Password',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kSecondaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                ),
              ),
              const SizedBox(height: kDefaultPadding,),
              
              MyBtn(color: kPrimaryColor, title: 'Register', OnPressed: () async{
                setState(() {
                  spinner = true;
                });
                try{
                await _auth.createUserWithEmailAndPassword(email: email, password: password);
                Navigator.pushNamed(context, ChatScreen.screenRoute);
                setState(() {
                  spinner = false;
                });
                }
                catch(e) {
                   if (e is FirebaseAuthException) {
                    
                      _showAuthErrorDialog(e);
                    } else {
                      print(e);
                    }
                    setState(() {
                  spinner = false;
                });
                }
          
          
              }),
              const Center(
                  child: Text(
                    "Do you have an account?",
                  ),
                ),
              MyBtn(color: kTextColor, title: 'Sign In', OnPressed: () {
                Navigator.pushNamed(context, SigninScreen.screenRoute);
              }),
              const SizedBox(height: 150,)
            ],
          ),
                ),
        ),
    );
  }
}