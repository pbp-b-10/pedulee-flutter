import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pedulee/apps/helper/session.dart';
import 'package:pedulee/apps/volunteer/history.dart';
import 'package:pedulee/models/storage.dart';
import 'package:pedulee/models/project.dart';
import 'package:pedulee/models/volunteer.dart' as volunteer_pkg;
import 'package:pedulee/widgets/drawer.dart';
import 'package:provider/provider.dart';

class VolunteerFormPage extends StatefulWidget {
  const VolunteerFormPage({super.key});

  @override
  State<VolunteerFormPage> createState() => _VolunteerFormPageState();
}

class _VolunteerFormPageState extends State<VolunteerFormPage> {
  final _formKey = GlobalKey<FormState>();
  DjangoModelItem<Project>? selected;
  String? divisi;
  int amount = 0;

  late List<DjangoModelItem<Project>> data;

  @override
  void initState() {
    super.initState();
    data = getLocalData();
  }

  final imageURL = "https://pedulee.up.railway.app/static/images/Volunteer.png";

  final dropDownDecorator = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      contentPadding: const EdgeInsets.all(10));

  @override
  Widget build(BuildContext context) {
    const postURL = "https://pedulee.up.railway.app/volunteer/create";
    final request = context.watch<CookieRequest>();
    void successToast() {
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
              "Thank you for your volunteer!",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const VolunteerPage()),
      );
    }

    void errorToast() {
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
              "Sorry, something went wrong",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
    }

    void onSubmit() async {
      if (_formKey.currentState!.validate()) {
        final statusCode = await request.postForm(postURL, {
          'project': selected?.pk.toString(),
          'divisi': divisi,
        });

        if (statusCode == 201) {
          successToast();
        } else {
          errorToast();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer'),
      ),
      // Menambahkan drawer menu
      drawer: drawerBuild(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.network(imageURL, fit: BoxFit.fill),
                InputDecorator(
                  decoration: dropDownDecorator,
                  child: ButtonTheme(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: DropdownButton<DjangoModelItem<Project>>(
                      hint: const Text("Daftar Projek"),
                      isExpanded: true,
                      elevation: 16,
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      onChanged: (DjangoModelItem<Project>? newValue) {
                        setState(() {
                          amount = 0;
                          if (newValue != null) {
                            selected = newValue;
                            amount = newValue.fields.akhir_waktu
                                .difference(DateTime.now())
                                .inDays;
                          }
                        });
                      },
                      value: selected,
                      items: data
                          .map<DropdownMenuItem<DjangoModelItem<Project>>>(
                            (e) => DropdownMenuItem<DjangoModelItem<Project>>(
                              value: e,
                              child: Text(e.fields.title),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                InputDecorator(
                  decoration: dropDownDecorator,
                  child: ButtonTheme(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: DropdownButton<String>(
                      hint: const Text("Bidang Project"),
                      isExpanded: true,
                      value: divisi,
                      elevation: 16,
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          divisi = newValue!;
                        });
                      },
                      items: volunteer_pkg.Volunteer.DIVISI_CHOICES
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                InputDecorator(
                  decoration: dropDownDecorator,
                  child: ButtonTheme(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: DropdownButton<String>(
                        hint: Text("Durasi: $amount"),
                        isExpanded: true,
                        value: divisi,
                        elevation: 16,
                        underline: DropdownButtonHideUnderline(
                          child: Container(),
                        ),
                        onChanged: null,
                        items: null),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: onSubmit,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ]
                  .expand((element) => [
                        const SizedBox(
                          height: 10,
                        ),
                        element
                      ])
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
