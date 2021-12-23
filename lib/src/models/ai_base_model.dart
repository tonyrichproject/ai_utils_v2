// import 'package:ai_base_class/ai_base_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/ai_basic_utils.dart';

typedef OnItemSelectNotifyEvent = void Function(AiBaseItem selectItem);

/// ----------------------------------------------------------------------------------------------------------
// class AiBaseItem {
//   int id = 0;
//   int tag = 0;

//   // event that can assign from outside the class
//   OnItemSelectNotifyEvent onSelectItemEvent;

//   @protected
//   void internalDoOnSelectItemEvent(AiBaseItem aSelectItem) {
//     if (onSelectItemEvent != null) onSelectItemEvent(aSelectItem);
//   }

//   void notifyEvent() {
//     // if object is an item that has owner then
//     // raise event to owner list by this object
//     if (owner != null && owner is AiBaseItem)
//       (owner as AiBaseItem).internalDoOnSelectItemEvent(this);
//     else
//       // else just raise event
//       internalDoOnSelectItemEvent(this);
//   }

//   // Basic Constructor
//   AiBaseItem({this.id = 0, this.tag = 0});

//   // Named Constructor : create this class by link the event
//   AiBaseItem.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {this.id = 0, this.tag = 0}) {
//     this.onSelectItemEvent = onSelectItemEvent;
//   }

//   @protected
//   List<String> getMapKeys() => [];

//   @protected
//   void internalLoadFromMapItem(Map<String, dynamic> aMap) {/* load from http map */}

//   @protected
//   Map<String, dynamic> internalAsMap() => null;
//   Map<String, dynamic> asMap() => internalAsMap();

//   @protected
//   bool internalCopyFrom(dynamic aSource) {
//     AiBaseItem source = aSource as AiBaseItem;
//     this.id = source.id;
//     this.tag = source.tag;
//     return true;
//   }

//   bool copyFrom(dynamic aSource, {bool aClearBeforeCopy = true}) {
//     if (aSource != null && aSource.runtimeType == this.runtimeType) {
//       if (aClearBeforeCopy) clearData();
//       return internalCopyFrom(aSource);
//     } else
//       return false;
//   }

//   @protected
//   bool internalCloneFrom(AiBaseItem aAiSource) {
//     bool result = copyFrom(aAiSource, aClearBeforeCopy: true);
//     // Clone will also copy event pointer to current object
//     if (result) this.onSelectItemEvent = aAiSource.onSelectItemEvent;
//     return result;
//   }

//   bool cloneFrom(AiBaseItem aAiSource) => internalCloneFrom(aAiSource);

//   /* check if object empty by validate to some property of object */
//   @protected
//   bool get internalIsEmpty => true;
//   // To be implemented

//   /* external call */
//   bool get isEmpty => internalIsEmpty;
//   bool get isNotEmpty => !(isEmpty);

//   @protected
//   void internalClearData() {
//     id = 0;
//     tag = 0;
//     // to be implemented
//   }

//   @protected
//   void internalReset() {
//     internalClearData();
//     onSelectItemEvent = null;
//   }

//   void clearData() => internalClearData();
//   // Function reset will clear all data and also set event pointer to null
//   void reset() => internalReset();

//   dynamic owner;
//   int get index => (owner != null && owner is AiBaseList) ? (owner as AiBaseList).items.indexOf(this) : -1;

//   @protected
//   bool internalIsValidJsonObj(dynamic aRawJsonDataObj) => false;

//   @protected
//   void internalLoadFromRawJsonDataObj(dynamic aRawJsonDataObj) {
//     // to be implemented
//   }

//   bool loadFromRawJsonDataObj(dynamic aRawJsonDataObj, {bool aIsClearBoforeLoad = true}) {
//     bool result;
//     if (aIsClearBoforeLoad) clearData();
//     result = (assigned(aRawJsonDataObj) && internalIsValidJsonObj(aRawJsonDataObj));
//     if (result) internalLoadFromRawJsonDataObj(aRawJsonDataObj);
//     return result;
//   }

