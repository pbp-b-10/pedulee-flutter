import 'package:pedulee/models/serializer.dart';

class Volunteer {
  static const Set<String> DIVISI_CHOICES = {
    "Panitia Inti",
    "Kesehatan",
    "Hubungan Masyarakat",
    "Tenaga Kerja"
  };
  int project_id;
  String divisi;
  int durasi;
  Volunteer({
    required this.project_id,
    required this.divisi,
    required this.durasi,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      project_id: json["project_id"],
      divisi: json["divisi"],
      durasi: json["durasi"],
    );
  }
}

class VolunteerSerializer extends Serializer<Volunteer> {
  @override
  Volunteer fromJson(Map<String, dynamic> json) {
    return Volunteer.fromJson(json);
  }
}

class ListVolunteer {
  static List<Volunteer> data = [];
}
