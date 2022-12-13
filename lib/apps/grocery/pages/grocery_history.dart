import 'package:flutter/material.dart';
import 'package:pedulee/apps/grocery/pages/fetchGrocery.dart';
import 'package:pedulee/widgets/appbar.dart';
import 'package:pedulee/widgets/drawer.dart';

class GroceryPage extends StatefulWidget {
  const GroceryPage({Key? key}) : super(key: key);

  @override
  GroceryPageState createState() => GroceryPageState();
}

class GroceryPageState extends State<GroceryPage> {

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
          FutureBuilder(
              future: fetchGrocery(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "No groceries exist",
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
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  "${snapshot.data![index].fields.address}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "${snapshot.data![index].fields.amount}, ${snapshot.data![index].fields.donasi}",
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                trailing: Text(
                                  "${snapshot.data![index].fields.username}, ${snapshot.data![index].fields.date.toString().substring(0, 10)}",
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }
              })
        ]));
  }
}