//   bool isSameObject(AiBaseItem aObject) {
//     bool result = false;
//     if (aObject != null && aObject == this) result = true;
//     return result;
//   }

//   AiBaseItem findByObject(AiBaseItem aObject) => isSameObject(aObject) ? this : null;

//   @protected
//   bool internalIsEqualTo(AiBaseItem aComparisonObject) => false;
//   // to be implemented when descendant need to compare properties of two objects that are similar class

//   bool isEqualTo(AiBaseItem aComparisonObject) {
//     return (aComparisonObject != null && aComparisonObject.runtimeType == this.runtimeType && internalIsEqualTo(aComparisonObject));
//   }

//   /* Print debug */
//   void debug(dynamic aObject) {
//     if (AiDebugger.instance.isLogEnabled && aObject != null) print('Debugging from AI Class name : ${this.runtimeType} - $aObject');
//   }
// }

// /// ----------------------------------------------------------------------------------------------------------
// class AiBaseList extends AiBaseItem {
//   // Constructor pass id and tag to base class
//   AiBaseList({int id, int tag}) : super(id: id, tag: tag);

//   // Named constructor that pass paramaters to super.createWithEvent
//   AiBaseList.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {int id, int tag})
//       : super.createWithEvent(onSelectItemEvent, id: id, tag: tag);

//   List<AiBaseItem> _objList;

//   @protected
//   AiBaseItem getNewObjItem() => AiBaseItem(); // return object item of list

//   @protected
//   List<AiBaseItem> getObjList() => <AiBaseItem>[];

//   List<AiBaseItem> get items {
//     if (_objList == null) _objList = getObjList();
//     return _objList;
//   }

//   // set items(List<AiBaseItem> aList) => _objList = aList;
//   set items(List<AiBaseItem> aList) {}

//   @protected
//   internalLoadFromMapList(List<dynamic> aMapList) {}

//   loadFromMapList(List<dynamic> aMapList, [bool aIsClearBeforeLoad = true]) {
//     if (aIsClearBeforeLoad) clear(); // check if clear list before loading
//     if (aMapList != null && aMapList.isNotEmpty) internalLoadFromMapList(aMapList);
//   }

//   @override
//   bool internalCopyFrom(dynamic aSource) {
//     // Only copy data
//     bool result = super.internalCopyFrom(aSource);
//     // Clear items before copy from source list
//     // this.clear();
//     // Check if source list is available
//     if (result && isAvailable(aSource as AiBaseList)) {
//       var sourceList = aSource as AiBaseList;
//       // Copy data from source item to new item except notify event
//       sourceList.items.forEach((AiBaseItem sourceItem) => this.addNewObjItem()..copyFrom(sourceItem));
//       return this.isNotEmpty;
//     } else
//       return false;
//   }

//   @override
//   bool internalCloneFrom(AiBaseItem aAiSource) {
//     // Call super clone to check same type of class and copy all data and event
//     var result = super.internalCloneFrom(aAiSource);
//     // Clear items before clone
//     // this.clear();
//     // Check if Source list is not empty
//     if (result && isAvailable(aAiSource)) {
//       // Now the aAiSource will be inherited from AiBaseList
//       var sourceList = aAiSource as AiBaseList;
//       // Iterate thourgh source items
//       //// add new item and clone all data and event
//       sourceList.items.forEach((AiBaseItem sourceItem) => this.addNewObjItem()..cloneFrom(sourceItem));
//       return this.isNotEmpty;
//     } else
//       return false;
//   }

//   @protected
//   bool internalAppendFrom(AiBaseList aSourceList) {
//     /// this id and tag will not copy from source
//     /// just copy items from source
//     int currItemCount = this.count;
//     aSourceList.items.forEach((AiBaseItem sourceItem) => this.addNewObjItem()..copyFrom(sourceItem));
//     return this.count == currItemCount + aSourceList.count;
//   }

//   // Append list from the last item by not delete any item
//   bool appendFrom(AiBaseList aSourceList) {
//     bool result = isAvailable(aSourceList) && aSourceList.runtimeType == this.runtimeType;
//     result = (result) ? internalAppendFrom(aSourceList) : false;
//     return result;
//   }

