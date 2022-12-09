import 'package:pedulee/main.dart';
import 'package:flutter/material.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/apps/cloth/pages/fetchcloth.dart';
import 'package:fluttericon/linecons_icons.dart';

class ClothPage extends StatefulWidget {
  const ClothPage({Key? key}) : super(key: key);

  @override
  _ClothPageState createState() => _ClothPageState();
}

class _ClothPageState extends State<ClothPage> {
  // String cloth_model = "Celana";

  // showIcon() {
  //   if (cloth_model == "Celana") {
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clothes History'),
        ),
        drawer: drawerBuild(context),
        body: FutureBuilder(
            future: fetchCloth(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "No clothes exist",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: 
                                ListTile(
                                  leading: Icon(Linecons.t_shirt),
                                  title: Text(
                                    "${snapshot.data![index].fields.clothModel}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${snapshot.data![index].fields.material}, ${snapshot.data![index].fields.type}",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  trailing: Text(
                                    "${snapshot.data![index].fields.date.toString().substring(0, 10)}",
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
            }));
  }
}
