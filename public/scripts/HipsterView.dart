library hipster_view;

import 'dart:html';
import 'dart:json';

import 'HipsterCollection.dart';
import 'HipsterModel.dart';

class HipsterView {
  HipsterCollection collection;
  HipsterModel model;
  Element el;

  HipsterView({el, this.model, this.collection}) {
    this.el = (this.el is Element) ? el : document.query(el);
    this.post_initialize();
  }

  void post_initialize() { }
  // abstract _initialize();

  // delegate events
  attachHandler(parent, event_selector, callback) {
    var index = event_selector.indexOf(' ')
      , event_type = event_selector.substring(0,index)
      , selector = event_selector.substring(index+1);

    parent.on[event_type].add((event) {
      var found = false;
      parent.queryAll(selector).forEach((el) {
        if (el == event.target) found = true;
      });
      if (!found) return;

      print(event.target.parent.id);
      callback(event);

      event.preventDefault();
    });
  }

  // noSuchMethod(name, args) {
  //   print("[noSuchMethod] $name");
  // }
}
