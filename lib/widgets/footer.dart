import 'package:flutter/material.dart';
import 'package:pedulee/widgets/title.dart';

Column footerWidget() => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(
      height: 30,
    ),
    const Divider(
      color: Colors.black54,
      thickness: 1,
    ),
    const SizedBox(
      height: 30,
    ),
    Image.asset(
      'assets/logo.png',
      scale: 2.5,
    ),
    const SizedBox(
      height: 30,
    ),
    const Text('Proyek Akhir Semester PBP B-10'),
    const SizedBox(
      height: 30,
    ),
    titleWidget('Contributors'),
    const SizedBox(
      height: 20,
    ),
    const Center(
      child: Text(
          'Alvin Widi Nugroho \nDaffa Muhammad Faizan \nGhayda Rafa Hernawan \nMarietha Asnat Nauli Sitompul \nRakhan Yusuf Rivesa'),
    ),
    const SizedBox(
      height: 60,
    ),
  ],
);