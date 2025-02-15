import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rv_controller2/Services/auth_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Spacer(),
          ElevatedButton(
              onPressed: () async {
                await auth.signInWithGoogle();
              },
              child: Text('Sign in with Google')),
          Spacer(),
        ],
      ),
    ));
  }
}
