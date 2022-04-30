import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'quinco', 'sies', '7', '7'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hola'),
      ),
      // body: ListView(children: _crearItems()),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> lista = [];

  //   for (String opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text('$opt'),
  //       subtitle: Text('cualquier cosa'),
  //       leading: Icon(Icons.ac_unit_sharp),
  //       trailing: Icon(Icons.access_time_filled_sharp),
  //       onTap: () {},
  //     );
  //     lista..add(tempWidget)..add(Divider());
  //   }
  //   return lista;
  // }

  List<Widget> _crearItemsCorta() {
    var listaas = opciones.map((e) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e),
            subtitle: Text('cosas'),
            leading: Icon(Icons.no_drinks),
            trailing: Icon(Icons.account_balance_wallet_outlined),
            onTap: () => null,
          ),
          Divider(
            color: Colors.deepPurple,
            height: (10.0),
          )
        ],
      );
    }).toList();
    return listaas;
  }
}
