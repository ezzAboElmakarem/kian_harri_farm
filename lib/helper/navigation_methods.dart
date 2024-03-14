import 'package:flutter/material.dart';

void navigateTo({@required context, @required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateandfinish({@required context, @required widget}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (contex) => widget),
      (route) => false).then((value) {});
}
