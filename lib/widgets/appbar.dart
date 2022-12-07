import 'package:flutter/material.dart';
import 'package:pedulee/widgets/title.dart';

AppBar appBarWidget() {
  return AppBar(
    backgroundColor: Colors.orangeAccent.shade100.withOpacity(0.5),
    title: titleWidget('Pedulee'),
    // leading: ImageIcon(
    //   AssetImage("assets/logo.png"),
    // ),
    centerTitle: true,
  );
}