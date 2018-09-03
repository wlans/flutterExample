// lib/dog_detail_page.dart
import 'package:flutter/material.dart';
import 'package:blank_flutter_app/dog_model.dart';

// This page needs some dog data, so the class expects a dog.
class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => new _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  // Arbitrary size choice for styles
  double dogAvatarSize = 150.0;
  // The dog image widget.
  Widget get dogImage {
    // Containers define the size of its children
    return new Container(
      height: dogAvatarSize,
      width: dogAvatarSize,
      // Use Box Decoration to make the image a cicle
      // and add a shadow
      // also arbitrary for styling
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        // Like in CSS
        // you often want to add
        // multiple BoxShadows for the right look
        // so the boxShadow property takes a list of
        // BoxShadows
        boxShadow: [
          const BoxShadow(
              // just like CSS:
              // it takes the same 4 properties
              offset: const Offset(1.0, 2.0),
              blurRadius: 2.0,
              spreadRadius: -1.0,
              color: const Color(0x33000000)),
          const BoxShadow(
              offset: const Offset(2.0, 1.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
              color: const Color(0x24000000)),
          const BoxShadow(
              offset: const Offset(3.0, 1.0),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              color: const Color(0x1F000000)),
        ],
        // This is how you add
        // an image to a Container's background
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(widget.dog.imageUrl),
        ),
      ),
    );
  }

  // The rating section
  // That says ★ 10/10
  Widget get rating {
    return new Row(
      // Center the widgets on the main-axis
      // whch is the horizontal axis in a row
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 40.0,
        ),
        new Text(' ${widget.dog.rating} / 10',
            style: Theme.of(context).textTheme.display2),
      ],
    );
  }

  // The widget that displays the image, rating and dog info

  Widget get dogProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
        // This would be a great opportunity to
        // create a custom LinearGradient widget
        // that could be shared throughout the app
        // But I'll leave that to you
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      // The Dog Profile information
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          new Text(
            widget.dog.name + '  🎾',
            style: new TextStyle(fontSize: 32.0),
          ),
          new Text(
            widget.dog.location,
            style: new TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.dog.description),
          ),
          rating
        ],
      ),
    );
  }

  //Finally, the build method:
  //
  // Aside:
  // It's often much easier to build UI
  // If you break up your widgets
  // the way I have in this file
  // rather than trying to have one massive build method
  @override
  Widget build(BuildContext context) {
    // This is a new page, so you need a new Scaffold!
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('Meet ${widget.dog.name}'),
      ),
      body: dogProfile,
    );
  }
}
