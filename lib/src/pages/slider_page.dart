import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 300.0;
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            Expanded(child: _crearImagen()),
            _crearCheck(),
            _crearSwitch()
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.pink,
        label: 'tamaño',
        divisions: 4,
        value: _valorSlider,
        min: 0.0,
        max: 300.0,
        onChanged: (_check)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                  print(_valorSlider);
                });
              });
  }

  _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkY_9KpEdHENfHkdHybS8maooOokzL2FT_nw&usqp=CAU'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _crearCheck() {
    // return Checkbox(
    //     value: _check,
    //     onChanged: (opt) {
    //       setState(() {
    //         _check = opt!;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _check,
        onChanged: (opt) {
          setState(() {
            _check = opt!;
          });
        });
  }

  _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _check,
        onChanged: (opt) {
          setState(() {
            _check = opt;
          });
        });
  }
}
