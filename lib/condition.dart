import 'package:flutter/material.dart';
import 'package:item_builder_gui/raw_data_interpret.dart';
import "effect.dart";
import 'helpers.dart';
import 'item_element.dart';

class Condition extends ItemElement {
  bool inverted = false;
  List<Condition> conditions = [];
  List<Effect> effects = [];

  Condition([int i = 0, int v = 0, int v2 = 0, bool inv = false]) {
    id = i;
    value = v;
    value2 = v2;
    inverted = inv;
  }

  String parseToNbt([bool isBase=false]) {
    String ret = "{";
    // Condition Id's and Values
    // Skips if this is the base condition
    if (isBase == false) {
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
      // Inverted
      if (inverted) {
        ret += "Inverted:1,";
      }
    }
    // Effects
    if (effects.length > 0) {
      ret += "Effects:[";
      // Go through each effect
      effects.forEach((e) =>
          ret += "${e.parseToNbt()},"
      );
      ret = removeTrailingComma(ret);
      ret += "],";
    }
    // Conditions
    if (conditions.length > 0) {
      ret += "Conditions:[";
      // Go through each condition
      conditions.forEach((e) =>
      ret += "${e.parseToNbt()},"
      );
      ret = removeTrailingComma(ret);
      ret += "],";
    }

    ret = removeTrailingComma(ret);

    ret += "}";

    return ret;
  }

  List<Widget> parseToScaffold(home, int depth) {
    List<Widget> list = [];
    if (depth != 0) {
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
          items: List<int>.generate(getConditionCount(), (i) => i + 1)
              .map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value-1,
              child: Text(getConditionIdString(value-1)),
            );
          })
              .toList(),
        ),
      ]));
      // Value
      list.add(valueInput(home, depth, 1));
      // Value2
      list.add(valueInput(home, depth, 2));
      // Inverted
      list.add(Row(children: <Widget>[
        Text(pad(depth) + "Inverted: ", style: treeStyle),
        Checkbox(
          checkColor: Colors.white,
          value: inverted,
          onChanged: (bool? value) {
            home.setState(() {
              inverted = value!;
            });
          },
        ),
      ]));
    }


    // Effects
    // Opening bracket
    list.add(Row(children: <Widget>[
      Text(pad(depth) + (effects.length > 0 ? "Effects:[" : "Effects:[]"), style: treeStyle),
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Add Effect',
        onPressed: () {
          home.setState(() {
            effects.add(new Effect());
          });
        },
      ),
    ]));
    // List of effects
    for (int i = 0; i < effects.length; i ++) {
      // Opening bracket
      list.add(Row(children: <Widget>[
        Text(pad(depth+1) + "{", style: treeStyle),
        IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Remove Effect',
          onPressed: () {
            home.setState(() {
              effects.removeAt(i);
            });
          },
        ),
      ]));
      // Effect data
      list += effects[i].parseToScaffold(home, depth+2);
      // Closing bracket
      list.add(Row(children: <Widget>[
        Text(pad(depth+1) + "}", style: treeStyle),
      ]));
    }
    // Closing bracket
    if (effects.length > 0) {
      list.add(Row(children: <Widget>[
      Text(pad(depth) + "]", style: treeStyle),
      ]));
    }


    // Conditions
    // Opening bracket
    list.add(Row(children: <Widget>[
      Text(pad(depth) + (conditions.length > 0 ? "Conditions:[" : "Conditions:[]"), style: treeStyle),
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Add Condition',
        onPressed: () {
          home.setState(() {
            conditions.add(new Condition());
          });
        },
      ),
    ]));
    // List of conditions
    for (int i = 0; i < conditions.length; i ++) {
      // Opening bracket
      list.add(Row(children: <Widget>[
        Text(pad(depth+1) + "{", style: treeStyle),
        IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Remove Condition',
          onPressed: () {
            home.setState(() {
              conditions.removeAt(i);
            });
          },
        ),
      ]));
      // Effect data
      list += conditions[i].parseToScaffold(home, depth+2);
      // Closing bracket
      list.add(Row(children: <Widget>[
        Text(pad(depth+1) + "}", style: treeStyle),
      ]));
    }
    // Closing bracket
    if (conditions.length > 0) {
      list.add(Row(children: <Widget>[
        Text(pad(depth) + "]", style: treeStyle),
      ]));
    }

    return list;
  }
}


