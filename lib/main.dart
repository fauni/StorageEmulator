// main.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:storage_project/screens/login_screen.dart';
import 'blocs/auth/auth_bloc.dart';
import 'services/firebase_service.dart';
import 'screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth.instance.useAuthEmulator('192.168.0.5', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('192.168.0.5', 8080);
  FirebaseStorage.instance.useStorageEmulator('192.168.0.5', 9199);

  runApp(BlocProvider(
    create: (_) => AuthBloc(FirebaseService()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Emulator Demo',
      home: LoginScreen(), 
    );
  }
}
