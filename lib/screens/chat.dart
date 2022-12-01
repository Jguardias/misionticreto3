import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reto3/screens/listaUsuarios.dart';
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
  final FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions:<Widget> [
          IconButton(icon: Icon(Icons.person),onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) => listaUsuarios()),
           ),)
        ],
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
                    focusNode: myFocusNode,
                    decoration: InputDecoration(hintText: "Escribir Mensaje"),
                    controller: mensaje,
                    onSubmitted: (valor){
                     mensaje.text = valor;
                      if(mensaje.text.isEmpty){
                      myFocusNode.requestFocus();
                      
                     fire.collection("Chat").doc().set(
                    {
                      "mensaje":mensaje.text,
                      "tiempo": DateTime.now(),
                      "email": (Autenticacion().usuarios?.email).toString()
                    });
                    
                  mensaje.clear();
                    }
                    },
                  )
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