//   bool appendFromRawJsonDataObj(dynamic aRawJsonDataObj) => loadFromRawJsonDataObj(aRawJsonDataObj, aIsClearBoforeLoad: false);

//   @override
//   void internalClearData() {
//     super.internalClearData();
//     clear();
//   }

//   AiBaseItem getItem(int aIndex) {
//     var result;
//     if (isNotEmpty && aIndex < this.count) result = items[aIndex];
//     return result;
//   }

//   AiBaseItem itemByObject(AiBaseItem aObject) {
//     if (aObject != null && items.indexOf(aObject) > -1)
//       return aObject;
//     else
//       return null;
//   }

//   AiBaseItem itemByObjectValue(AiBaseItem aComparisonObject) {
//     if (aComparisonObject == null) return null;
//     // bool result = false;
//     for (var i = 0; i < count; i++) {
//       // Compare two objects by values
//       var currItem = getItem(i);
//       if (currItem.isEqualTo(aComparisonObject)) return currItem;
//     }
//     return null;
//   }

//   // Transfer methods and properties
//   void clear() => items.clear();
//   int get length => items.length;
//   int get count => this.length;
//   bool get isEmpty => items.isEmpty;
//   bool get isNotEmpty => items.isNotEmpty;
//   bool remove(AiBaseItem aItem) => items.remove(aItem);
//   AiBaseItem removeAt(int aIndex) => items.removeAt(aIndex);

//   void addItem(AiBaseItem item) {
//     items.add(item);
//     item.owner = this;
//   }

//   AiBaseItem addNewObjItem() {
//     var newItem = this.getNewObjItem();
//     addItem(newItem);
//     return newItem;
//   }

//   void reversedItems() => items.reversed;
//   // Iterable<AiBaseItem> get reversed => items.reversed;
//   AiBaseItem get last => items.last;
//   AiBaseItem get first => items.first;

//   void printItems() {
//     if (AiDebugger.instance.isLogEnabled && this.isNotEmpty) {
//       for (var i = 0; i < count; i++) {
//         print('Debugging from AI Base List : ${this.runtimeType} -> Item Class ${getItem(i).runtimeType} Index : ${getItem(i).index}');
//       }
//     }
//   }
// }

// /// ----------------------------------------------------------------------------------------------------------
// mixin AiHttpItemLoaderMixin on AiBaseItem {
//   bool canLoadFromMap(Map<String, dynamic> aMap, List<String> aKeys) {
//     var valid = (aMap != null) && (aKeys.isNotEmpty);
//     if (valid) {
//       for (String key in aKeys) {
//         valid = aMap.containsKey(key);
//         if (!valid) break;
//       }
//     }
//     return valid;
//   }

//   loadFromMapItem(Map<String, dynamic> aMap) {
//     if (canLoadFromMap(aMap, getMapKeys())) internalLoadFromMapItem(aMap);
//   }

//   /* response has to be single map object */
//   loadFromHttpData(http.Response aResponseObj) {
//     if (aResponseObj != null) {
//       final mapObj = json.decode(aResponseObj.body) as Map<String, dynamic>;
//       loadFromMapItem(mapObj);
//     }
//   }
// }

// /// ----------------------------------------------------------------------------------------------------------
// mixin AiHttpListLoaderMixin on AiBaseList {
//   // implement load from http response list
//   loadFromHttpData(http.Response aResponseList, [bool aIsClearBeforeLoad = true]) {
//     if (aResponseList != null) {
//       final mapList = json.decode(aResponseList.body) as List<dynamic>;
//       loadFromMapList(mapList, aIsClearBeforeLoad);
//     }
//   }
// }

// /// ----------------------------------------------------------------------------------------------------------
// mixin AiMapExporterMixin on AiBaseItem {
//   @protected
//   Map<String, dynamic> internalGetDataAsMap() => {
//         // to be implemented when object want to return map object
//         // to send through HTTPS in provider
//       };

//   Map<String, dynamic> get dataAsMap => internalGetDataAsMap();
// }

