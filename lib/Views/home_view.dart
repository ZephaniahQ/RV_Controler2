import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rv_controller2/Services/auth_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final String? displayName = auth.user?.displayName;
    return Scaffold(body: Center(child: const Text("Welcome")));
  }
}
