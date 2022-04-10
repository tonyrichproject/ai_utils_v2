import 'package:ai_base_class_v2/ai_base_class_v2.dart';

import '../models/ai_base_model.dart';

bool assigned(dynamic aObject) => (aObject != null) ? true : false;
bool isAvailable(AiBaseItem aObject) => (assigned(aObject) && aObject.isNotEmpty);

String safeValueAsStr(dynamic aValue, {String aDefaultValue = ''}) {
  String result = aDefaultValue;
  if (assigned(aValue)) {
    if (aValue is String)
      result = aValue;
    else {
      try {
        if (aValue is int)
          result = aValue.toString();
        else if (aValue is double)
          result = aValue.toString();
        else if (aValue is DateTime) result = aValue.toString();
      } catch (error) {
        print('Safe value as string error with message : ${error.toString()}');
        // throw error;
      }
    }
  }
  return result;
}

int safeValueAsInt(dynamic aValue, {int aDefaultValue = 0}) {
  int result = aDefaultValue;
  if (assigned(aValue)) {
    if (aValue is int)
      result = aValue;
    else {
      try {
        // if (aValue is String)
        //   result = int.parse(aValue.trim());
        // else
        if (aValue is double) result = aValue.floor();
      } catch (error) {
        print('Safe value as int error with message : ${error.toString()}');
      }
    }
  }
  return result;
}

double safeValueAsDouble(dynamic aValue, {double aDefaultValue = 0.0}) {
  double result = aDefaultValue;
  return result;
}

DateTime safeValueAsDateTime(dynamic aValue, {DateTime? aDefaultValue}) {
  DateTime result = kDefaultDateTime;
  if (assigned(aDefaultValue)) result = aDefaultValue!;
  return result;
}
