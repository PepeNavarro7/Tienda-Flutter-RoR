import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ds_p2/listaTiendas.dart';
import 'package:ds_p2/productosApi.dart';
import 'package:flutter/material.dart';
import 'barra.dart';
import 'package:http/http.dart';

Map productosEnCesta = Map<productosApi,int>();

class Cesta extends StatefulWidget {
  static int IDcesta;
  void aniadirArticulo(productosApi prod){ // Añadir un articulo a la cesta
    // Se updatea la key prod, si está, hace +1, si no, se añade la key con valor 1
    if(productosEnCesta.containsKey(prod)){
      productosEnCesta[prod]+=1;
    } else{
      productosEnCesta[prod]=1;
    }
  }
  void vaciarCesta(){ // Vacia la cesta entera
    productosEnCesta.clear();
  }
  double calculaCompra(){ // Calcula el precio de la cesta
    double resultado=0.0;
    productosEnCesta.forEach((key, value) {
      resultado+= key.precio * value;
    });
    return resultado;
  }
  static String precioPantalla(productosApi articulo){ // Devuelve el string que se muestra
    String pantalla = articulo.nombre + " ";
    pantalla+= articulo.precio.toString() + "€\n";
    pantalla+= "Cantidad: " + productosEnCesta[articulo].toString() + " -> ";
    pantalla+= (articulo.precio*productosEnCesta[articulo]).toString() + "€";
    return pantalla;
  }
  void borraArticulo(productosApi articulo){ // Reducir en 1 la cantidad de un artículo (y borrarlo, si fuera necesario)
    if (productosEnCesta[articulo] > 1)
      productosEnCesta[articulo]-=1;
    else
      productosEnCesta.remove(articulo);
  }
  int tamanioCesta(){ // Devuelve cuantos articulos hay en la cesta
    int res=0;
    productosEnCesta.forEach((key, value) {
      res+=value;
    });
    return res;
  }

  // post
  static void createCesta({int tienda_id, int cliente_id}) async {
    final response = await http.post(
      Uri.https('clados.ugr.es', '/DS11/api/v1/carts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',"Accept":"application/json"
      },
      body: jsonEncode(<String, dynamic>{
        'fecha': "NULL",
        'cliente_id': cliente_id,
        'tienda_id': tienda_id,
        'recogida': 0
      }),
    );
    if (response.statusCode == 201){
      IDcesta=jsonDecode(response.body)['id'];
    }
    else throw Exception('No se ha creado la cesta');
  }


  @override
  _CestaState createState() => _CestaState(this);
}


class _CestaState extends State<Cesta> {
  final Cesta cesta;
  _CestaState(this.cesta);

  @override
  Widget build(BuildContext context) {
    var listaArticulos = productosEnCesta.keys.toList();
    return Scaffold(
      backgroundColor: Color(0xFFB8F5E1),
      appBar: BarraSuperior("Cesta",null),
      body: ListView.builder(
        itemCount: listaArticulos.length,
        itemBuilder: (context, index) {
          var articulo = listaArticulos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                leading: Image.asset(articulo.imagen),
                title: Text(Cesta.precioPantalla(articulo)),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      cesta.borraArticulo(articulo);
                    }
                    );
                  }
                ),
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.9,
          child: Text(this.cesta.calculaCompra().toString()),
          //child: Icon(Icons.navigate_next_outlined),


        key: ValueKey("botonreserva"),
        onPressed: () {
          if (productosEnCesta.isNotEmpty) {
            Navigator.push(
              context,
                MaterialPageRoute(
                  builder: (context) => listaTiendas(
                      cesta: this.cesta
                  ),
                )
            );
          }
        }
      ),

    );
  }

}