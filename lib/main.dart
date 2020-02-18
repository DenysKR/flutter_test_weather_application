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
              child: Column(children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Kharkiv',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 32.0)),
                        Padding(padding: EdgeInsets.only(top: 30.0)),
                        Text('Sunny',
                            style: new TextStyle(color: Colors.white)),
                        Padding(padding: EdgeInsets.only(top: 30.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                                'https://openweathermap.org/img/w/04d.png'),
                            Text('2°C',
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 52.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 30.0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200.0,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Fabruary 18, 2020',
                                      style:
                                          new TextStyle(color: Colors.white)),
                                  Text('11:30',
                                      style:
                                          new TextStyle(color: Colors.white)),
                                  Image.network(
                                      'https://openweathermap.org/img/w/04d.png'),
                                  Text('2°C',
                                      style:
                                          new TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            )
          ]))),
    );
  }
}
