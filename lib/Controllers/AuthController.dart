import 'package:flutter/material.dart';
import 'package:rv_controller2/Views/home_view.dart';
import 'package:rv_controller2/Views/login_view.dart';

import '../Services/auth_service.dart';
import 'package:provider/provider.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService?>(
      builder: (context, auth, _) {
        return StreamBuilder(
          stream: auth?.authStateChanges,
          builder: (context, snapshot) {
            //show loading indicator while waiting for init connection
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            //Handle errors
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Something went wrong\n${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        auth?.signOut();
                      },
                      child: const Text('Sign Out'),
                    )
                  ],
                )),
              );
            }

            // if we have user data, they're logged in
            if (snapshot.hasData) {
              return const HomeView();
            }

            //otherwise, they need to log in

            return LoginView();
          },
        );
      },
    );
  }
}
