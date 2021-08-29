import 'package:flutter/material.dart';
import 'effect.dart';
import 'condition.dart';
import 'helpers.dart';
import 'raw_data_interpret.dart';

abstract class ItemElement {
  int id = 0;
  int value = 0;
  int value2 = 0;

  TextEditingController controller = TextEditingController(text: "0");
  TextEditingController controller2 = TextEditingController(text: "0");

  Widget valueInput(home, int depth, int v) {
    List<Widget> rowItems = [];
    // Determine the name and input type
    String name = "Value";
    String inputType = "";
    TextEditingController con = controller;
    if (v == 1 && this is Effect) {
      name = getEffectValueString(id, 0);
      inputType = getEffectValueString(id, 1);
    }
    else if (v == 1 && this is Condition) {
      name = getConditionValueString(id, 0);
      inputType = getConditionValueString(id, 1);
    }
    else if (v == 2 && this is Effect) {
      name = getEffectValueString(id, 2);
      inputType = getEffectValueString(id, 3);
      con = controller2;
    }
    else if (v == 2 && this is Condition) {
      name = getConditionValueString(id, 2);
      inputType = getConditionValueString(id, 3);
      con = controller2;
    }

    // Special case: no value exists
    if (inputType == "") {
      if (v == 1) {
        value = 0;
        controller.value = TextEditingValue(text: "0");
      }
      else if (v == 2) {
        value2 = 0;
        controller2.value = TextEditingValue(text: "0");
      }
      return SizedBox.shrink();
    }

    // Add name string
    rowItems.add(Text(pad(depth) + name + ": ", style: treeStyle));

    // Input method
    // Text input
    if (inputType == "input") {
      rowItems.add(Container(
        width: 300,
        child: TextField(
          autofocus: true,
          maxLines: 1,
          cursorColor: Colors.blue,
          focusNode:  FocusNode(),
          controller: con,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 20),
          onChanged: (newValue) {
            home.setState(() {
              if (v == 1) {
                value = int.parse(newValue);
              }
              else if (v == 2) {
                value2 = int.parse(newValue);
              }
            });
          },
        ),
      ));
    }
    // Dropdown lists
    else {
      List<String> possibilityList = [];
      rowItems.add(DropdownButton<int>(
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
        items: List<int>.generate(possibilityList.length, (i) => i + 1)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value-1,
            child: Text(possibilityList[value-1]),
          );
        })
            .toList(),
      ));
    }


    // Return
    return Row(children: rowItems);
  }
}