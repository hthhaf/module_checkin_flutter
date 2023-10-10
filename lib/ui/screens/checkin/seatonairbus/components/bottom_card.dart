import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';
//import 'package:flutter_check_in_app/ui/screens/check-in/selectPassengerForSeat/seat_screen.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';
import 'package:provider/provider.dart';

import '../../../../../state/providers/seat_provider.dart';

// ignore: must_be_immutable
class BottomCard extends StatefulWidget {
  SeatModel seat;

  BottomCard({
    super.key,
    required this.seat,
  });
  @override
  // ignore: library_private_types_in_public_api
  _BottomCardState createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: 104,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.5),
            offset: const Offset(10, 2),
            spreadRadius: 3,
            blurRadius: 18,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ghế",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    height: 20,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1, // The number of items in your list
                      itemBuilder: (BuildContext context, int index) {
                        if (index < 0) {
                          return Text(
                            '${widget.seat.row}${widget.seat.seat}, ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          );
                        } else {
                          return Text(
                            '${widget.seat.row}${widget.seat.seat} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Text(
                    '1 ghế    ',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    'VND ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<SeatProvider>(context, listen: false)
                      .toggleElement(false);
                  Provider.of<SeatProvider>(context, listen: false)
                      .updateSeatAssignment();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 58, vertical: 12),
                  backgroundColor: priBlue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                child: const Text(
                  'XÁC NHẬN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
