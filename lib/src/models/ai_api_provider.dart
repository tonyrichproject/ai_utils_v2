import '../../ai_base_class_v2.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AiBasicApiProvider extends AiBasicItem {
  @protected
  String internalGetApiEndPoint() => '';
  // to be implemented in local project provider
  // for example
  // String internalGetApiEndPoint() => 'https://www.samplewebsite.com/backend/api';

  @protected
  Map<String, String> internalGetApiHeaders() => {'Content-Type': 'application/json', 'Connection': 'keep-alive'};

  @protected
  Future<dynamic> getDataFromAPI(String aUrl, Map<String, String> aHeaders) async {
    return await http.get(Uri.parse(aUrl), headers: aHeaders);
  }

  @protected
  Future<dynamic> postDataToAPI(String aUrl, Map<String, String> aHeaders, Map<String, dynamic> aPostBody) async {
    return await http.post(Uri.parse(aUrl), headers: aHeaders, body: json.encode(aPostBody));
  }


  @protected
  Future<dynamic> deleteDataToAPI(String aUrl, Map<String, String> aHeaders) async {
    return await http.delete(Uri.parse(aUrl), headers: aHeaders);
  }

  String get apiEndPoint => internalGetApiEndPoint();
  Map<String, String> get apiHeaders => internalGetApiHeaders();
}

/// ----------------------------------------------------------------------------------------------------------