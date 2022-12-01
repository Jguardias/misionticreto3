import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto3/process/autenticacion.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});
  
  @override
  Widget build(BuildContext context) {
  
    return Container(
      child: Drawer(
        child: Column(
            children: [

            //diseño de un header una fotico aqui jajaj  
              DrawerHeader(
                decoration: BoxDecoration(
                  color:Color(0xFF1872DF),
                  
                ),
                child: Stack(
                    children: <Widget> [
                     //imagen
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                        ),
                      ),
                    // textos
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          (Autenticacion().usuarios?.email).toString(),
                          style: TextStyle(color:Colors.white,fontSize: 13),
                        ),
                      ),
                      //
                      Align(
                        alignment: Alignment.centerRight + Alignment(0, .3),
                        child: Text(
                          "Correo electronico",
                          style: TextStyle(color:Colors.white,fontSize: 12),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight + Alignment(0, .8),
                        
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "Verificado",
                              style: TextStyle(color:Colors.white,fontSize: 12),
                            ),
                          ),
                        ),
                      ),

                    ],

                ),
              ),
            
           
           //Diseño de las opciones del menu y sus rutas. 
            ListTile(
           //   leading: Icon(Icons.person),
              title: Text("Información personal"),
              trailing: Icon(Icons.person),
       //       onTap: () {Get.toNamed("/");},
            ),
            ListTile(
            //  leading: Icon(Icons.attach_money_rounded),
              title: Text("Cerrar sesión"),
              trailing: Icon(Icons.logout),
              onTap: () {
                Autenticacion().CerrarSesion();
              },
            ),


           
           
           
           
           
           
           
            ],
        ),
      ),
    );
  }
}