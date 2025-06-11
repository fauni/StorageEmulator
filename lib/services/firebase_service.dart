import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> loginUser({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
    required File image,
  }) async {
    // Crear el usuario
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = userCredential.user!.uid;

    // Subir imagen de perfil
    final ref = _storage.ref().child('profile_images').child('$uid.jpg');
    await ref.putFile(image);
    final imageUrl = await ref.getDownloadURL();

    // Guardar datos en Firestore
    await _firestore.collection('users').doc(uid).set({
      'uid': uid,
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
    });
  }

  Future<Map<String, dynamic>> getUserProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception("Usuario no autenticado");

    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception("Perfil no encontrado");
    }

    return doc.data()!;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

}
