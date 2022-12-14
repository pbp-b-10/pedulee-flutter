import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';

import 'package:pedulee/profile.dart';

// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);



List<Profile> profileFromJson(String str) => List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
    Profile({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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

class Fields{
  static List<Fields> groceries = [];
  int user;
  String username;  
  String fullname;
  DateTime birthdate;
  int phonenumber;
  String address;



  Fields({
    required this.user,
    required this.username,    
    required this.address,
    required this.fullname,
    required this.birthdate,
    required this.phonenumber


  });
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
      user: json["user"],
      username: json["username"],      
      address: json["address"],
      fullname: json["fullname"],
      birthdate: DateTime.parse(json["birthdate"]),
      phonenumber: json["phonenumber"],


    );

  Map<String, dynamic> toJson() => {
      "user": user,
      "username": username,      
      "address": address,
      "fullname": fullname,
      // "tanggal": tanggal,
      "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
      "phonenumber": phonenumber

  };
}