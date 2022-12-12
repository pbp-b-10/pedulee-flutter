import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pedulee/apps/project/card.dart';
import 'package:pedulee/models/project.dart';
import 'package:pedulee/models/storage.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/widgets/footer.dart';
import 'package:pedulee/widgets/title.dart';
import 'package:pedulee/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<DjangoModelItem<Project>>? data;

  @override
  void initState() {
    super.initState();
    data = getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(),
        drawer: drawerBuild(context),
        body: bodyWidget(context),
      ),
    );
  }

  Stack bodyWidget(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/bg.jpg',
            fit: BoxFit.fill, //agar rounded corner imagenya
          ),
        ),
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            const Banner(),
            const SizedBox(
              height: 20,
            ),
            Center(child: titleWidget('On Going Project')),
            FutureBuilder<List<DjangoModelItem<Project>>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  data = snapshot.requireData;
                }
                if (data != null) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 40),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: data!
                              .map<Widget>(
                                (e) => ProjectCard.fromProject(e.fields),
                              )
                              .expand((element) => [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    element,
                                  ])
                              .toList()),
                    ),
                  );
                }
                return const Text("No internet");
              },
            ),
            footerWidget()
          ],
        ),
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(boxShadow: [kShadowWidget()]),
      child: Stack(
        children: [
          CarouselSlider(
              items: [
                bannerItem('carousel-1.jpg', context),
                bannerItem('carousel-2.jpg', context),
                bannerItem('carousel-3.jpg', context),
              ],
              options: CarouselOptions(
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 500))),
          dots()
        ],
      ),
    );
  }

  BoxShadow kShadowWidget() {
    return BoxShadow(
        blurRadius: 20.0,
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 2.0,
        offset: const Offset(5, 10));
  }

  Widget dots() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dot(),
          dot(),
          dot(),
          dot(),
          dot(),
        ],
      ),
    );
  }

  Widget dot() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: 10,
      height: 10,
      decoration:
          const BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
    );
  }

  Widget bannerItem(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/$imagePath',
                fit: BoxFit.cover, //agar rounded corner imagenya
              )),
        ),
      ),
    );
  }
}
