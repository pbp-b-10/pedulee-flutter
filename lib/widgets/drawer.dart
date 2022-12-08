import 'package:flutter/material.dart';
import 'package:pedulee/home_screen.dart';
import 'package:pedulee/apps/money/pages/money.dart';

Drawer drawerBuild(BuildContext context) {
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
                    //hoverColor: const Color.fromARGB(255, 248, 226, 190),
                    onTap: () {
                      // Route menu ke counter
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MoneyDonationPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Blood'),
                    //hoverColor: const Color.fromARGB(255, 248, 226, 190),
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MoneyDonationPage()),
                      );
                    }
                  )
                ],
          ),
        ],
      ),
    ),
  );
}