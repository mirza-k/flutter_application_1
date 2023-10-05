// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/response/fudbaler_detail_response.dart';
import '../models/response/fudbaler_response.dart';
import '../models/search_results.dart';
import '../utils/auth_utils.dart';

class FudbalerProvider with ChangeNotifier {
  static String? _baseUrl;
  static String endpoint = "Fudbaler";
  FudbalerProvider() {
    _baseUrl = const String.fromEnvironment("baseUrl",
        defaultValue: "https://localhost:44344/");
  }

  Future<SearchResult<FudbalerResponse>> get(int? klubId) async {
    var url = "$_baseUrl$endpoint?KlubId=$klubId";
    var uri = Uri.parse(url);
    var headers = createHeaders();
    var response = await http.get(uri, headers: headers);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      var result = SearchResult<FudbalerResponse>();
      for (var item in data) {
        result.result.add(FudbalerResponse.fromJson(item));
      }
      return result;
    } else {
      throw new Exception("Unexpected error");
    }
  }

  Future<FudbalerResponse> getById(int? fudbalerId) async {
    var url = "$_baseUrl$endpoint/$fudbalerId";
    var uri = Uri.parse(url);
    var headers = createHeaders();
    var response = await http.get(uri, headers: headers);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      return FudbalerResponse.fromJson(data);
    } else {
      throw new Exception("Unexpected error");
    }
  }

  Future<FudbalerDetailResponse> getDetails(int? fudbalerId) async {
    var url = "$_baseUrl$endpoint/details/$fudbalerId";
    var uri = Uri.parse(url);
    var headers = createHeaders();
    var response = await http.get(uri, headers: headers);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      return FudbalerDetailResponse.fromJson(data);
    } else {
      throw new Exception("Unexpected error");
    }
  }
}
