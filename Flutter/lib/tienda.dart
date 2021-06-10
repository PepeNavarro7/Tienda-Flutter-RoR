//import 'dart:html';

import 'package:flutter/material.dart';
import 'barra.dart';
import 'detalles.dart';
import 'cesta.dart';
import 'package:ds_p2/productosApi.dart';

class ExpositorProductos extends StatelessWidget {
  final Cesta cesta = new Cesta(); // Se crea por primera (y unica) vez la cesta, que será pasada en la barra
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB8F5E1),
      appBar: BarraSuperior("DANI",this.cesta),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  20.0),
            child: Text("",
              style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded( // Se colocan los productos
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  20.0),
              child: GridView.builder(
                  itemCount: listaGlobalProductos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing:  20.0,
                    crossAxisSpacing:  20.0,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => RecuadroProducto( // Se crean los recuadros, que on press, llevan a detallesArticulo
                    producto: listaGlobalProductos[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetallesArticulo(
                              producto: listaGlobalProductos[index],
                              cesta: this.cesta
                          ),
                        )
                    ),
                    cesta: cesta,
                  )
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class RecuadroProducto extends StatelessWidget { // Recuadros de los productos en la pantalla principal
  final productosApi producto;
  final Function press;
  final Cesta cesta;
  const RecuadroProducto({
    Key key,
    this.producto,
    this.press,
    this.cesta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: producto.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${producto.id}",
                child: Image.asset(producto.imagen),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0 / 4),
            child: Text(
              producto.nombre,
              style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
            ),
          ),
          Text(
            "${producto.precio}\€",
            style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.none, color: Colors.redAccent),
          )
        ],
      ),
    );
  }
}







