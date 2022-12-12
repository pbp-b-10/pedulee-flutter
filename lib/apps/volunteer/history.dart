import 'package:flutter/material.dart';
import 'package:pedulee/models/volunteer.dart';
import 'package:pedulee/widgets/appbar.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:fluttericon/linecons_icons.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  _VolunteerPageState createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  late List<Volunteer>? data;

  @override
  void initState() {
    super.initState();
    data = getLocalData();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        drawer: drawerBuild(context),
        body: Stack(alignment: Alignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.fill,
            ),
          ),
          FutureBuilder<List<Volunteer>>(
              future: fetchData(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  data = snapshot.requireData;
                }
                if (data != null) {
                  if (data?.length == 0) {
                    return Column(
                      children: const [
                        Text(
                          "No Volunteers exist",
                          style:
                              TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  "${data![index].title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Divisi: ${data![index].divisi}",
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Text(
                                      "Volunteer: ${data![index].username}",
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Text(
                                      "Durasi: ${data![index].amount} hari",
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  data![index]
                                      .akhir_waktu
                                      .toString()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }
                return const Center(child: CircularProgressIndicator());
              })
        ]));
  }
}
