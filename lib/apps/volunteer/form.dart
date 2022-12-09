import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pedulee/models/django_model.dart';
import 'package:pedulee/models/project.dart';
import 'package:pedulee/models/volunteer.dart';
import 'package:pedulee/widgets/drawer.dart';

String exampleJSON =
    '[{"model": "pedulee.project", "pk": 1, "fields": {"title": "Air untuk Jayapura", "description": "Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen", "link": "https://www.kompas.id/baca/nusantara/2020/09/10/kota-jayapura-terancam-krisis-air-bersih", "image": "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg", "amount": 10000000, "akhir_waktu": "2022-12-10"}}, {"model": "pedulee.project", "pk": 3, "fields": {"title": "Bantuan untuk Ambon", "description": "Sebanyak 1.135 keluarga yang terdiri atas 4.706 jiwa, menghadapi dampak banjir dan tanah longsor di wilayah Kota Ambon", "link": "https://ambon.antaranews.com/berita/127753/1153-keluarga-terdampak-banjir-dan-tanah-longsor-di-ambon-turut-prihatin", "image": "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/07/12/1674672637.jpeg", "amount": 50000000, "akhir_waktu": "2022-11-24"}}, {"model": "pedulee.project", "pk": 2, "fields": {"title": "Halmahera Barat Terguncang", "description": "Terjadi gempa bumi berkekuatan 5.9 M pada kedalaman 10 km di Kabupaten Halmahera Barat", "link": "https://pusatkrisis.kemkes.go.id/Gempa-Bumi-di-HALMAHERA-BARAT-MALUKU-UTARA-14-08-2022-73", "image": "https://pusatkrisis.kemkes.go.id/__asset/__images/content/65gempa%20bumi%20halmahera%20barat,%2006-12-2017.jpg", "amount": 5000000, "akhir_waktu": "2023-02-01"}}, {"model": "pedulee.project", "pk": 4, "fields": {"title": "Musi Rawas Utara Tertiup Angin", "description": "BPBD Sumatera Selatan mencatat 58 rumah warga di Kabupaten Musi Rawas Utara rusak dihantam angin puting beliung", "link": "https://www.gatra.com/news-534824-kebencanaan-angin-puting-beliung-rusak-58-rumah-di-musi-rawas-utara.html", "image": "https://asset.kompas.com/crops/Iyy8npUh_gKc6pW40PS4Xh02cdE=/0x0:0x0/750x500/data/photo/2022/02/01/61f8d613d1413.jpg", "amount": 2000000, "akhir_waktu": "2023-07-17"}}]';
List<dynamic> list = json.decode(exampleJSON);

class VolunteerFormPage extends StatefulWidget {
  const VolunteerFormPage({super.key});

  @override
  State<VolunteerFormPage> createState() => _VolunteerFormPageState();
}

class _VolunteerFormPageState extends State<VolunteerFormPage> {
  final _formKey = GlobalKey<FormState>();
  String fullName = "";
  String email = "";
  int? phoneNumber = 0;
  int? amount = 0;
  String? paymentMethod;
  int project_id = 0;
  int? ccNumber = 0;
  Volunteer form = Volunteer(project_id: 0, divisi: "", durasi: 0);
  @override
  Widget build(BuildContext context) {
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
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  child: ButtonTheme(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: DropdownButton<int>(
                      hint: const Text("Daftar Projek"),
                      isExpanded: true,
                      value: project_id,
                      elevation: 16,
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      onChanged: (int? newValue) {
                        setState(() {
                          project_id = newValue!;
                        });
                      },
                      items: list.map<DropdownMenuItem<int>>(
                        (e) {
                          DjangoModelItem<Project> item =
                              DjangoModelItem.fromJson(e, ProjectSerializer());
                          return DropdownMenuItem<int>(
                            value: item.pk,
                            child: Text(item.fields.title),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  child: ButtonTheme(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: DropdownButton<String>(
                      hint: const Text("Bidang Project"),
                      isExpanded: true,
                      value: paymentMethod,
                      elevation: 16,
                      underline: DropdownButtonHideUnderline(
                        child: Container(),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          paymentMethod = newValue!;
                        });
                      },
                      items: Volunteer.DIVISI_CHOICES
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "100000",
                    labelText: "Durasi",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      amount = int.tryParse(value!);
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      amount = int.tryParse(value!);
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Donation amount can't be empty!";
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // ListVolunteer.data.add(Volunteer(fullName, email, phoneNumber,
                        //     amount, paymentMethod, ccNumber));
                      }
                    },
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
