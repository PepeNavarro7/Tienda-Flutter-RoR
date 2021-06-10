
import 'dart:convert';
import 'package:ds_p2/cesta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:math';

List<productosApi> listaGlobalProductos = [];
List listaGlobalColores = [0xFF3D82AE, 0xFFAEAEAE,0xFFFB7883,0xFFE6B398,0xFF989493,0xFFD3A984];

class productosApi {
  final String imagen, nombre, descripcion;
  final double precio;
  final int id;
  final Color color;

  const productosApi({
    this.id,
    this.imagen,
    this.nombre,
    this.precio,
    this.descripcion,
    this.color,
  });

  static productosApi fromJson(Map<String, dynamic> json) {
    Random random = new Random();
    return new productosApi(
        id: json['id'],
        nombre: json['nombre'],
        precio: num.parse(json['precio']),
        descripcion: json['descripcion'],
        imagen: "fotos/"+json['nombre'].toString().toLowerCase() + ".png",
        color: Color(listaGlobalColores[random.nextInt(listaGlobalColores.length)])
    );
  }

   static void getproductosApi() async { // get
    final response = await http.get(
      Uri.https('clados.ugr.es', '/DS11/api/v1/productos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200){
      var parsedJson = jsonDecode(response.body);
      for (final item in parsedJson) {
        listaGlobalProductos.add( productosApi.fromJson(item) );
      }
    }
    else throw Exception('No se pudo obtener el producto');
  }

  static Future<void> creaContiene(int idCesta) {
    productosEnCesta.forEach((key, value) async {
      final response = await http.post(
        Uri.https('clados.ugr.es', '/DS11/api/v1/contienes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',"Accept":"application/json"
        },
        body: jsonEncode(<String, dynamic>{
          'cantidad': value,
          'cart_id': idCesta,
          'producto_id': key.id,
        }),
      );
      if (response.statusCode == 201){}
      else throw Exception('No se pudo crear el contiene');
    });
  }
}



