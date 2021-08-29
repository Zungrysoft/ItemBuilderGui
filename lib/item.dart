import 'package:flutter/material.dart';
import "condition.dart";
import 'helpers.dart';

class Item {
  String itemType = "minecraft:stone_sword";
  String actType = "Mainhand";
  bool showGive = true;
  Condition base = new Condition();

  TextEditingController controller = TextEditingController(text: "minecraft:stone_sword");

  String parseToNbt() {
    if (showGive) {
      return("/give @p ${itemType}{ItemBuilder${actType}:${base.parseToNbt(true)}}");
    }
    else {
      return("ItemBuilder${actType}:${base.parseToNbt(true)}");
    }
  }

  List<Widget> parseToScaffold(home) {
    List<Widget> list = [];
    list.add(Row(children: <Widget>[
      Text("Item: ", style: treeStyle),
      Container(
        width: 300,
        child: TextField(
          autofocus: true,
          maxLines: 1,
          cursorColor: Colors.blue,
          controller: controller,
          style: TextStyle(fontSize: 20),
          onChanged: (newValue) {
            home.setState(() {
              itemType = newValue;
            });
          },
        ),
      ),
      Checkbox(
        checkColor: Colors.white,
        value: showGive,
        onChanged: (bool? value) {
          home.setState(() {
            showGive = value!;
          });
        },
      ),
    ]));
    list.add(Row(children: <Widget>[
      Text("Activator Type: ", style: treeStyle),
      DropdownButton<String>(
        value: actType,
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
        onChanged: (String? newValue) {
          home.setState(() {
            actType = newValue!;
          });
        },
        items: <String>['Mainhand', 'Offhand', 'EitherHand', 'Armor']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
            .toList(),
      ),
    ]));
    list += base.parseToScaffold(home, 0);

    return list;
  }
}


