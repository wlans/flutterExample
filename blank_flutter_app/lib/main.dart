// main.dart
import 'package:flutter/material.dart';
import 'package:blank_flutter_app/dog_model.dart';
import 'package:blank_flutter_app/dog_list.dart';
import 'package:blank_flutter_app/new_dog_form.dart';
import 'dart:async';

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
          backgroundColor: Colors.blue,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: _showNewDogForm,
            )
          ],
        ),

        /// Container is a convenience widget that lets us style it's
        /// children. It doesn't take up any space itself, so it
        /// can be used as a placeholder in your code.
        body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.6, 0.9],
              colors: [
                Colors.indigo[800],
                Colors.indigo[200],
                Colors.indigo[600],
                Colors.indigo[400],
              ],
            ),
          ),
          child: new DogList(dogs),
        ));
  }

  // Any time you're pushing a new route and expect that route
  // To return something back to you,
  // You need to use an async function
  // In this case, the this function will create a form page
  // Which the user can fill out, and submit
  // And on submission, the information in that form page
  // will be passed back to this function
  //
  Future<Null> _showNewDogForm() async {
    // push a new route like you did in the last section
    var newDog = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new AddDogFormPage();
        },
      ),
    );
    // A null check, to make sure that the user
    // didn't abandon the form
    //
    if (newDog != null) {
      // Add a newDog to our mock dog array.
      dogs.add(newDog);
    }
  }

  var dogs = <Dog>[]
    ..add(new Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(new Dog('Buckley', 'Austin, TX, USA', 'Best in Show 1999'))
    ..add(new Dog('Rod Stewart', 'Dublin, Ireland',
        'Star good boy on international snooze team.'))
    ..add(new Dog('Hailey', 'Austin, TX, USA', 'A Very Good Boy'))
    ..add(
        new Dog('Buddy', 'North Pole, Earth', 'Self problaimed human lover.'));
}
