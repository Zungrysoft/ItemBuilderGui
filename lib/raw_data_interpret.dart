import 'dart:convert';
import 'package:item_builder_gui/raw_data.dart';

List<String> effectIdsList = [];
void populateEffectIdsList() {
  LineSplitter ls = new LineSplitter();
  List<String> lines = ls.convert(effectData);
  for (int i = 0; i < lines.length; i ++) {
    // Grab line
    String d = lines[i];
    // Remove description
    d = d.split(" - ")[0];
    // Remove tabs
    d = d.replaceAll("\t", "");
    // Append
    effectIdsList.add(d);
  }
}

List<String> conditionIdsList = [];
void populateConditionIdsList() {
  LineSplitter ls = new LineSplitter();
  List<String> lines = ls.convert(conditionData);
  for (int i = 0; i < lines.length; i ++) {
    // Grab line
    String d = lines[i];
    // Remove description
    d = d.split(" - ")[0];
    // Remove tabs
    d = d.replaceAll("\t", "");
    // Append
    conditionIdsList.add(d);
  }
}


List<List<String>> effectIdsListRaw = [];
void populateEffectIdsListRaw() {
  LineSplitter ls = new LineSplitter();
  List<String> lines = ls.convert(effectDataRaw);
  for (int i = 0; i < lines.length; i ++) {
    effectIdsListRaw.add(lines[i].split(";"));
  }
}


List<List<String>> conditionIdsListRaw = [];
void populateConditionIdsListRaw() {
  LineSplitter ls = new LineSplitter();
  List<String> lines = ls.convert(conditionDataRaw);
  for (int i = 0; i < lines.length; i ++) {
    conditionIdsListRaw.add(lines[i].split(";"));
  }
}

String getEffectIdString(int c) {
  if (effectIdsList.length == 0) {
    populateEffectIdsList();
  }
  return effectIdsList[c];
}

String getConditionIdString(int c) {
  if (conditionIdsList.length == 0) {
    populateConditionIdsList();
  }
  return conditionIdsList[c];
}

int getEffectCount() {
  if (effectIdsList.length == 0) {
    populateEffectIdsList();
  }
  return effectIdsList.length;
}

int getConditionCount() {
  if (conditionIdsList.length == 0) {
    populateConditionIdsList();
  }
  return conditionIdsList.length;
}


String getEffectValueString(int c, int p) {
  if (effectIdsListRaw.length == 0) {
    populateEffectIdsListRaw();
  }
  return effectIdsListRaw[c][p];
}

String getConditionValueString(int c, int p) {
  if (conditionIdsListRaw.length == 0) {
    populateConditionIdsListRaw();
  }
  return conditionIdsListRaw[c][p];
}