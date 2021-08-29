import 'package:flutter/material.dart';

String removeTrailingComma(s) {
  if (s[s.length-1] == ",") {
    s = s.substring(0, s.length - 1);
  }
  return s;
}

String pad(c) {
  String ret = "";
  for (int i = 0; i < c; i ++) {
    ret += "    ";
  }
  return ret;
}

TextStyle treeStyle = TextStyle(fontSize: 20);
