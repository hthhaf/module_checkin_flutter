import 'package:flutter_check_in_app/ulitites/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  List<Icon> cateIcons = [
    const Icon(Icons.airplane_ticket, color: priBlue, size: 24),
    const Icon(Icons.bed, color: priBlue, size: 24),
    const Icon(Icons.local_taxi, color: priBlue, size: 24),
    const Icon(Icons.luggage, color: priBlue, size: 24),
  ];

  List<String> cateName = [
    "Đặt vé",
    "Khách sạn",
    "Xe",
    "Hành lý",
  ];

  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cateIcons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                child: cateIcons[index],
              ),
              Text(
                cateName[index],
                style: const TextStyle(
                  color: textBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
