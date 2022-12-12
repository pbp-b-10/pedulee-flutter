import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pedulee/apps/project/card.dart';
import 'package:pedulee/models/storage.dart';
import 'package:pedulee/models/project.dart';
import 'package:pedulee/widgets/appbar.dart';
import 'package:pedulee/widgets/drawer.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final String title = "Projects";

  late List<DjangoModelItem<Project>>? data;

  @override
  void initState() {
    super.initState();
    data = getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      // Menambahkan drawer menu
      drawer: drawerBuild(context),
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/bg.jpg',
            fit: BoxFit.fill, //agar rounded corner imagenya
          ),
        ),
        FutureBuilder<List<DjangoModelItem<Project>>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              data = snapshot.requireData;
            }
            if (data != null) {
              return SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: data!
                          .map<Widget>(
                            (e) => ProjectCard.fromProject(e.fields),
                          )
                          .expand((element) => [
                                element,
                                const SizedBox(
                                  height: 20,
                                )
                              ])
                          .toList()),
                ),
              );
            }
            return const Text("No internet");
          },
        )
      ]),
    );
  }
}
