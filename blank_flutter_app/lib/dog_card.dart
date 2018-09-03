import 'package:flutter/material.dart';
import 'package:blank_flutter_app/dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => new _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  Dog dog;

  _DogCardState(this.dog);

  @override
  Widget build(BuildContext context) {
    // Start with a container so we can add layout and style props:
    return new Container(
      // Arbitrary number that I decided looked good:
      height: 115.0,
      // A stack takes children, with a list of widgets.
      child: new Stack(
        children: <Widget>[
          // position our dog image, so we can explicitly place it.
          // We'll place it after we've made the card.
          new Positioned(
            child: dogImage,
          ),
        ],
      ),
    );
  }

  // dog_card.dart
  // A class property that represents the URL flutter will render
  // from the Dog class.
  String renderUrl;
  Widget get dogImage {
    var dogAvatar = new Container(
      // you can explicity set heights and widths on Containers.
      // otherwise they take up as much space as their children.
      width: 100.0,
      height: 100.0,
      // decoration is a property that lets you style the container.
      // It expects a BoxDecoration
      decoration: new BoxDecoration(
        // BoxDecorations have many possible properties
        // Using BoxShape with a background image
        // is the easiest way to make a circle cropped avatar style
        // image.
        shape: BoxShape.circle,
        image: new DecorationImage(
          // Just like CSS's `imagesize` property
          fit: BoxFit.cover,
          // A NetworkImage widget is a widget that
          // takes a URL to an image.
          // ImageProviders (such as NetworkImage)
          // are ideal when your image needs to be laoded or can
          // change.
          // Use the null check to avoid an error.
          image: new NetworkImage(renderUrl ?? ''),
        ),
      ),
    );

    return dogAvatar;
  }

  // State classes run this method when the state is created.
  // You shouldn't do async work in initState, so we'll defer it
  // to another method.
  void initState() {
    super.initState();
    renderDogPic();
  }

  // IRL, we'd want the Dog class itself to get the image
  // but this is a simpler way to explain Flutter basics
  void renderDogPic() async {
    // this makes the service call
    await dog.getImageUrl();
    // setState tells Flutter to rerender anything that's been changed.
    // setState cannot be async, so we use a variable that can be overwritten
    setState(() {
      renderUrl = dog.imageUrl;
    });
  }
}
