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

  // This is the starting value of the slider.
  double _sliderValue = 10.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // In a row, column, listview etc
              // A Flexible Widget is a wrapper
              // That works much like CSS's flex-grow property
              //
              // Any room left over in in the main axis after
              // the Widgets are given their width (in this case,
              // because its a row) -
              // will be distributed to all the flexible widgets
              // at a ratio based on the flex property you pass in
              // Because this is the only Flexible,
              // It will take up *all** the extra space
              //
              // Or in other words, it will expand as much as it can until
              // the all the space is taken up
              new Flexible(
                flex: 1,

                // A slider, like many form elements,
                // Needs to know its own value
                // and how to update it's value
                //
                // The slider will call the `onChanged` whenever
                // it changes. But it will only repaint
                // when it's value property changes in the state
                // using 'setState'
                //
                // The workflow is:
                // 1. User drags the slider
                // 2. onChanged is called
                // 3. the callback in onChanged set 'sliderValue' state
                // 4. Flutter repaints everything that relies on 'sliderValue'
                // 5. In this case, just the slider, which is at it's new value
                //
                child: new Slider(
                  onChanged: (newRating) {
                    setState(() => _sliderValue = newRating);
                  },
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 15.0,
                  value: _sliderValue,
                ),
              ),

              // This is the part that displates the value
              // of the slider
              // The width is an arbitrary size that
              // I chose for styles
              new Container(
                width: 50.0,
                alignment: Alignment.center,
                child: new Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        // This widget is built below:
        submitRatingButton,
      ],
    );
  }

  // In the next section you'll add error handling.
  // For now this is all it does.
  void updateRating() {
    setState(() => widget.dog.rating = _sliderValue.toInt());
  }

  // A simple Raised Buttonw
  // That as of now doesn't do anything but print
  //
  Widget get submitRatingButton {
    return new RaisedButton(
      onPressed: () => updateRating(),
      child: new Text('Submit'),
      color: Colors.indigoAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('Meet ${widget.dog.name}'),
      ),
      // Make the body a ListView that displays
      // both the profile and the rating form
      //
      body: new ListView(
        // updated
        children: <Widget>[dogProfile, addYourRating],
      ),
    );
  }
}
