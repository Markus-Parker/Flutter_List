import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebridades de internet',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Celebridades de internet',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Oscar la Oveja', 'Rancho de Claudio',
        'Una oveja con bufanda, nada mas que decir', '0'))
    ..add(Dog('El Pepe', 'La casa de Pepe', 'Se enfada cuando dicen su nombre', '1'))
    ..add(Dog('Sech', 'Brasil', 'Etee Sech', '2'))
    ..add(Dog('RovisRon', 'Barcelona', 'Famoso streamer y creador de contenido que ya ha llegado a los 600 suscriptores', '3'))
    ..add(Dog('Ericland', 'Calafell', 'Jugador experto de Lux, no se le ve mucho', '4'))
    ..add(Dog('Nadie', 'Turquia', 'Ex Luchador de boxeo, le gusta el barça', '5'))
    ..add(Dog('Yayo', 'Barcelona', 'Venir, venir a por mi, hijos de p***, venir a daros de ostias conmigo', '6'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/2b/69/c6/2b69c6f8b029c5de2a70d636f027865c.jpg"),
                  fit: BoxFit.cover)),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
