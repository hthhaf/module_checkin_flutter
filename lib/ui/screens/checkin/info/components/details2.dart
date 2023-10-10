import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../../ulitites/colors.dart';

// ignore: must_be_immutable
class Details2 extends StatelessWidget {
  String originName, destinationName;
  DateTime departureTime, arrivaltime;
  int duration;

  Details2({
    super.key,
    required this.originName,
    required this.destinationName,
    required this.departureTime,
    required this.arrivaltime,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    String depTimeFormat = DateFormat('HH:mm').format(departureTime);
    String arrTimeFormat = DateFormat('HH:mm').format(arrivaltime);
    int hours = duration ~/ 3600;
    int minutes = (duration % 3600) ~/ 60;

    String durationTimeFormat =
        '${hours.toString().padLeft(2, '')}h, ${minutes.toString().padLeft(2, '0')}m';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.33,
          child: Column(
            children: [
              Text(
                originName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                depTimeFormat,
                style: const TextStyle(
                  height: 2,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24, // Adjust line width as needed
                height: 1,
                color: Colors.white,
              ),
              Container(
                width: 68,
                padding: const EdgeInsets.symmetric(vertical: 3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  durationTimeFormat,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 24, // Adjust line width as needed
                height: 1,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.33,
          child: Column(
            children: [
              Text(
                destinationName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                arrTimeFormat,
                style: const TextStyle(
                  height: 2,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
