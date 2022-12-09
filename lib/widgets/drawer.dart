import 'package:flutter/material.dart';
import 'package:pedulee/login_page.dart';
import 'package:pedulee/main.dart';
import 'package:pedulee/apps/money/pages/money.dart';
import 'package:pedulee/apps/cloth/pages/cloth_history.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

Drawer drawerBuild(BuildContext context) {
  final request = context.watch<CookieRequest>();
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
        ExpansionTile(
          title: Text("Clothes"),
          children: [
              ListTile( 
                title: Text("Clothes History"),
                onTap: (){ 
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ClothPage()),
                    );
                  },
                ),
              ]
        ),
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
                          MaterialPageRoute(
                              builder: (context) => LoginPage()),
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
  );
}