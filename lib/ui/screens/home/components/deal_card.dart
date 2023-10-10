import 'package:flutter/material.dart';

import '../../../../state/models/deal_flight_model.dart';

// ignore: must_be_immutable
class DealCard extends StatelessWidget {
  DealsFlight deal;
  final Function press;

  DealCard({
    super.key,
    required this.deal,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      margin: const EdgeInsets.only(left: 5, right: 12, bottom: 10),
      decoration: BoxDecoration(
        //border: Border.all(color: colorBorder),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.24),
            offset: const Offset(1, 3),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              width: MediaQuery.of(context).size.width * 0.42,
              deal.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            //left: 12,
            bottom: 34,
            right: 12,
            //padding: EdgeInsets.symmetric(horizontal: 10),
            //decoration: BoxDecoration(color: Colors.white.withOpacity(0.85)),
            child: Text(
              deal.to,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.85),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "Đặt ngay",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
