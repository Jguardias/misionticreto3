import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



FirebaseFirestore db = FirebaseFirestore.instance;


// consulta para la base de datos
Future<List> getpeople()async{
  List people = [];
  CollectionReference collectionReferencePeople = db.collection("Usuario");
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach((element) { 
    people.add(element.data());
  });

  return people;
}



class listaUsuarios extends StatefulWidget {
  const listaUsuarios({super.key});

  @override
  State<listaUsuarios> createState() => _listaUsuariosState();
}

class _listaUsuariosState extends State<listaUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Lista de usuarios"),
        ),

      body: FutureBuilder(
          future:getpeople(),
         
         builder: ((context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context,  index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(snapshot.data?[index]["Correo"],style: TextStyle(color: Colors.black)),
                  trailing: Icon(Icons.person, color: Colors.green),
                ),
              ); 
            },
          );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

         }
         ),  
    ),
    );
  }
}