import 'package:flutter/material.dart';
import 'package:pedulee/main.dart';
import 'package:pedulee/apps/money/pages/money.dart';

Drawer drawerBuild(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        // Menambahkan clickable menu
        ListTile(
          title: const Text('Home Page'),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ExpansionTile(
              title: Text("Donation"),
              children: <Widget>[
                ListTile(
                  title: const Text('Money'),
                  onTap: () {
                    // Route menu ke counter
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MoneyDonationPage()),
                    );
                  },
                ),
              ],
        ),
      ],
    ),
  );
}