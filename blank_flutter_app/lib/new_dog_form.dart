// lib/new_dog_form.dart
import 'package:flutter/material.dart';
import 'package:blank_flutter_app/dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => new _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  // One TextEditingController for each form input:
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
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
                    // Tell your textfield which controller it owns
                    controller: nameController, // new
                    // Every single time the text changes in a
                    // TextField, this onChanged callback is called
                    // and it pass in the value
                    onChanged: (v) => nameController.text = v,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Name the Pup',
                    )),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                    controller: locationController, // new
                    // Every single time the text changes in a
                    // TextField, this onChanged callback is called
                    // and it pass in the value
                    onChanged: (v) => locationController.text = v,
                    decoration: new InputDecoration(
                      labelText: "Pups location",
                    )),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                  controller: descriptionController, // new
                  // Every single time the text changes in a
                  // TextField, this onChanged callback is called
                  // and it pass in the value
                  onChanged: (v) => descriptionController.text = v,
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
                      onPressed: () => submitPup(context),
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

  // You'll need the context
  // in order for the Navigator to work.
  void submitPup(context) {
    // first make sure there is some information
    // in the form.
    // A dog needs a name, but may be location independent
    // So we'll only abandon the save if theres no name.
    if (nameController.text.isEmpty) {
      print('Dogs need names!');
    } else {
      // Create a new dog wit hthe information from the form
      var newDog = new Dog(nameController.text, locationController.text,
          descriptionController.text);
      // Pop the page off the route stack
      // and pass the new dog back to wherever this page
      // was created.
      Navigator.of(context).pop(newDog);
    }
  }
}
