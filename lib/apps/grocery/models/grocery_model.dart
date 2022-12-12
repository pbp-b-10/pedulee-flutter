import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);



List<Grocery> watchListFromJson(String str) => List<Grocery>.from(json.decode(str).map((x) => Grocery.fromJson(x)));

String watchListToJson(List<Grocery> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Grocery {
    Grocery({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Grocery.fromJson(Map<String, dynamic> json) => Grocery(
        model: json["model"],
        pk: json["pk"],
        fields: json["fields"],
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields{
  static List<Fields> groceries = [];
  late String name;
  late int donasi;  
  late String sembakoChoices;
  late int amount;
  late String paymentMethod;
  late DateTime tanggal;
  late int ccNumber;



  Fields({
    required this.name,
    required this.donasi,
    required this.sembakoChoices,
    required this.amount,
    required this.paymentMethod,
    required this.tanggal,
    required this.ccNumber


  });
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
      name: json["name"],
      donasi: json["donasi"],
      sembakoChoices: json["sembakoChoices"],
      amount: json["amount"],
      paymentMethod: json["paymentMethod"],
      tanggal: DateTime.parse(json["tanggal"]),
      ccNumber: json["ccNumber"],


    );

  Map<String, dynamic> toJson() => {
      "name": name, 
      "donasi": donasi, 
      "sembakoChoices": sembakoChoices,
      "amount": amount,
      "paymentMethod": paymentMethod,
      // "tanggal": tanggal,
      "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",

      "ccNumber": ccNumber

  };

//   static void addNewGrocery({
//     required name, donasi, sembakoChoices, amount, paymentMethod, tanggal, ccNumber
//   }) {
//     groceries.add(
//       GroceryModel(
//         name: name, 
//         donasi: donasi, 
//         sembakoChoices: sembakoChoices,
//         amount: amount,
//         paymentMethod: paymentMethod,
//         tanggal: tanggal,
//         ccNumber: ccNumber
//         ));
//   }
}