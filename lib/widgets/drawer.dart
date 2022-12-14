// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pedulee/apps/blood/pages/history_blood.dart';
import 'package:pedulee/login_page.dart';
import 'package:pedulee/home_screen.dart';
import 'package:pedulee/apps/money/pages/money.dart';
import 'package:pedulee/apps/blood/pages/blood.dart';
import 'package:pedulee/apps/money/pages/money_history.dart';
import 'package:pedulee/apps/cloth/pages/cloth_history.dart';
import 'package:pedulee/apps/cloth/pages/cloth_form.dart';
import 'package:pedulee/profile.dart';
import 'package:provider/provider.dart';
import 'package:pedulee/apps/helper/session.dart';

import 'package:pedulee/apps/grocery/pages/grocery_page.dart';
import 'package:pedulee/apps/grocery/pages/grocery_history.dart';

import '../apps/volunteer/form.dart';
import '../apps/volunteer/history.dart';
import '../projects_screen.dart';

Drawer drawerBuild(BuildContext context) {
  final request = context.watch<CookieRequest>();
  return Drawer(
    child: Container(
      color: const Color.fromARGB(255, 252, 243, 229),
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home Page'),
            //hoverColor: const Color.fromARGB(255, 248, 226, 190),
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
            title: const Text('Profile'),
            //hoverColor: const Color.fromARGB(255, 248, 226, 190),
            onTap: () {
              // Route menu ke counter
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
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
          ExpansionTile(title: const Text("Volunteer"), children: [
            ListTile(
              title: const Text('Participate'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VolunteerFormPage()),
                );
              },
            ),
            ListTile(
              title: Text("Volunteer History"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VolunteerPage()),
                );
              },
            ),
          ]),
          ExpansionTile(
            title: const Text("Donation"),
            children: <Widget>[
              ListTile(
                title: const Text('Donate Money'),
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
                title: const Text('Money History'),
                onTap: () {
                  // Route menu ke counter
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoneyHistoryPage()),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(title: Text("Grocery"), children: [
            ListTile(
              title: Text("Add Grocery"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GroceryDonationPage()),
                );
              },
            ),
            ListTile(
              title: Text("Grocery History"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const GroceryPage()),
                );
              },
            ),
          ]),
          ExpansionTile(title: Text("Clothes"), children: [
            ListTile(
              title: Text("Add Clothes"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ClothFormPage()),
                );
              },
            ),
            ListTile(
              title: Text("Clothes History"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ClothPage()),
                );
              },
            ),
          ]),
          ExpansionTile(title: const Text("Blood"), children: [
            ListTile(
              title: const Text("Add Blood"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BloodDonationPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Blood History"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoryBloodPage()),
                );
              },
            ),
          ]),
          ListTile(
            title: Text("Logout"),
            onTap: () async {
              final response = await request
                  .logout("https://pedulee.up.railway.app/auth/logout/");
              if (!request.loggedIn) {
                // Code here will run if the login succeeded.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Center(
                      child: Text(
                        "Logout Success!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ));
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                // Code here will run if the login failed (wrong username/password).
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Center(
                      child: Text(
                        "Logout failed!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ));
              }
            },
          ),
        ],
      ),
    ),
  );
}
