import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario{
  String nombre, apellidos, email, pass;
  int ID;
  Usuario({
    this.nombre,
    this.apellidos,
    this.email,
    this.pass,
    this.ID
  });
}