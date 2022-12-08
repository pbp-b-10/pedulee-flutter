import 'package:flutter/material.dart';
import 'package:pedulee/widgets/title.dart';

AppBar appBarWidget() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 252, 243, 229),
    title: Image.asset(
      'assets/logo.png',
      scale: 2.5,
    ),

    centerTitle: true,
  );
}