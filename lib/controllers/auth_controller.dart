import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  _uploadImageToStorage (Uint8List image) async {
    TaskSnapshot snapshot = await _storage.ref().child('profiles').child(_auth.currentUser!.uid).putData(image);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Sign in successfully';
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<String> signUpUser(String name, String email, String password, Uint8List? image) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = cred.user!;
      await user.updateDisplayName(name);
      await user.reload();
      user = _auth.currentUser!;
      String downloadUrl = '';
      if (image != null) {
        downloadUrl = await _uploadImageToStorage(image);
      }
      await _firestore.collection('users').doc(user.uid).set({
        'fullName': user.displayName,
        'email': user.email,
        'image': downloadUrl,
      });
      
      return 'Sign up successfully';
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return file.readAsBytes();
    } else {
      return null;
    }
  }
}