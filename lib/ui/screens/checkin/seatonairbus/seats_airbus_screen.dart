import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/providers/seat_provider.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/seatonairbus/components/bottom_card.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/seatonairbus/components/dropdown.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/seatonairbus/components/swing.dart';
import 'package:flutter_check_in_app/ui/shared/navbar_custom_widget.dart';
import 'package:provider/provider.dart';

import '../../../../ulitites/Colors.dart';
import 'components/seats_on_airbus.dart';

// ignore: must_be_immutable
class SeatsAirbus extends StatefulWidget {
  dynamic retrieveSeats;
  SeatsAirbus({super.key, required this.retrieveSeats});

  @override
  // ignore: library_private_types_in_public_api
  _SeatAirbusState createState() => _SeatAirbusState();
}

class _SeatAirbusState extends State<SeatsAirbus> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                'assets/images/bgclouds.jpg',
              ),
              colorFilter: ColorFilter.mode(
                  priBlue.withOpacity(0.32), BlendMode.srcATop),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              NavBarCustom(
                text: 'Chọn ghế',
              ),
              const SelectPassenger(),
              Expanded(
                child: Stack(
                  children: [
                    SeatsOnAirbus(retrieveSeats: widget.retrieveSeats),
                    const SwingLeftWidget(),
                    const SwingRightWidget(),
                  ],
                ),
              ),
              Consumer<SeatProvider>(
                builder: (context, seatProvider, _) {
                  return Visibility(
                    visible: seatProvider.toggleBottomCard,
                    child: BottomCard(
                      seat: seatProvider.seat,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