// /// ----------------------------------------------------------------------------------------------------------
// mixin AiDataToHttpParamMixin on AiBaseItem {
//   @protected
//   String internalGetDataAsHttpParam() => '';
//   // To be implemented when item can return http parameters

//   String get dataAsHttpParam => internalGetDataAsHttpParam();
// }

// /// ----------------------------------------------------------------------------------------------------------
// class AiBasicItem extends AiBaseItem with AiHttpItemLoaderMixin, AiMapExporterMixin {
//   // Constructor
//   AiBasicItem({int id, int tag}) : super(id: id, tag: tag);

//   // Name Constructor creat with event notification
//   AiBasicItem.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {int id, int tag})
//       : super.createWithEvent(onSelectItemEvent, id: id, tag: tag);
// }

// /// ----------------------------------------------------------------------------------------------------------
// /// subclass should be inherit from AiBasicList
// class AiBasicList extends AiBaseList with AiHttpListLoaderMixin, AiMapExporterMixin {
//   // Constructor
//   AiBasicList({int id, int tag}) : super(id: id, tag: tag);

//   // Named Constructor : create list with event link
//   AiBasicList.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {int id, int tag})
//       : super.createWithEvent(onSelectItemEvent, id: id, tag: tag);

//   @override
//   AiBaseItem getNewObjItem() => AiBasicItem();

//   @override
//   List<AiBaseItem> getObjList() => <AiBasicItem>[];

//   @override
//   internalLoadFromMapList(List<dynamic> aMapList) {
//     aMapList.forEach(
//       (item) {
//         var mapItem = item as Map<String, dynamic>;
//         var newItem = this.addNewObjItem() as AiBasicItem;
//         newItem.loadFromMapItem(mapItem);
//       },
//     );
//   }
// }

// /// ----------------------------------------------------------------------------------------------------------
// class AiDebugger extends AiBasicItem {
//   // static bool logEnabled = true;

//   bool _logEnabled = true;

//   AiDebugger() {
//     _logEnabled = true;
//   }

//   static AiDebugger instance = AiDebugger();
//   bool get isLogEnabled => instance._logEnabled;
//   static void enableLog(bool aIsEnabled) => instance._logEnabled = aIsEnabled;
// }

/// ----------------------------------------------------------------------------------------------------------
/// ----------------------------------------------------------------------------------------------------------
/// ------------------------------------ Ai Base Classes -----------------------------------------------------
/// ------------------------------------ Non-Nullable Version ------------------------------------------------
/// ----------------------------------------------------------------------------------------------------------
/// ----------------------------------------------------------------------------------------------------------

class AiBaseItem {
  int? id = 0;
  int? tag = 0;

  // event that can assign from outside the class
  OnItemSelectNotifyEvent? onSelectItemEvent;

  @protected
  void internalDoOnSelectItemEvent(AiBaseItem aSelectItem) {
    onSelectItemEvent!(aSelectItem);
    // if (assigned(onSelectItemEvent)) onSelectItemEvent!(aSelectItem);
  }

  void notifyEvent() {
    // if object is an item that has owner then
    // raise event to owner list by this object
    if (owner != null && owner is AiBaseItem)
      (owner as AiBaseItem).internalDoOnSelectItemEvent(this);
    else
      // else just raise event
      internalDoOnSelectItemEvent(this);
  }

  // Basic Constructor
  AiBaseItem({this.id = 0, this.tag = 0});

