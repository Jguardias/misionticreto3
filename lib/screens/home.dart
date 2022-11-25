import 'package:flutter/material.dart';
import 'package:reto3/process/autenticacion.dart';
import 'package:reto3/screens/chat.dart';
import 'package:reto3/screens/login.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Chat para familia",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Autenticacion().estadoLogin,
        builder: (context,respuesta){
          if(respuesta.hasData){
            return Chat();
          }
          else{
            return login();
          }
        }
        
    );
  }
}