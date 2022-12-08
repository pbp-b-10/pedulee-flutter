import 'package:flutter/material.dart';
import 'package:pedulee/widgets/title.dart';
import 'package:url_launcher/url_launcher.dart';

Widget cardWidget(
    {required String title,
    required String content,
    required String imagePath,
    required String url}) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: titleWidget(title),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              ElevatedButton(onPressed: () {
                launchUrl(Uri.parse(url));
              }, child: const Text('More Info')),
            ],
          ),
        ),
      ),
    );
  }