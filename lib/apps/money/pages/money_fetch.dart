import 'dart:convert';
import 'package:pedulee/apps/money/models/money_models.dart';
import 'package:http/http.dart' as http;

Future<List<Mymoneymodels>> fetchMoney() async {
    var url =
        Uri.parse('https://pedulee.up.railway.app/history/api/money/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // melakukan konversi data json menjadi object Mywatchlist
    List<Mymoneymodels> MyMoneyList = [];
    for (var d in data) {
      if (d != null) {
        MyMoneyList.add(Mymoneymodels.fromJson(d));
      }
    }

    return MyMoneyList;
  }
