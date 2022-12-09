import 'package:flutter/material.dart';
import 'package:pedulee/apps/volunteer/form.dart';
import 'package:pedulee/home_screen.dart';
import 'package:pedulee/apps/money/pages/money.dart';
import 'package:pedulee/projects_screen.dart';

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
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        // Menambahkan clickable menu
        ListTile(
          title: const Text('Projects'),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProjectsScreen()),
            );
          },
        ),
        // Menambahkan clickable menu
        ListTile(
          title: const Text('Volunteer'),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const VolunteerFormPage()),
            );
          },
        ),
        ExpansionTile(
          title: const Text("Donation"),
          children: <Widget>[
            ListTile(
              title: const Text('Money'),
              onTap: () {
                // Route menu ke counter
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MoneyDonationPage()),
                );
              },
            ),
            ListTile(
                title: const Text('Blood'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoneyDonationPage()),
                  );
                })
          ],
        ),
      ],
    ),
  );
}
