import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:item_builder_gui/raw_data.dart';

bool populatedData = false;

List<String> effectIdsList = [];
List<List<String>> effectIdsListRaw = [];
List<String> conditionIdsList = [];
List<List<String>> conditionIdsListRaw = [];
List<String> potionEffectIdsList = [];
List<String> durationIdsList = [];
List<String> monsterTypeIdsList = [];
List<String> loadableIdsList = [];
List<String> soundIdsList = [];
List<String> resourceIdsList = [];
List<String> equipmentIdsList = [];

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

  // Other Id's
  potionEffectIdsList = stripListData(potionEffectData);
  durationIdsList = stripListData(durationData);
  monsterTypeIdsList = stripListData(monsterTypeData);
  loadableIdsList = stripListData(loadableData);
  soundIdsList = stripListData(soundData);
  resourceIdsList = stripListData(resourceData);
  equipmentIdsList = stripListData(equipmentData);

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

List<String> getPotionEffectIdList() {
  if (!populatedData) {
    populateData();
  }
  return potionEffectIdsList;
}

List<String> getDurationIdList() {
  if (!populatedData) {
    populateData();
  }
  return durationIdsList;
}

List<String> getMonsterTypeIdList() {
  if (!populatedData) {
    populateData();
  }
  return monsterTypeIdsList;
}

List<String> getLoadableIdList() {
  if (!populatedData) {
    populateData();
  }
  return loadableIdsList;
}

List<String> getSoundIdList() {
  if (!populatedData) {
    populateData();
  }
  return soundIdsList;
}

List<String> getResourceIdList() {
  if (!populatedData) {
    populateData();
  }
  return resourceIdsList;
}

List<String> getEquipmentIdList() {
  if (!populatedData) {
    populateData();
  }
  return equipmentIdsList;
}