import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:item_builder_gui/raw_data_interpret.dart';
import 'helpers.dart';
import 'item_element.dart';

class Effect extends ItemElement {
  bool noSound = false;

  Effect([int i = 0, int v = 0, int v2 = 0, bool n = false]) {
    id = i;
    value = v;
    value2 = v2;
    noSound = n;
  }

  String parseToNbt() {
    String ret = "{";
    // Id
    ret += "Id:${id},";
    // Value
    if (value != 0) {
      ret += "Value:${value},";
    }
    // Value2
    if (value2 != 0) {
      ret += "Value2:${value2},";
    }
    // NoSound
    if (noSound == true) {
      ret += "NoSound:1,";
    }

    ret = removeTrailingComma(ret);

    ret += "}";

    return ret;
  }

  List<Widget> parseToScaffold(home, int depth) {
    List<Widget> list = [];
    // Id
    list.add(Row(children: <Widget>[
      Text(pad(depth) + "Id: ", style: treeStyle),
      DropdownButton<int>(
        value: id,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(
            color: Colors.deepPurple
        ),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (int? newValue) {
          home.setState(() {
            id = newValue!;
          });
        },
        items: List<int>.generate(getEffectCount(), (i) => i + 1)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value-1,
            child: Text(getEffectIdString(value-1)),
          );
        })
            .toList(),
      ),
    ]));
    // Value
    list.add(valueInput(home, depth, 1));
    // Value2
    list.add(valueInput(home, depth, 2));
    // NoSound
    list.add(Row(children: <Widget>[
      Text(pad(depth) + "Disable Sounds: ", style: treeStyle),
      Checkbox(
        checkColor: Colors.white,
        value: noSound,
        onChanged: (bool? value) {
          home.setState(() {
            noSound = value!;
          });
        },
      ),
    ]));

    return list;
  }
}





