import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/utils/error_dialogue.dart';
import 'package:softec/view_models/auth_view_model.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  AuthViewModel authViewModel = AuthViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Provider.of<AuthViewModel>(context).authState == AuthState.loading ? SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator()) : ElevatedButton(
              onPressed: () async{
                try {
                  await Provider.of<AuthViewModel>(context, listen:  false).signUp(
                      email: 'bilalkashif467@gmail.com',
                      password: 'test12345',
                      userName: 'Bilal Kashif');
                } on CustomException catch (error) {
                  showErrorDialogue(error.prefix, error.message, context);
                }
              },
              child:  Text('Sign-up'),
            ),
            ElevatedButton(
              onPressed: () async{
                try {
                  await authViewModel.login(
                      email: 'bilalkashif467@gmail.com', password: 'test12345');
                } on CustomException catch (error) {
                  showErrorDialogue(error.prefix, error.message, context);
                }
              },
              child: authViewModel.authState == AuthState.loading ? CircularProgressIndicator() : Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
