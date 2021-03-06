library models;

import 'package:polymer/polymer.dart'
show ObservableMixin, observable, bindProperty, notifyProperty;

/// The Item class represents an item in the Todo list.
class Item extends Object with ObservableMixin {
  @observable String text = '';
  @observable bool done = false;

  Item({this.text: '', this.done: false}) {
    // Monitor the done boolean to add/remove done class.
    bindProperty(this, const Symbol('done'),
        () => notifyProperty(this, const Symbol('doneClass')));
  }

  // Check if item text is empty.
  bool get isEmpty => text.isEmpty;

  // Apply a done class for completed items.
  String get doneClass => done ? 'done' : '';
}