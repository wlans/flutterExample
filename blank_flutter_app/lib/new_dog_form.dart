// lib/new_dog_form.dart
import 'package:flutter/material.dart';
import 'package:blank_flutter_app/dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => new _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: new Container(
        color: Colors.black54,
        child: new Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: new Column(
            children: [
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                // Text Field is the basic input widget for Flutter
                // It comes built in with a ton of great
                // UI and functionality, such as the
                // labelText field you see below
                child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Name the Pup',
                    )),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                    decoration: new InputDecoration(
                  labelText: "Pups location",
                )),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    labelText: 'All about the pup',
                  ),
                ),
              ),
              // A Strange situation.
              // A piece of the app that you'll add inthe next
              // section *needs* to know it's context,
              // And the easiest way to pass a context is to
              // use a builder method. So I've wrapped
              // this button in a Builder as a sort of 'hack'
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Builder(
                  builder: (context) {
                    // The basic Material Design action button
                    return new RaisedButton(
                      // if onPressed is null, the button is disabled
                      // this is my goto temporary callback
                      onPressed: () => print('PRESSED'),
                      color: Colors.indigoAccent,
                      child: new Text('Submit Pup'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
