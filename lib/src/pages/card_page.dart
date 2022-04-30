import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      // sombra de la tarjeta
      elevation: 10.0,
      // bordes de lar tarjetas
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.accessibility_sharp,
              color: Colors.purpleAccent,
            ),
            title: Text('este es el titutlo'),
            subtitle: Text('loremmmmmmmmmmms asna sasj nasjj '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('cancelar')),
              TextButton(onPressed: () {}, child: Text('ok'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,

      // este es para que respete los bordes de la tarjeta
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      shadowColor: Colors.lightBlue,

      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'http://www.infotigres.com/Imagenes/fotos-de-tigres-grandes.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //     image: NetworkImage(
          //         'http://www.infotigres.com/Imagenes/fotos-de-tigres-grandes.jpg')),
          Container(padding: EdgeInsets.all(10.0), child: Text('hola'))
        ],
      ),
    );
  }
}
