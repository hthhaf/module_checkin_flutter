import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../../ulitites/colors.dart';

// ignore: must_be_immutable
class Details1 extends StatelessWidget {
  String origin, destination;
  DateTime flightDate;
  Details1({
    super.key,
    required this.origin,
    required this.destination,
    required this.flightDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.3,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white.withOpacity(0.42),
                child: Text(
                  origin,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            DateFormat('dd/MM/yyyy').format(flightDate),
            style: const TextStyle(
              height: 3,
              color: white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.3,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white.withOpacity(0.42),
            child: Text(
              destination,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
