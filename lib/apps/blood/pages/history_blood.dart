import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedulee/widgets/drawer.dart';

class HistoryBloodPage extends StatefulWidget{
  const HistoryBloodPage({super.key});

  @override
  State<HistoryBloodPage> createState() => _HistoryBloodPageState();
}
class _HistoryBloodPageState extends State<HistoryBloodPage>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("History Blood"),
      ),
      drawer: drawerBuild(context),
      body: Form(
        key: _formKey,
        child:
        Container(
        width: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg.jpg'),fit:BoxFit.cover),
        ),
        ),
      ),
    );
  }
}
