// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pedulee/apps/cloth/pages/cloth_history.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/widgets/appbar.dart';
import 'package:provider/provider.dart';
import 'package:pedulee/apps/helper/session.dart';
import 'dart:convert' as convert;

class ClothFormPage extends StatefulWidget {
  const ClothFormPage({Key? key}) : super(key: key);

  @override
  ClothFormPageState createState() => ClothFormPageState();
}

class ClothFormPageState extends State<ClothFormPage> {
  String model = 'Kemeja';
  List<String> listModel = [
    'Kemeja',
    'Kaos',
    'Celana',
    'Rok',
    'Sepatu',
    'Aksesoris',
    'Lainnya',
  ];
  String material = 'Katun';
  List<String> listMaterial = [
    'Katun',
    'Linen',
    'Denim',
    'Kulit',
    'Polyester',
    'Suede',
    'Sutra',
    'Velvet',
    'Rajut',
    'Rayon',
    'Jersey',
    'Twistcone',
    'Lainnya',
  ];
  String tipe = 'Perempuan';
  List<String> listTipe = [
    'Perempuan',
    'Laki-laki',
    'Anak perempuan',
    'Anak laki-laki',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      appBar: appBarWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: drawerBuild(context),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.fill, //agar rounded corner imagenya
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'CLOTHES DONATION',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18.0),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      const Text("Model"),
                      Container(
                        width: 220,
                        height: 55,
                        margin: const EdgeInsets.only(top: 3, bottom: 12),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 238, 241, 255),
                        ),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 41, 1, 186),
                                  width: 2),
                            ),
                          ),
                          dropdownColor:
                              const Color.fromARGB(255, 238, 241, 255),
                          value: model,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: listModel.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              model = newValue!;
                            });
                          },
                        ),
                      ),
                      const Text("Material"),
                      Container(
                        width: 220,
                        height: 55,
                        margin: const EdgeInsets.only(top: 3, bottom: 12),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 238, 241, 255),
                        ),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 41, 1, 186),
                                  width: 2),
                            ),
                          ),
                          dropdownColor:
                              const Color.fromARGB(255, 238, 241, 255),
                          value: material,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: listMaterial.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              material = newValue!;
                            });
                          },
                        ),
                      ),
                      const Text("Type"),
                      Container(
                        width: 220,
                        height: 55,
                        margin: const EdgeInsets.only(top: 3, bottom: 12),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 238, 241, 255),
                        ),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 41, 1, 186),
                                  width: 2),
                            ),
                          ),
                          dropdownColor:
                              const Color.fromARGB(255, 238, 241, 255),
                          value: tipe,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: listTipe.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              tipe = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 170, 196, 255),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: const Size(120, 50),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      final response = await request.postJson(
                          "https://pedulee.up.railway.app/cloth/create-flutter",
                          convert.jsonEncode({
                            'model': model.toString(),
                            'material': material.toString(),
                            'tipe': tipe.toString(),
                          }));

                      if (response["status"] == true) {
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const Center(
                              child: Text(
                                "Thank you for your donation!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ));
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ClothPage()),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const Center(
                              child: Text(
                                "Sorry, something went wrong",
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
          ],
        ),
      ),
    );
  }
}
