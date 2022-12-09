import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pedulee/apps/project/card.dart';
import 'package:pedulee/models/django_model.dart';
import 'package:pedulee/models/project.dart';
import 'package:pedulee/widgets/drawer.dart';

String exampleJSON =
    '[{"model": "pedulee.project", "pk": 1, "fields": {"title": "Air untuk Jayapura", "description": "Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen", "link": "https://www.kompas.id/baca/nusantara/2020/09/10/kota-jayapura-terancam-krisis-air-bersih", "image": "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg", "amount": 10000000, "akhir_waktu": "2022-12-10"}}, {"model": "pedulee.project", "pk": 3, "fields": {"title": "Bantuan untuk Ambon", "description": "Sebanyak 1.135 keluarga yang terdiri atas 4.706 jiwa, menghadapi dampak banjir dan tanah longsor di wilayah Kota Ambon", "link": "https://ambon.antaranews.com/berita/127753/1153-keluarga-terdampak-banjir-dan-tanah-longsor-di-ambon-turut-prihatin", "image": "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/07/12/1674672637.jpeg", "amount": 50000000, "akhir_waktu": "2022-11-24"}}, {"model": "pedulee.project", "pk": 2, "fields": {"title": "Halmahera Barat Terguncang", "description": "Terjadi gempa bumi berkekuatan 5.9 M pada kedalaman 10 km di Kabupaten Halmahera Barat", "link": "https://pusatkrisis.kemkes.go.id/Gempa-Bumi-di-HALMAHERA-BARAT-MALUKU-UTARA-14-08-2022-73", "image": "https://pusatkrisis.kemkes.go.id/__asset/__images/content/65gempa%20bumi%20halmahera%20barat,%2006-12-2017.jpg", "amount": 5000000, "akhir_waktu": "2023-02-01"}}, {"model": "pedulee.project", "pk": 4, "fields": {"title": "Musi Rawas Utara Tertiup Angin", "description": "BPBD Sumatera Selatan mencatat 58 rumah warga di Kabupaten Musi Rawas Utara rusak dihantam angin puting beliung", "link": "https://www.gatra.com/news-534824-kebencanaan-angin-puting-beliung-rusak-58-rumah-di-musi-rawas-utara.html", "image": "https://asset.kompas.com/crops/Iyy8npUh_gKc6pW40PS4Xh02cdE=/0x0:0x0/750x500/data/photo/2022/02/01/61f8d613d1413.jpg", "amount": 2000000, "akhir_waktu": "2023-07-17"}}]';
List<dynamic> list = json.decode(exampleJSON);

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
                children: list
                    .map<Widget>(
                      (e) => ProjectCard.fromProject(
                          DjangoModelItem.fromJson(e, ProjectSerializer())
                              .fields),
                    )
                    .expand((element) => [
                          element,
                          const SizedBox(
                            height: 20,
                          )
                        ])
                    .toList()

                // [
                //   const ProjectCard(
                //       title: "Air untuk Jayapura",
                //       content:
                //           'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                //       imageURL:
                //           'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg',
                //       url: 'url'),
                //   const ProjectCard(
                //       title: "Air untuk Jayapura",
                //       content:
                //           'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                //       imageURL:
                //           'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg',
                //       url: 'url'),
                //   const ProjectCard(
                //       title: "Air untuk Jayapura",
                //       content:
                //           'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                //       imageURL:
                //           'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg',
                //       url: 'url'),
                // ]
                //     .expand((element) => [
                //           element,
                //           const SizedBox(
                //             height: 20,
                //           )
                //         ])
                //     .toList()
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
