import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rv_controller2/Services/auth_service.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Controllers/AuthController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "RV Reciever",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const AuthController(),
      ),
    );
  }
}
