import 'dart:convert';

import 'package:pedulee/models/django_model.dart';
import 'package:pedulee/models/serializer.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = LocalStorage('proto3');
const currentModelStorageName = "project_data_list";

class Project extends JSONAble {
  String title = "";
  String description = "";
  String link = "";
  String image = "";
  int amount = 0;
  // ignore: non_constant_identifier_names
  DateTime akhir_waktu = DateTime(0);

  Project(
      {required this.title,
      required this.description,
      required this.link,
      required this.image,
      required this.amount,
      // ignore: non_constant_identifier_names
      required this.akhir_waktu});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json["title"],
      description: json["description"],
      link: json["link"],
      image: json["image"],
      amount: json["amount"],
      akhir_waktu: DateTime.parse(json["akhir_waktu"]),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> m = {};
    m["title"] = title;
    m["description"] = description;
    m["link"] = link;
    m["image"] = image;
    m["amount"] = amount;
    m["akhir_waktu"] = akhir_waktu.toIso8601String();
    return m;
  }
}

class ProjectSerializer extends Serializer<Project> {
  static final instance = ProjectSerializer();
  @override
  Project fromJson(Map<String, dynamic> json) {
    return Project.fromJson(json);
  }
}

Future<List<DjangoModelItem<Project>>> fetchData() async {
  // Fetch your service
  final response =
      await http.get(Uri.parse('https://pedulee.up.railway.app/api/projects/'));
  List<DjangoModelItem<Project>> list = json
      .decode(response.body)
      .map<DjangoModelItem<Project>>((e) =>
          DjangoModelItem<Project>.fromJson(e, ProjectSerializer.instance))
      .toList();
  // Set your cache
  storage.setItem(currentModelStorageName, list);
  return Future.value(list);
}

List<DjangoModelItem<Project>> getLocalData() {
  final List<DjangoModelItem<Project>>? cacheData =
      storage.getItem(currentModelStorageName);
  if (cacheData != null) {
    // Return cached data
    return cacheData;
  }
  return [
    // DjangoModelItem<Project>(
    //     pk: 0,
    //     model: "StartingData",
    //     fields: Project(
    //         title: "Nothing",
    //         description: "Nothing",
    //         link: "Nothing",
    //         image: "Nothing",
    //         amount: 0,
    //         akhir_waktu: DateTime(0)))
  ];
}
