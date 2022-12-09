import 'package:pedulee/models/serializer.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchProjects() {
  return http.get(Uri.parse('https://pedulee.up.railway.app/api/projects/'));
}

class Project {
  String title = "";
  String description = "";
  String link = "";
  String image = "";
  int amount = 0;
  DateTime akhir_waktu = DateTime(0);

  Project(
      {required this.title,
      required this.description,
      required this.link,
      required this.image,
      required this.amount,
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
}

class ProjectSerializer extends Serializer<Project> {
  @override
  Project fromJson(Map<String, dynamic> json) {
    return Project.fromJson(json);
  }
}

class ListProject {
  static List<Project> data = [];
}
