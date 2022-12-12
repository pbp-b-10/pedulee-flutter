import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:pedulee/models/storage.dart';
import 'package:provider/provider.dart';
import 'package:pedulee/apps/helper/session.dart';

const currentModelStorageName = "volunteer_history_list";

class Volunteer extends JSONAble {
  static const Set<String> DIVISI_CHOICES = {
    "Panitia Inti",
    "Kesehatan",
    "Hubungan Masyarakat",
    "Tenaga Kerja"
  };
  int id;
  String divisi;
  String username;
  String title;
  int amount;
  DateTime akhir_waktu;
  Volunteer({
    required this.id,
    required this.username,
    required this.title,
    required this.divisi,
    required this.amount,
    required this.akhir_waktu,
  });

  @override
  String toString() {
    return "Volunteer(${this.id}, ${this.username}, ${this.title}, ${this.divisi})";
  }

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      id: json["id"],
      username: json["username"],
      title: json["title"],
      amount: json["amount"],
      divisi: json["divisi"],
      akhir_waktu: DateTime.parse(json["akhir_waktu"]),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> m = {};
    m["id"] = id;
    m["username"] = username;
    m["title"] = title;
    m["amount"] = amount;
    m["divisi"] = divisi;
    m["akhir_waktu"] = akhir_waktu.toIso8601String();
    return m;
  }
}

class VolunteerSerializer extends Serializer<Volunteer> {
  static final instance = VolunteerSerializer();
  @override
  Volunteer fromJson(Map<String, dynamic> json) {
    return Volunteer.fromJson(json);
  }
}

Future<List<Volunteer>> fetchData(BuildContext context) async {
  // Fetch your service
  final request = context.watch<CookieRequest>();
  final json =
      await request.get('https://pedulee.up.railway.app/api/volunteer/');
  // final response = await http
  //     .get(Uri.parse('https://pedulee.up.railway.app/api/Volunteers/'));
  List<Volunteer> list =
      json.map<Volunteer>((e) => Volunteer.fromJson(e)).toList();
  // Set your cache
  storage.setItem(currentModelStorageName, list);
  return Future.value(list);
}

List<Volunteer> getLocalData() {
  print('Loading from local storage');
  final raw = storage.getItem(currentModelStorageName);
  final List<dynamic>? rawCacheData = raw;
  if (rawCacheData != null && rawCacheData.isNotEmpty) {
    if (rawCacheData[0] is! Volunteer) {
      List<Volunteer> list =
          rawCacheData.map<Volunteer>((e) => Volunteer.fromJson(e)).toList();
      storage.setItem(currentModelStorageName, list);
      // Return cached data
      return list;
    }
    return raw;
  }
  return [
    // DjangoModelItem<Volunteer>(
    //     pk: 0,
    //     model: "StartingData",
    //     fields: Volunteer(
    //         title: "Nothing",
    //         description: "Nothing",
    //         link: "Nothing",
    //         image: "Nothing",
    //         amount: 0,
    //         akhir_waktu: DateTime(0)))
  ];
}
