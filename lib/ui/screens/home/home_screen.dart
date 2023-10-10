import 'package:flutter_check_in_app/state/models/banner_model.dart';
import 'package:flutter_check_in_app/ui/screens/home/components/slider.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_check_in_app/ui/screens/home/components/deal_card.dart';
import 'package:flutter/material.dart';

import '../../../state/models/deal_flight_model.dart';
import '../../../ulitites/colors.dart';
import 'components/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: listBanners.length,
            itemBuilder: (context, index, realIndex) {
              return BannerCarouselSlider(
                banner: listBanners[index],
                press: () {},
              );
            },
            options: CarouselOptions(
              height: 280,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listBanners.map((image) {
              int index = listBanners.indexOf(image);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? priBlue : Colors.grey,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          Categories(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Điểm đến yêu thích",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Xem thêm",
                    style: TextStyle(fontSize: 12, color: priBlue)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listDealsFlight.length,
                itemBuilder: (context, index) =>
                    DealCard(deal: listDealsFlight[index], press: () {}),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Điểm đến yêu thích",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Xem thêm",
                  style: TextStyle(fontSize: 12, color: priBlue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listDealsFlight.length,
                itemBuilder: (context, index) =>
                    DealCard(deal: listDealsFlight[index], press: () {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