  // Named Constructor : create this class by link the event
  AiBaseItem.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {this.id = 0, this.tag = 0}) {
    this.onSelectItemEvent = onSelectItemEvent;
  }

  @protected
  List<String> getMapKeys() => [];

  @protected
  void internalLoadFromMapItem(Map<String, dynamic> aMap) {/* load from http map */}

  @protected
  Map<String, dynamic>? internalAsMap() => null;
  Map<String, dynamic>? asMap() => internalAsMap();

  @protected
  bool internalCopyFrom(dynamic aSource) {
    AiBaseItem source = aSource as AiBaseItem;
    this.id = source.id;
    this.tag = source.tag;
    return true;
  }

  bool copyFrom(dynamic aSource, {bool aClearBeforeCopy = true}) {
    if (assigned(aSource) && aSource.runtimeType == this.runtimeType) {
      if (aClearBeforeCopy) clearData();
      return internalCopyFrom(aSource);
    } else
      return false;
  }

  @protected
  bool internalCloneFrom(AiBaseItem aAiSource) {
    bool result = copyFrom(aAiSource, aClearBeforeCopy: true);
    // Clone will also copy event pointer to current object
    if (result) this.onSelectItemEvent = aAiSource.onSelectItemEvent;
    return result;
  }

  bool cloneFrom(AiBaseItem aAiSource) => internalCloneFrom(aAiSource);

  /* check if object empty by validate to some property of object */
  @protected
  bool get internalIsEmpty => true;
  // To be implemented

  /* external call */
  bool get isEmpty => internalIsEmpty;
  bool get isNotEmpty => !(isEmpty);

  @protected
  void internalClearData() {
    id = 0;
    tag = 0;
    // to be implemented
  }

  @protected
  void internalReset() {
    internalClearData();
    onSelectItemEvent = null;
  }

  void clearData() => internalClearData();
  // Function reset will clear all data and also set event pointer to null
  void reset() => internalReset();

  dynamic owner;
  int get index => (assigned(owner) && owner is AiBaseList) ? (owner as AiBaseList).items.indexOf(this) : -1;

  @protected
  bool internalIsValidJsonObj(dynamic aRawJsonDataObj) => false;

  @protected
  void internalLoadFromRawJsonDataObj(dynamic aRawJsonDataObj) {
    // to be implemented
  }

  bool loadFromRawJsonDataObj(dynamic aRawJsonDataObj, {bool aIsClearBoforeLoad = true}) {
    bool result;
    if (aIsClearBoforeLoad) clearData();
    result = (assigned(aRawJsonDataObj) && internalIsValidJsonObj(aRawJsonDataObj));
    if (result) internalLoadFromRawJsonDataObj(aRawJsonDataObj);
    return result;
  }

  bool isSameObject(AiBaseItem? aObject) {
    bool result = false;
    if (aObject != null && aObject == this) result = true;
    return result;
  }

  AiBaseItem? findByObject(AiBaseItem aObject) => isSameObject(aObject) ? this : null;

  @protected
  bool internalIsEqualTo(AiBaseItem aComparisonObject) => false;
  // to be implemented when descendant need to compare properties of two objects that are similar class

  bool isEqualTo(AiBaseItem? aComparisonObject) {
    return (aComparisonObject != null && aComparisonObject.runtimeType == this.runtimeType && internalIsEqualTo(aComparisonObject));
  }

  /* Print debug */
  void debug(dynamic aObject) {
    if (AiDebugger.instance.isLogEnabled && assigned(aObject)) print('Debugging from AI Class name : ${this.runtimeType} - $aObject');
  }
}

// void testing() {
//   var obj;
//   var aiBaseList = AiBaseList()..isEqualTo(obj);
// }

class AiBaseList extends AiBaseItem {
  // Constructor pass id and tag to base class
  AiBaseList({int? id = 0, int? tag = 0}) : super(id: id, tag: tag);

