import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pedulee/widgets/drawer.dart';
import 'package:pedulee/widgets/footer.dart';
import 'package:pedulee/widgets/card.dart';
import 'package:pedulee/widgets/title.dart';
import 'package:pedulee/widgets/appbar.dart';

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
            const SizedBox(
              height: 30,
            ),
            cardWidget(
                title: 'Air untuk Jayapura',
                content:
                    'Debit air dari sejumlah mata air di Kota Jayapura turun drastis hingga lebih dari 50 persen',
                imagePath: 'assets/wcwlwmg3ipwxtdjojfzw.jpg',
                url:
                    'https://www.kompas.id/baca/nusantara/2020/09/10/kota-jayapura-terancam-krisis-air-bersih'),
            cardWidget(
                title: 'Bantuan untuk Ambon',
                content:
                    'Sebanyak 1.135 keluarga yang terdiri atas 4.706 jiwa, menghadapi dampak banjir dan tanah longsor di wilayah Kota Ambon',
                imagePath: 'assets/61f8d613d1413.jpg',
                url:
                    'https://ambon.antaranews.com/berita/127753/1153-keluarga-terdampak-banjir-dan-tanah-longsor-di-ambon-turut-prihatin'),
            cardWidget(
                title: 'Halmahera Barat Terguncang',
                content:
                    'Terjadi gempa bumi berkekuatan 5.9 M pada kedalaman 10 km di Kabupaten Halmahera Barat',
                imagePath: 'assets/1674672637.jpeg',
                url:
                    'https://pusatkrisis.kemkes.go.id/Gempa-Bumi-di-HALMAHERA-BARAT-MALUKU-UTARA-14-08-2022-73'),
            cardWidget(
                title: 'Musi Rawas Utara Tertiup Angin',
                content:
                    'BPBD Sumatera Selatan mencatat 58 rumah warga di Kabupaten Musi Rawas Utara rusak dihantam angin puting beliung',
                imagePath: 'assets/kfbdhjbgragjkre.jpg',
                url:
                    'https://www.gatra.com/news-534824-kebencanaan-angin-puting-beliung-rusak-58-rumah-di-musi-rawas-utara.html'),
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
