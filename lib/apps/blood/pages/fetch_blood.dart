import 'dart:convert';
import 'package:pedulee/apps/blood/models/blood_models.dart';
import 'package:http/http.dart' as http;

Future<List<Blood>> fetchBlood() async {
  var url =
  Uri.parse('https://pedulee.up.railway.app/history/api/blood/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Cloth
  List<Blood> listBlood = [];
  for (var d in data) {
    if (d != null) {
      listBlood.add(Blood.fromJson(d));
    }
  }
  return listBlood;
}