import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:item_builder_gui/raw_data.dart';

bool populatedData = false;

List<String> effectIdsList = [];
List<String> conditionIdsList = [];
List<List<String>> effectIdsListRaw = [];
List<List<String>> conditionIdsListRaw = [];


List<String> stripListData(data) {
  LineSplitter ls = new LineSplitter();
  List<String> lines = ls.convert(data);
  List<String> ret = [];

  for (int i = 0; i < lines.length; i ++) {
    // Grab line
    String d = lines[i];
    // Remove description
    d = d.split(" - ")[0];
    // Remove tabs
    d = d.replaceAll("\t", "");
    // Append
    ret.add(d);
  }
  return ret;
}

void populateData() {
  populatedData = true;
  LineSplitter ls = new LineSplitter();
  List<String> lines = [];

  // Effect Id's
  effectIdsList = stripListData(effectData);

  // Condition Id's
  conditionIdsList = stripListData(conditionData);

  // Effect Value Input Methods
  lines = ls.convert(effectDataRaw);
  for (int i = 0; i < lines.length; i ++) {
    effectIdsListRaw.add(lines[i].split(";"));
  }

  // Condition Value Input Methods
  lines = ls.convert(conditionDataRaw);
  for (int i = 0; i < lines.length; i ++) {
    conditionIdsListRaw.add(lines[i].split(";"));
  }
}


String getEffectIdString(int c) {
  if (!populatedData) {
    populateData();
  }
  return effectIdsList[c];
}

String getConditionIdString(int c) {
  if (!populatedData) {
    populateData();
  }
  return conditionIdsList[c];
}

int getEffectCount() {
  if (!populatedData) {
    populateData();
  }
  return effectIdsList.length;
}

int getConditionCount() {
  if (!populatedData) {
    populateData();
  }
  return conditionIdsList.length;
}


String getEffectValueString(int c, int p) {
  if (!populatedData) {
    populateData();
  }
  return effectIdsListRaw[c][p];
}

String getConditionValueString(int c, int p) {
  if (!populatedData) {
    populateData();
  }
  return conditionIdsListRaw[c][p];
}