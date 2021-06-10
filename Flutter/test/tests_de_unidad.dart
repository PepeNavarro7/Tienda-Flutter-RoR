// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:ds_p2/cesta.dart';
import 'package:ds_p2/tiendaApi.dart';
import 'package:ds_p2/productosApi.dart';

void main() {

  group ('Practica4TestUnidad', ()
  {
    final cesta = new Cesta();

    // Producto: Aguacate Precio: 0.39
    productosApi p1=productosApi(
        id: 6,
        nombre: "Berenjenas",
        precio: 0.89,
        descripcion: 'Hola',
        imagen: "fotos/berenjenas.png",
        color: Color(0xFF3D82AE)
    );

    // Producto: Cereales Precio: 1.69
    productosApi p2=productosApi(
        id: 5,
        nombre: "Patatas",
        precio: 1.27,
        descripcion: 'Hola',
        imagen: "fotos/patatas.png",
        color: Color(0xFF3D82AE)
    );

    test('El valor inicial debe ser 0 ', () {
      expect(cesta.tamanioCesta(), 0);
    });

    test('El total de productos debe de ser 1', () {
      cesta.aniadirArticulo(p1);
      expect(cesta.tamanioCesta(), 1);
    });

    test('El total de productos actual es 3, al eliminar uno el resultado debe ser 2', () {
      cesta.aniadirArticulo(p2);
      cesta.aniadirArticulo(p1);
      cesta.borraArticulo(p1);
      expect(cesta.tamanioCesta(), 2);
    });

    test('En la cesta hay 2 articulos que valen ', () {
      expect(cesta.calculaCompra(), 2.16);
    });

    test('Esperamos un aguacate con su cantidad y su precio en la cesta', () {
      expect(Cesta.precioPantalla(p1), 'Berenjenas 0.89€\nCantidad: 1 -> 0.89€');
    });

    test('En el momento de la prueba hay 4 tiendas en la base de datos', () {
      tiendasApi.getTiendasApi();
      expect(listaGlobalTiendas.length, 4);
    });
  });

  /*
  group('Producto',() {
    Producto pro=Producto(
        id: 6,
        nombre: "Cosa",
        precio: 0.89,
        descripcion: textoEjemplo,
        imagen: "fotos/berenjenas.png",
        color: Color(0xFF3D82AE)
    );
    test('El valor debe ser el nombre del producto',(){
      Producto.aniadirProductoLista(pro);
      expect(listaGlobalProductos[listaGlobalProductos.length-1].nombre,pro.nombre);
    });
    test('El valor debe ser el nuevo tamaño de la lista',(){
      Producto.eliminarProductoLista(pro);
      expect(listaGlobalProductos.length,6);
    });
    test('El valor debe ser el nuevo tamaño de la lista',(){
      Producto aux=Producto(
          id: 6,
          nombre: "Cosa Nueva",
          precio: 0.89,
          descripcion: textoEjemplo,
          imagen: "fotos/berenjenas.png",
          color: Color(0xFF3D82AE)
      );
      Producto.editarProductoLista(3,aux);
      expect(listaGlobalProductos[3].nombre,aux.nombre);
    });
  });
  group('Cesta',() {
    final Cesta cesta = new Cesta();
    test('La cesta debería empezar vacía',() {
      expect(cesta.tamanioCesta(),0);
    });
    test('Añadir y eliminar 1 unidad de producto de la cesta',() {
      cesta.aniadirArticulo(listaGlobalProductos[0]);
      cesta.aniadirArticulo(listaGlobalProductos[0]);
      cesta.borraArticulo(listaGlobalProductos[0]);
      expect(cesta.tamanioCesta(),1);
    });
    test('Calcular el precio final',() {
      cesta.aniadirArticulo(listaGlobalProductos[1]);
      double res=listaGlobalProductos[0].precio+listaGlobalProductos[1].precio;//2.08
      expect(cesta.calculaCompra(),res);
    });
  });*/
}
