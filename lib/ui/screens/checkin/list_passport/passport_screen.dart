import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/list_passport/components/select_passenger_for_passport.dart';

import '../../../../ulitites/Colors.dart';
import '../selectPassengerForSeat/seat_screen.dart';
import 'components/background.dart';

class PassportScreen extends StatelessWidget {
  const PassportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bg,
      child: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: BackgroundPassport(),
            ),
            Positioned(
                left: 0,
                right: 0,
                //top: 120,
                bottom: 20,
                child: Column(
                  children: [
                    const SelectPassengerForPassport(),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SeatScreen();
                        }));
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "TIẾP TỤC",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 12),
                          backgroundColor: priBlue,
                          shape: const StadiumBorder() // Background color
                          ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
