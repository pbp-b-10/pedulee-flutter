import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
            cardWidget(
                title: 'Air untuk Jayapura',
                content:
                    'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                imagePath: 'assets/wcwlwmg3ipwxtdjojfzw.jpg'),
            cardWidget(
                title: 'Bantuan untuk Ambon',
                content:
                    'Sebanyak 1.135 keluarga yang terdiri atas 4.706 jiwa, menghadapi dampak banjir dan tanah longsor di wilayah Kota Ambon',
                imagePath: 'assets/61f8d613d1413.jpg'),
            cardWidget(
                title: 'Halmahera Barat Terguncang',
                content:
                    'Terjadi gempa bumi berkekuatan 5.9 M pada kedalaman 10 km di Kabupaten Halmahera Barat',
                imagePath: 'assets/1674672637.jpeg'),
            cardWidget(
                title: 'Musi Rawas Utara Tertiup Angin',
                content:
                    'BPBD Sumatera Selatan mencatat 58 rumah warga di Kabupaten Musi Rawas Utara rusak dihantam angin puting beliung',
                imagePath: 'assets/kfbdhjbgragjkre.jpg'),
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
          Text('Proyek Tengah Semester PBP B-10'),
          const SizedBox(
            height: 30,
          ),
          titleWidget('Contributors'),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
                'Alvin Widi Nugroho \nDaffa Muhammad Faizan \nGhayda Rafa Hernawan \nMarietha Asnat Nauli Sitompul \nRakhan Yusuf Rivesa'),
          )
        ],
      );

  Widget cardWidget(
      {required String title,
      required String content,
      required String imagePath}) {
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
              ElevatedButton(onPressed: () {}, child: const Text('More Info')),
            ],
          ),
        ),
      ),
    );
  }

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
