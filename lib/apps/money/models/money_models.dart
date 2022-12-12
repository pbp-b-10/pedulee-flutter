// To parse this JSON data, do
//
//     final mymoneymodels = mymoneymodelsFromJson(jsonString);

import 'dart:convert';

List<Mymoneymodels> mymoneymodelsFromJson(String str) => List<Mymoneymodels>.from(json.decode(str).map((x) => Mymoneymodels.fromJson(x)));

String mymoneymodelsToJson(List<Mymoneymodels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mymoneymodels {
    Mymoneymodels({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Mymoneymodels.fromJson(Map<String, dynamic> json) => Mymoneymodels(
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
        required this.name,
        required this.email,
        required this.pnumber,
        required this.donation,
        required this.message,
        required this.pmethod,
        required this.date,
        required this.ccnumber,
    });

    int user;
    String name;
    String email;
    int pnumber;
    String donation;
    String message;
    String pmethod;
    DateTime date;
    int ccnumber;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        email: json["email"],
        pnumber: json["pnumber"],
        donation: json["donation"],
        message: json["message"],
        pmethod: json["pmethod"],
        date: DateTime.parse(json["date"]),
        ccnumber: json["ccnumber"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "email": email,
        "pnumber": pnumber,
        "donation": donation,
        "message": message,
        "pmethod": pmethod,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "ccnumber": ccnumber,
    };
}
