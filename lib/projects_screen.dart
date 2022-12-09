import 'package:flutter/material.dart';
import 'package:pedulee/apps/project/card.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchProjects() {
  return http.get(Uri.parse('https://pedulee.up.railway.app/api/projects/'));
}

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final String title = "Projects";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ProjectCard(
                      title: "Air untuk Jayapura",
                      content:
                          'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                      imageURL:
                          'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg',
                      url: 'url'),
                  const ProjectCard(
                      title: "Air untuk Jayapura",
                      content:
                          'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                      imageURL:
                          'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg',
                      url: 'url'),
                  const ProjectCard(
                      title: "Air untuk Jayapura",
                      content:
                          'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                      imageURL:
                          'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg',
                      url: 'url'),
                ]
                    .expand((element) => [
                          element,
                          const SizedBox(
                            height: 20,
                          )
                        ])
                    .toList()
                // .map((e) => Padding(
                //       padding: EdgeInsets.symmetric(vertical: 10),
                //       child: e,
                //     ))
                // .toList(),
                ),
          ),
        )
      ]),
    );
  }
}
