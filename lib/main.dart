import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Weather application'),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Text('Kharkiv', style: new TextStyle(color: Colors.white)),
                  Text('Sunny',
                      style:
                          new TextStyle(color: Colors.white, fontSize: 32.0)),
                  Text('2°C', style: new TextStyle(color: Colors.white)),
                  Image.network('https://openweathermap.org/img/w/04d.png'),
                  Text('Fabruary 18, 2020',
                      style: new TextStyle(color: Colors.white)),
                  Text('11:30', style: new TextStyle(color: Colors.white))
                ])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: new Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () => null,
                color: Colors.white,
              ),
            )
          ],
        )),
      ),
    );
  }
}
