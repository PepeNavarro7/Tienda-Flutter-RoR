import 'dart:convert';
import 'package:ds_p2/barra.dart';
import 'package:ds_p2/tienda.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nombre = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    var response = await http.post(
        Uri.https('clados.ugr.es', '/DS11/api/v1/clientes'),
        headers: {'Content-Type': 'application/json; charset=UTF-8',"Accept":"application/json"},
        body: jsonEncode(<String, dynamic>{
          "nombre": nombre.text,
          "apellidos": apellidos.text,
          "email": email.text,
          "pass": pass.text,
        })
    );

    print('Status code: ${response.statusCode}');
    print(jsonDecode(response.body));
    if (response.statusCode == 201){
      print("Arriba España");
      FToast().showToast(
          child: Text('Registro completo',
              style: TextStyle(fontSize: 25, color: Colors.green))
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpositorProductos(),),);
    }
    else {
      print("Error en el registro");
      FToast().showToast(
          child: Text(
            'El usuario ya existe',
            style: TextStyle(fontSize: 25, color: Colors.red),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraSuperior("Registrarse",null),
      body: Container(
        height: 500,
        child: Card(
          color: Colors.lightGreenAccent,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Registrarse',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: nombre,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Apellidos',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: apellidos,
                    ),
                  ),
                ]
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: pass,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Colors.pink,
                      child: Text('Registrarse',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () {
                        register();
                      },
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.amber[100],
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}