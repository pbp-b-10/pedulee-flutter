import 'dart:convert';
import 'package:pedulee/apps/grocery/models/grocery_model.dart';
import 'package:http/http.dart' as http;


  Future<List<Grocery>> fetchGrocery() async {
        var url = Uri.parse('https://pedulee.up.railway.app/history/api/groceries/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Grocery
        List<Grocery> listGrocery = [];
        for (var d in data) {
        if (d != null) {
            listGrocery.add(Grocery.fromJson(d));
        }
        }

        return listGrocery;
    }