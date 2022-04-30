import 'package:componentes/src/pages/avatar_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/manu_provider.dart';
import 'package:componentes/src/utils/icons.dart';
// import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('componentes'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      // sirve para mostrar algo mientras trae los datos
      initialData: [],
      // esto se dispara cuando se esta pidiendo la data , esta cargado o un error
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print(snapshot.hasData
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    data?.forEach((element) {
      final temp = ListTile(
          title: Text(element['texto']),
          subtitle: Text(element['sub']),
          leading: getIcon(element['icon']),
          onTap: () {
            Navigator.pushNamed(context, element['ruta']);
            // final route = MaterialPageRoute(builder: (context) {
            //   return AvatarPage();
            // });
            // Navigator.push(context, route);
          });
      opciones..add(temp)..add(Divider());
    });
    return opciones;
  }
}
