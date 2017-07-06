library itd.flutter.spinner;

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class SpinnerWidget extends StatefulWidget {
  final String message;

  final Widget child;

  final Color messageColor;

  final Color smokeScreenColor;

  SpinnerWidget(this.child, this.message,
      {this.messageColor: const Color(0xFFFFFFFF),
      this.smokeScreenColor: const Color.fromRGBO(0, 0, 0, 0.7)});

  @override
  _State createState() => new _State();
}

class _State extends State<SpinnerWidget> {
  @override
  Widget build(BuildContext context) {
    final stacks = <Widget>[new Positioned.fill(child: widget.child)];

    /// If there is a message, show the message
    if (widget.message is String) {
      stacks.add(new Positioned.fill(
        child: new Container(
            color: widget.smokeScreenColor,
            child: new Center(
                child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Container(margin: new EdgeInsets.only(top: 20.0)),
                new Text(widget.message,
                    style: new TextStyle(
                        color: widget.messageColor, fontSize: 16.0)),
              ],
            ))),
      ));
    }

    return new Stack(children: stacks);
  }
}
