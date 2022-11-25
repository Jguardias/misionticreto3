import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reto3/screens/mensajes.dart';
import 'package:reto3/screens/menu.dart';
import '../process/autenticacion.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      drawer: HomeMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
               Container(
              child: Expanded(child: mensajes()
              ),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Escribir Mensaje"),
                    controller: mensaje,
                  ),
                ),
                IconButton(onPressed: (){
                  if(mensaje.text.isNotEmpty){
                fire.collection("Chat").doc().set(
                    {
                      "mensaje":mensaje.text,
                      "tiempo": DateTime.now(),
                      "email": (Autenticacion().usuarios?.email).toString()
                    }
                  );
                  }

                  

                  mensaje.clear();

                }, icon: Icon(Icons.send))
              ],
            ),

          ],
        ),
      ),
    );
  }
}