  // Named constructor that pass paramaters to super.createWithEvent
  AiBaseList.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {int? id, int? tag})
      : super.createWithEvent(onSelectItemEvent, id: id, tag: tag);

  late List<AiBaseItem> _objList = getObjList();

  @protected
  AiBaseItem getNewObjItem() => AiBaseItem(); // return object item of list

  @protected
  List<AiBaseItem> getObjList() => <AiBaseItem>[];

  List<AiBaseItem> get items => _objList;

  // List<AiBaseItem> get items {
  //   if (_objList == null) _objList = getObjList();
  //   return _objList;
  // }

  // set items(List<AiBaseItem> aList) => _objList = aList;
  @protected
  set items(List<AiBaseItem>? aList) {/* Do nothing when set items */}

  @protected
  internalLoadFromMapList(List<dynamic> aMapList) {}

  loadFromMapList(List<dynamic>? aMapList, [bool aIsClearBeforeLoad = true]) {
    if (aIsClearBeforeLoad) clear(); // check if clear list before loading
    if (aMapList != null && aMapList.isNotEmpty) internalLoadFromMapList(aMapList);
  }

  @override
  bool internalCopyFrom(dynamic aSource) {
    // Only copy data
    bool result = super.internalCopyFrom(aSource);
    // Clear items before copy from source list
    // this.clear();
    // Check if source list is available
    if (result && isAvailable(aSource as AiBaseList)) {
      var sourceList = aSource;
      // Copy data from source item to new item except notify event
      sourceList.items.forEach((AiBaseItem sourceItem) => this.addNewObjItem()..copyFrom(sourceItem));
      return this.isNotEmpty;
    } else
      return false;
  }

  @override
  bool internalCloneFrom(AiBaseItem aAiSource) {
    // Call super clone to check same type of class and copy all data and event
    var result = super.internalCloneFrom(aAiSource);
    // Clear items before clone
    // this.clear();
    // Check if Source list is not empty
    if (result && isAvailable(aAiSource)) {
      // Now the aAiSource will be inherited from AiBaseList
      var sourceList = aAiSource as AiBaseList;
      // Iterate thourgh source items
      //// add new item and clone all data and event
      sourceList.items.forEach((AiBaseItem sourceItem) => this.addNewObjItem()..cloneFrom(sourceItem));
      return this.isNotEmpty;
    } else
      return false;
  }

  @protected
  bool internalAppendFrom(AiBaseList aSourceList) {
    /// this id and tag will not copy from source
    /// just copy items from source
    int currItemCount = this.count;
    aSourceList.items.forEach((AiBaseItem sourceItem) => this.addNewObjItem()..copyFrom(sourceItem));
    return this.count == currItemCount + aSourceList.count;
  }

  // Append list from the last item by not delete any item
  bool appendFrom(AiBaseList aSourceList) {
    bool result = isAvailable(aSourceList) && aSourceList.runtimeType == this.runtimeType;
    result = (result) ? internalAppendFrom(aSourceList) : false;
    return result;
  }

  bool appendFromRawJsonDataObj(dynamic aRawJsonDataObj) => loadFromRawJsonDataObj(aRawJsonDataObj, aIsClearBoforeLoad: false);

  @override
  void internalClearData() {
    super.internalClearData();
    clear();
  }

  AiBaseItem? getItem(int aIndex) {
    var result;
    if (isNotEmpty && aIndex < this.count) result = items[aIndex];
    return result;
  }

  AiBaseItem? itemByObject(AiBaseItem? aObject) {
    if (aObject != null && items.indexOf(aObject) > -1)
      return aObject;
    else
      return null;
  }

  AiBaseItem? itemByObjectValue(AiBaseItem aComparisonObject) {
    // if (aComparisonObject == null) return null;
    // bool result = false;
    for (var i = 0; i < count; i++) {
      // Compare two objects by values
      var currItem = getItem(i);
      if (currItem!.isEqualTo(aComparisonObject)) return currItem;
    }
    return null;
  }

  // Transfer methods and properties
  void clear() => items.clear();
  int get length => items.length;
  int get count => this.length;
  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
  bool remove(AiBaseItem aItem) => items.remove(aItem);
  AiBaseItem removeAt(int aIndex) => items.removeAt(aIndex);

  void addItem(AiBaseItem item) {
    items.add(item);
    item.owner = this;
  }

  AiBaseItem addNewObjItem() {
    var newItem = this.getNewObjItem();
    addItem(newItem);
    return newItem;
  }

  void reversedItems() => items.reversed;
  // Iterable<AiBaseItem> get reversed => items.reversed;
  AiBaseItem get last => items.last;
  AiBaseItem get first => items.first;

  void printItems() {
    if (AiDebugger.instance.isLogEnabled && this.isNotEmpty) {
      for (var i = 0; i < count; i++) {
        print('Debugging from AI Base List : ${this.runtimeType} -> Item Class ${getItem(i)!.runtimeType} Index : ${getItem(i)!.index}');
      }
    }
  }
}

