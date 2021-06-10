
import 'package:ds_p2/main.dart';
import 'package:ds_p2/productosApi.dart';
import 'package:ds_p2/tienda.dart';
import 'package:ds_p2/tiendaApi.dart';
import 'package:ds_p2/usuario.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'barra.dart';
import 'cesta.dart';

class listaTiendas extends StatefulWidget {
  final Cesta cesta;
  const listaTiendas({
    this.cesta,
  });
  @override
  _listaTiendasState createState() => _listaTiendasState(this.cesta);
}


class _listaTiendasState extends State<listaTiendas> {
  final Cesta cesta;
  _listaTiendasState(this.cesta);
  FToast toast = FToast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB8F5E1),
      appBar: BarraSuperior("Tiendas",null),
      body: ListView.builder(
          itemCount: listaGlobalTiendas.length,
          itemBuilder: (context, index) {
            var tienda = listaGlobalTiendas[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  leading: Text(tienda.id.toString()),
                  title: Text(tienda.ubicacion),
                  onTap: (){
                    Cesta.createCesta(tienda_id: tienda.id,cliente_id: usuarioGlobal.ID); // crea en la DB
                    productosApi.creaContiene(Cesta.IDcesta); // crea los contiene
                    cesta.vaciarCesta();
                    toast.init(context);
                    FToast().showToast(
                        child: Text('Compra realizada',
                          style: TextStyle(fontSize: 35, color: Colors.greenAccent),
                        )
                    );
                    Navigator.pushAndRemoveUntil( context, MaterialPageRoute(builder: (context) => ExpositorProductos()), (Route<dynamic> route) => false, );
                  }
                ),
              ),
            );
          }
      ),
    );
  }
}