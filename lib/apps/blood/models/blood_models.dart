// To parse this JSON data, do
//
//     final blood = bloodFromJson(jsonString);

import 'dart:convert';

List<Blood> bloodFromJson(String str) => List<Blood>.from(json.decode(str).map((x) => Blood.fromJson(x)));

String bloodToJson(List<Blood> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blood {
  Blood({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Blood.fromJson(Map<String, dynamic> json) => Blood(
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.user,
    required this.date,
    required this.golongan,
    required this.rhesus,
    required this.penyakitBawaan,
    required this.lokasiDonor,
  });

  int user;
  DateTime date;
  String golongan;
  String rhesus;
  String penyakitBawaan;
  String lokasiDonor;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    date: DateTime.parse(json["date"]),
    golongan: json["golongan"],
    rhesus: json["rhesus"],
    penyakitBawaan: json["penyakit_bawaan"],
    lokasiDonor: json["lokasi_donor"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "golongan": golongan,
    "rhesus": rhesus,
    "penyakit_bawaan": penyakitBawaan,
    "lokasi_donor": lokasiDonor,
  };
}
