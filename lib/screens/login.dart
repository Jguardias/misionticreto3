import 'package:flutter/material.dart';
import 'package:reto3/process/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final email = TextEditingController();
final password = TextEditingController();


class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login y Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image(image: NetworkImage("https://cryptologos.cc/logos/chatcoin-chat-logo.png")),
            ),

            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Email", suffixIcon: Icon(Icons.email))),
             
              TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password", suffixIcon: Icon(Icons.key)),),
             
              SizedBox(height: 10,),


              ElevatedButton.icon(onPressed: (){

                Autenticacion().IniciarSesion(email: email.text, password: password.text);
                email.clear();
                password.clear();
              }, icon: Icon(Icons.login), label: Text("Iniciar Sesión"),),
              
              SizedBox(height: 10,),

               ElevatedButton.icon(onPressed: (){
                Autenticacion().CrearUsuario(email: email.text, password: password.text);
                 email.clear();
                 password.clear();
                 
               }, icon: Icon(Icons.person_add), label: Text("Registrarse    "),),
          ],

        ),
      )
    );
  }
}