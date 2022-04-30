import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String dropdownValue = "volas";
  List<String> _poderes = ['volas', 'correr', 'nadar'];

  TextEditingController _controladorFecha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('input'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
        ],
      ),
    );
  }

  _crearInput() {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Nombre',
        hintText: 'nombre de la persona',
        helperText: 'solo nombre',
        counter: Text('letras ${_nombre.length}'),
        suffixIcon: Icon(Icons.people),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        // esto es para redibujar todo en tiempo real
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Email',
        hintText: 'nombre de tu email',
        helperText: 'solo Email',
        counter: Text('email'),
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        // esto es para redibujar todo en tiempo real
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Password',
        hintText: 'Password',
        helperText: 'solo Password',
        counter: Text('Password2'),
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        // esto es para redibujar todo en tiempo real
        setState(() {
          _password = valor;
        });
      },
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      controller: _controladorFecha,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Fecha',
        hintText: 'Fecha',
        helperText: 'solo Fecha',
        counter: Text('Password2'),
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectData(context);
      },
    );
  }

  void _selectData(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _controladorFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((element) {
      lista.add(DropdownMenuItem<String>(
        value: element,
        child: Text(element),
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return DropdownButton<String>(
      value: dropdownValue,
      items: getOpcionesDropdown(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }
}
