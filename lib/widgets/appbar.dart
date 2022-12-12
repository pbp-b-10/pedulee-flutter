import 'package:flutter/material.dart';

AppBar appBarWidget() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 252, 243, 229),
    title: Image.asset(
      'assets/logo.png',
      scale: 2.5,
    ),
    iconTheme: const IconThemeData(color: Colors.black),

    centerTitle: true,
  );
}