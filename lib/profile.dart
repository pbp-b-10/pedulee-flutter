// ignore_for_file: sort_child_properties_last
import 'dart:convert';

import 'package:pedulee/apps/helper/session.dart';
import 'package:flutter/material.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/widgets/appbar.dart';
import 'package:provider/provider.dart';
// import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:pedulee/apps/grocery/models/profile_model.dart';
import 'package:http/http.dart' as http;



class ProfilePage extends StatefulWidget {
    const ProfilePage({Key? key}) : super(key: key);

    @override
    State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 Future<List<Profile>> fetchGrocery() async {
        var url = Uri.parse('https://pedulee.up.railway.app/history/api/groceries/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Grocery
        List<Profile> listProfile = [];
        for (var d in data) {
        if (d != null) {
            listProfile.add(Profile.fromJson(d));
        }
        }

        return listProfile;
    }
    


    @override
    Widget build(BuildContext context) {
        // final request = context.watch<CookieRequest>();
        final request = context.watch<CookieRequest>();
    return Scaffold(            
      appBar: appBarWidget(),
            // Menambahkan drawer menu
      drawer: drawerBuild(context),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 255, 209, 82), Color.fromARGB(255, 247, 93, 42)]
              )
            ),
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                      ),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Fullname",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "nama panjang",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Birthdate",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Tanggal Lahir",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Text(
                                    "Phone Number",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Phone Number",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Alamat",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('ALAMAT',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,


          ),
        ],
      ),
    );
  }
}