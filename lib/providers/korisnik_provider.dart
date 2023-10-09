// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/request/uredi_korisnika_request.dart';
import 'package:http/http.dart' as http;
import '../models/response/korisnik_response.dart';
import '../utils/auth_utils.dart';

class KorisnikProvider with ChangeNotifier {
  static String? _baseUrl;
  static String endpoint = "Korisnik";
  KorisnikProvider() {
    _baseUrl = const String.fromEnvironment("baseUrl",
        defaultValue: "https://localhost:44344/");
  }

  Future<KorisnikResponse> getLoggedUser() async {
    var korisnikId = Authorization.id;
    var url = "$_baseUrl$endpoint/$korisnikId";
    var uri = Uri.parse(url);
    var headers = createHeaders();
    var response = await http.get(uri, headers: headers);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      var result = KorisnikResponse.fromJson(data);
      return result;
    } else {
      throw Exception("Unexpected error");
    }
  }

  Future<int> urediKorisnika(UrediKorisnikaRequest request) async {
    var url = "$_baseUrl$endpoint/Uredi";
    var uri = Uri.parse(url);
    var headers = createHeaders();
    var jsonRequest = jsonEncode(request);
    var response = await http.post(uri, headers: headers, body: jsonRequest);
    if (isValidResponse(response))
      return 1;
    else
      return 0;
  }
}
