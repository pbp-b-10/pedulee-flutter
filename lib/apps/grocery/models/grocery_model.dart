import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);



List<Grocery> groceryFromJson(String str) => List<Grocery>.from(json.decode(str).map((x) => Grocery.fromJson(x)));

String groceryToJson(List<Grocery> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  int amount;
  String pmethod;
  DateTime tanggal;
  int ccnumber;
  int donasi;  
  String sembako;



  Fields({
    required this.user,
    required this.username,    
    required this.donasi,
    required this.sembako,
    required this.amount,
    required this.pmethod,
    required this.tanggal,
    required this.ccnumber


  });
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
      user: json["user"],
      username: json["username"],      
      donasi: json["donasi"],
      sembako: json["sembako"],
      amount: json["amount"],
      pmethod: json["pmethod"],
      tanggal: DateTime.parse(json["tanggal"]),
      ccnumber: json["ccnumber"],


    );

  Map<String, dynamic> toJson() => {
      "user": user,
      "username": username,      
      "donasi": donasi, 
      "sembako": sembako,
      "amount": amount,
      "pmethod": pmethod,
      // "tanggal": tanggal,
      "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
      "ccnumber": ccnumber

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