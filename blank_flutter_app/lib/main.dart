// main.dart
import 'package:flutter/material.dart';
import 'package:blank_flutter_app/dog_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp is the base Widget for your Flutter Application
    /// Gives us access to routing, context, and meta info functionality.
    return new MaterialApp(
      title: 'We Rate Dogs',
      // Make all our text default to white
      // and backgrounds default to dark
      theme: new ThemeData(brightness: Brightness.dark),
      home: new MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /// Scaffold is the base for a page.
    /// It gives an AppBar for the top,
    /// Space for the main body, bottom navigation, and more.
    // this.initialDoggos.forEach((element) => element.getImageUrl());
    // this.initialDoggos.forEach((element) => print(element.imageUrl));
    return new Scaffold(

        /// App bar has a ton of functionality, but for now lets
        /// just give it a color and a title.
        appBar: new AppBar(
          /// Access this widgets properties with 'widget'
          title: new Text(widget.title),
          backgroundColor: Colors.black87,
        ),

        /// Container is a convenience widget that lets us style it's
        /// children. It doesn't take up any space itself, so it
        /// can be used as a placeholder in your code.
        body: new Container());
  }

  var initialDoggos = []
    ..add(new Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(new Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(new Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(new Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(
        new Dog('Buddy', 'North Pole, Earth', 'Self problaimed human lover.'));
}