/// ----------------------------------------------------------------------------------------------------------
mixin AiHttpItemLoaderMixin on AiBaseItem {
  bool canLoadFromMap(Map<String, dynamic>? aMap, List<String> aKeys) {
    var valid = (aMap != null) && (aKeys.isNotEmpty);
    if (valid) {
      for (String key in aKeys) {
        valid = aMap!.containsKey(key);
        if (!valid) break;
      }
    }
    return valid;
  }

  loadFromMapItem(Map<String, dynamic> aMap) {
    if (canLoadFromMap(aMap, getMapKeys())) internalLoadFromMapItem(aMap);
  }

  /* response has to be single map object */
  loadFromHttpData(http.Response aResponseObj) {
    // if (aResponseObj != null) {
    if (assigned(aResponseObj)) {
      final mapObj = json.decode(aResponseObj.body) as Map<String, dynamic>;
      loadFromMapItem(mapObj);
    }
  }
}

/// ----------------------------------------------------------------------------------------------------------
mixin AiHttpListLoaderMixin on AiBaseList {
  // implement load from http response list
  loadFromHttpData(http.Response aResponseList, [bool aIsClearBeforeLoad = true]) {
    // if (aResponseList != null) {
    if (assigned(aResponseList)) {
      final mapList = json.decode(aResponseList.body) as List<dynamic>;
      loadFromMapList(mapList, aIsClearBeforeLoad);
    }
  }
}

/// ----------------------------------------------------------------------------------------------------------
mixin AiMapExporterMixin on AiBaseItem {
  @protected
  Map<String, dynamic> internalGetDataAsMap() => {
        // to be implemented when object want to return map object
        // to send through HTTPS in provider
      };

  Map<String, dynamic> get dataAsMap => internalGetDataAsMap();
}

/// ----------------------------------------------------------------------------------------------------------
mixin AiDataToHttpParamMixin on AiBaseItem {
  @protected
  String internalGetDataAsHttpParam() => '';
  // To be implemented when item can return http parameters

  String get dataAsHttpParam => internalGetDataAsHttpParam();
}

/// ----------------------------------------------------------------------------------------------------------
class AiBasicItem extends AiBaseItem with AiHttpItemLoaderMixin, AiMapExporterMixin {
  // Constructor
  AiBasicItem({int? id, int? tag}) : super(id: id, tag: tag);

  // Name Constructor creat with event notification
  AiBasicItem.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {int? id, int? tag})
      : super.createWithEvent(onSelectItemEvent, id: id, tag: tag);
}

/// ----------------------------------------------------------------------------------------------------------
/// subclass should be inherit from AiBasicList
class AiBasicList extends AiBaseList with AiHttpListLoaderMixin, AiMapExporterMixin {
  // Constructor
  AiBasicList({int? id, int? tag}) : super(id: id, tag: tag);

  // Named Constructor : create list with event link
  AiBasicList.createWithEvent(OnItemSelectNotifyEvent onSelectItemEvent, {int? id, int? tag})
      : super.createWithEvent(onSelectItemEvent, id: id, tag: tag);

  @override
  AiBaseItem getNewObjItem() => AiBasicItem();

  @override
  List<AiBaseItem> getObjList() => <AiBasicItem>[];

  @override
  internalLoadFromMapList(List<dynamic> aMapList) {
    aMapList.forEach(
      (item) {
        var mapItem = item as Map<String, dynamic>;
        var newItem = this.addNewObjItem() as AiBasicItem;
        newItem.loadFromMapItem(mapItem);
      },
    );
  }
}

/// ----------------------------------------------------------------------------------------------------------
class AiDebugger extends AiBasicItem {
  // static bool logEnabled = true;

  bool _logEnabled = true;

  AiDebugger() {
    _logEnabled = true;
  }

  static AiDebugger instance = AiDebugger();
  bool get isLogEnabled => instance._logEnabled;
  static void enableLog(bool aIsEnabled) => instance._logEnabled = aIsEnabled;
}

/// ----------------------------------------------------------------------------------------------------------
