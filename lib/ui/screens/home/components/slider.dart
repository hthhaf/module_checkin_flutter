import 'package:flutter_check_in_app/state/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BannerCarouselSlider extends StatelessWidget {
  BannerSlider banner;
  final Function press;
  BannerCarouselSlider({
    Key? key,
    required this.banner,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 12),
      decoration: BoxDecoration(
        //border: Border.all(color: colorBorder, width: 0.6),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.24),
            offset: const Offset(1, 2),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              height: 215,
              width: MediaQuery.of(context).size.width,
              banner.image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  banner.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('dd/MM/yyy').format(banner.createdDate),
                        style: const TextStyle(fontSize: 12)),
                    const Text("Xem chi tiết",
                        style: TextStyle(fontSize: 12, color: priBlue)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
