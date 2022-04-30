import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text(
              'mostrar alerta',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => _mostrarAlert(context),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: StadiumBorder(),
            ),
          ),
        ));
  }

  void _mostrarAlert(BuildContext context) {
    // clase para crear alertas
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          // esto es un widget AlertDialog
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Eres la verga'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('jiji holas as asaa asasa das qwqwqw qwqw qwqw qwqw qwqw'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
