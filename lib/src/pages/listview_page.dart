import 'package:flutter/material.dart';
import 'dart:async';

class ListviewPage extends StatefulWidget {
  const ListviewPage({Key? key}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoNumero = 0;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar5();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar5();
        // print('me agrege');
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listas'),
      ),
      body: Stack(
        children: [_crearLista(), _crearLoading()],
      ),
    );
  }

  _crearLista() {
    // se renderisa conforme sea necesario traer la informacion
    // el bilder es la forma de como se va dibujar el widget
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300/?images=$imagen'));
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      // purgar la lista borrar todo su contenido
      _listaNumeros.clear();
      _ultimoNumero++;
      _agregar5();
    });
    return Future.delayed(duration);
  }

  void _agregar5() {
    for (var i = 0; i < 5; i++) {
      setState(() {
        _ultimoNumero++;
        _listaNumeros.add(_ultimoNumero);
      });
    }
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duracion = Duration(seconds: 2);
    return new Timer(duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _agregar5();
  }

  _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
