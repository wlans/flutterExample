// lib/dog_list.dart
import 'package:flutter/material.dart';
import 'package:blank_flutter_app/dog_card.dart';
import 'package:blank_flutter_app/dog_model.dart';

class DogList extends StatelessWidget {
  // Builder methods rely on a set of data, such as a list.
  final List<Dog> doggos;
  DogList(this.doggos);

  // First, make your build method like normal.
  // instead of returning Widgets, return a method which
  // returns widgets.
  // Don't forget to pass in the context!
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  // A builder method almost always returns a ListView
  // A ListView is a widget similar to Column or Row
  // It knows whether it needs to be scrollable or not
  // It has a constructor called builder, which it knows will
  // work with a List.

  ListView _buildList(context) {
    return new ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: doggos.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return new DogCard(doggos[int]);
      },
    );
  }
}
