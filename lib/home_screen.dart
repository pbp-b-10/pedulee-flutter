import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pedulee/apps/project/card.dart';
import 'package:pedulee/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            const SizedBox(
              height: 30,
            ),
            const ProjectCard(
                title: "Air untuk Jayapura",
                content:
                    'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                imageURL:
                    'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1601362955/wcwlwmg3ipwxtdjojfzw.jpg',
                url: 'url'),
            footerWidget()
          ],
        ),
      ],
    );
  }

  Column footerWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          const SizedBox(
            height: 30,
          ),
          titleWidget('Pedulee'),
          const SizedBox(
            height: 20,
          ),
          const Text('Proyek Tengah Semester PBP B-10'),
          const SizedBox(
            height: 30,
          ),
          titleWidget('Contributors'),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
                'Alvin Widi Nugroho \nDaffa Muhammad Faizan \nGhayda Rafa Hernawan \nMarietha Asnat Nauli Sitompul \nRakhan Yusuf Rivesa'),
          )
        ],
      );

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: Colors.orangeAccent.shade100.withOpacity(0.5),
      title: titleWidget('Pedulee'),
      centerTitle: true,
    );
  }

  Widget titleWidget(String s) {
    return Text(
      s,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
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
