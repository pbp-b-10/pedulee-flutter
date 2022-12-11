import 'dart:convert';
import 'package:pedulee/apps/cloth/models/cloth.dart';
import 'package:http/http.dart' as http;

Future<List<Cloth>> fetchCloth() async {
    var url =
        Uri.parse('https://pedulee.up.railway.app/history/api/cloth/');
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
    List<Cloth> listCloth = [];
    for (var d in data) {
      if (d != null) {
        listCloth.add(Cloth.fromJson(d));
      }
    }

    return listCloth;
  }
