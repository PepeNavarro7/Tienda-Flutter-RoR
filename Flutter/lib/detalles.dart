import 'package:ds_p2/productosApi.dart';
import 'package:flutter/material.dart';
import 'barra.dart';
import 'cesta.dart';

class DetallesArticulo extends StatelessWidget { // Pantalla con los detalles de un articulo
  final productosApi producto;
  final Cesta cesta;

  const DetallesArticulo({
    Key key,
    this.producto,
    this.cesta
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB8F5E1),
      appBar: BarraSuperior(producto.nombre,this.cesta),
      body: Center(
        child: ListView(
          children:[
            Image.asset(producto.imagen),
            Container(
              child:Text(
                  "DESCRIPCION",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.only(top: 20,right: 20,left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child:Text(
                  producto.descripcion,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Karla'
                  )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20,left:30),
                  padding: EdgeInsets.only(top: 20),
                  child:Text(producto.precio.toString()+"€",
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Karla',
                        fontSize: 30.0,
                    ),
                  ),
                ),
                new RaisedButton(
                    padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
                    color: Color(0xFFD353B33F),
                    textColor: Colors.white,
                    child: Text(
                      "Añadir al carrito",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                        cesta.aniadirArticulo(producto);
                    }),

              ],
            )
          ],
        ),
      ),
      //body: Body(product: product),
    );
  }
}

