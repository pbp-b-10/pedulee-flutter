// To parse this JSON data, do
//
//     final cloth = clothFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Cloth> clothFromJson(String str) => List<Cloth>.from(json.decode(str).map((x) => Cloth.fromJson(x)));

String clothToJson(List<Cloth> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cloth {
    Cloth({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Cloth.fromJson(Map<String, dynamic> json) => Cloth(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.username,
        required this.date,
        required this.clothModel,
        required this.material,
        required this.type,
    });

    int user;
    String username;
    DateTime date;
    String clothModel;
    String material;
    String type;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        date: DateTime.parse(json["date"]),
        clothModel: json["cloth_model"],
        material: json["material"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "cloth_model": clothModel,
        "material": material,
        "type": type,
    };
}
