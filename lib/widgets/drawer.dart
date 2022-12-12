// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pedulee/apps/blood/pages/history_blood.dart';
import 'package:pedulee/login_page.dart';
import 'package:pedulee/home_screen.dart';
import 'package:pedulee/apps/money/pages/money.dart';
import 'package:pedulee/apps/blood/pages/blood.dart';
import 'package:pedulee/apps/cloth/pages/cloth_history.dart';
import 'package:pedulee/apps/cloth/pages/cloth_form.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
            ],
          ),
          ExpansionTile(title: const Text("Clothes"), children: [
            ListTile(
              title: const Text("Add Clothes"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClothFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Clothes History"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ClothPage()),
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
                  MaterialPageRoute(builder: (context) => const HistoryBloodPage()),
                );
              },
            ),
          ]),
          ListTile(
            title: const Text("Logout"),
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
                  MaterialPageRoute(builder: (context) => const LoginPage()),
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
