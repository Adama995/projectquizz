import 'package:flutter/material.dart';

class TextUtils extends Text{

  TextUtils(String text, {color: Colors.white, textScalefactor: 1.0}):
      super(
        text,
        textScaleFactor: textScalefactor,
        textAlign: TextAlign.center,
        style: new TextStyle(color: color)
      );
}


