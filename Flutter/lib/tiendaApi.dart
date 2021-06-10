
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:math';


class tiendasApi {
  final id;
  final ubicacion;

  tiendasApi({this.id=0,this.ubicacion=""});


  static tiendasApi fromJson(Map<String, dynamic> json) {
    return (new tiendasApi(
        id: json['id'],
        ubicacion: json['ubicacion'],
    ));
  }

  //////////// get //////////////////
  static void getTiendasApi() async {
    final response = await http.get(
        Uri.https('clados.ugr.es', '/DS11/api/v1/tiendas'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',"Accept":"application/json"
        }
    );
    if (response.statusCode == 200){
      var parsedJson = jsonDecode(response.body);
      for (final item in parsedJson) {
        listaGlobalTiendas.add(fromJson(item));
      }
    }
    else throw Exception('Failed to get project');
  }

}

List<tiendasApi> listaGlobalTiendas = [];