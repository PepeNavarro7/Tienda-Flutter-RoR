import 'package:flutter/material.dart';
import 'cesta.dart';

class BarraSuperior extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String titulo;
  final Cesta cesta;
  BarraSuperior(
      this.titulo,
      this.cesta,
      { Key key,}) : preferredSize = Size.fromHeight(50.0),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          children: [
            Text(
              titulo,
              style: TextStyle(color: Colors.yellow),
            ),
            Spacer(),
            FlatButton(
              key: ValueKey("carrito"),
              color: Colors.lightGreen,
              child: Image.asset("fotos/cart.png",width: 50,height: 50),
                onPressed: () {
                  if(this.cesta!=null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => this.cesta),
                    );
                  }
                }
            )
          ],
        ),
    backgroundColor: Colors.lightGreen,
    automaticallyImplyLeading: true,
    );
  }
}

