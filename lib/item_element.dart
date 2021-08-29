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

    // Hard-coded special cases
    if (inputType == "duration" && this is Effect && v == 2 && value == 32) {
      inputType = "";
    }
    if (inputType == "duration" && this is Effect && v == 2 && value == 36) {
      name = "Explosion Size";
      inputType = "input";
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
      // Build possibility list
      List<String> possibilityList = [];
      if (inputType == "potion_effect") {
        possibilityList = getPotionEffectIdList();
      }
      if (inputType == "duration") {
        possibilityList = getDurationIdList();
      }
      if (inputType == "monster_type") {
        possibilityList = getMonsterTypeIdList();
      }
      if (inputType == "sound") {
        possibilityList = getSoundIdList();
      }
      if (inputType == "resource") {
        possibilityList = getResourceIdList();
      }
      if (inputType == "equipment") {
        possibilityList = getEquipmentIdList();
      }
      if (inputType == "percentage") {
        possibilityList = ["1%", "5%", "25%"];
      }
      if (inputType == "no_knockback_distance_radius") {
        possibilityList = ["7 Blocks", "15 Blocks", "Unlimited Distance"];
      }
      if (inputType == "dropdown-4") {
        possibilityList = ["1", "2", "3", "4"];
      }
      if (inputType == "chance") {
        possibilityList = ["0.1%", "1%", "5%", "10%", "25%", "33%", "50%"];
      }

      // Make sure value is within the bounds
      if (v == 1) {
        if (value < 1) {
          value = 1;
        }
        else if (value >= possibilityList.length) {
          value = possibilityList.length;
        }
      }
      else {
        if (value2 < 1) {
          value2 = 1;
        }
        else if (value2 >= possibilityList.length) {
          value2 = possibilityList.length;
        }
      }

      // Build List
      rowItems.add(DropdownButton<int>(
        value: v == 1 ? value : value2,
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
            if (v == 1) {
              value = newValue!;
            }
            else if (v == 2) {
              value2 = newValue!;
            }
          });
        },
        items: List<int>.generate(possibilityList.length, (i) => i + 1)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
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