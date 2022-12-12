import 'package:flutter/material.dart';
import 'package:pedulee/models/project.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String content;
  final String imageURL;
  final String url;
  static TextStyle titleStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0);

  const ProjectCard({
    super.key,
    required this.title,
    required this.content,
    required this.imageURL,
    required this.url,
  });
  factory ProjectCard.fromProject(Project project) {
    return ProjectCard(
        title: project.title,
        content: project.description,
        imageURL: project.image,
        url: project.link);
  }

  void onClickMoreInfo() async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Could not launch $url";
    }

  void onClickMoreInfo() async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Could not launch $url";
    }
  }


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(125, 255, 255, 255)),
        child: Column(
          children: [
            Image.network(imageURL, fit: BoxFit.fill),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(content, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: onClickMoreInfo,
                    child: const Text('More Info'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
