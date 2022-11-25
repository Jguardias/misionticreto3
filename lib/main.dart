import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reto3/screens/home.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: FirebaseOptions(
  apiKey: "AIzaSyCl1fklW_ckfWoFIN030CCKYAq5xdc_iew",
  authDomain: "base-de-datos-chat-39c58.firebaseapp.com",
  projectId: "base-de-datos-chat-39c58",
  storageBucket: "base-de-datos-chat-39c58.appspot.com",
  messagingSenderId: "342041418499",
  appId: "1:342041418499:web:572a10449e8ba83e886736",
  measurementId: "G-W1TWESTQVX"
    ));
    
  runApp(const MyApp());
}
