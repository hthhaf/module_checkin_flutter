import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/seat_assignment_model.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';
import 'package:flutter_check_in_app/state/services/apis/save_pnr_api.dart';
import 'package:flutter_check_in_app/state/services/apis/seat_assignment_api.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../state/models/retrieve_pnr_custom_model.dart';
import '../../../../state/providers/auth_provider.dart';
import '../../../../state/providers/seat_provider.dart';
import '../../../../state/services/apis/checkin_api.dart';
import '../../../../state/services/apis/retrieve_seat_availability_list.dart';
import '../../../../state/services/local/shared_preferences.dart';
import '../../../../state/services/local/shared_references_key.dart';
import '../../../../ulitites/Colors.dart';
import '../list_passboard/list_passboard_screen.dart';
import 'components/background.dart';
import 'components/select_passenger_for_seat.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({super.key});

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  @override
  Widget build(BuildContext context) {
    SeatProvider seatProvider = Provider.of(context, listen: false);
    Future<void> savePnr() async {
      context.read<AuthProvider>().auth;
      int exceptionCode =
          await SavePnrApi.savePnr(seatProvider.pnr.confirmationNumber);

      if (exceptionCode == 0) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const PassboardScreen();
            },
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        showCheckInFailedDialog(context, 'savePnr');
      }
    }

    Future<void> checkIn() async {
      context.read<AuthProvider>().auth;
      int exceptionCode = await CkeckInApi.checkIn(
          seatsAssignment: seatProvider.listSeatAssignment);

      if (exceptionCode != 0) {
        await savePnr();
      } else {
        // ignore: use_build_context_synchronously
        showCheckInFailedDialog(context, 'CheckIn');
      }
    }

    List<SeatModel> assignmentSeatsAPI = [];

    Future<void> getAssignmentSeat() async {
      final pnr = await SharedRServices().getString(SharedPnr.pnr);
      final decodedPnr = json.decode(pnr);
      final customPnr = RetrievePnrCustomModel.fromJson(decodedPnr);

      String formattedDate =
          DateFormat('yyyy-MM-dd').format(customPnr.departureDate);
      final seats = await RetrieveSeatAvailabilityListApi.seatsAvailabilityList(
          customPnr.logicalFlightID, formattedDate);
      final cabins = seats['physicalFlights'][0]['cabins'][0];
      final seatAssignments = cabins['seatAssignments'];

      for (var e in seatAssignments) {
        int rowNumber = e["rowNumber"];
        String seat = e["seat"];
        assignmentSeatsAPI.add(SeatModel(row: rowNumber, seat: seat));
      }
    }

    Future<bool> checkSeatWasAssigned(List<SeatAssignmentModel> seatAssignment,
        List<SeatModel> assignmentSeatsAPI) async {
      await getAssignmentSeat();
      Set<SeatModel> setseatAssign = Set.from(assignmentSeatsAPI);

      for (var e in seatAssignment) {
        if (setseatAssign.contains(e.seat)) {
          return true;
        }
      }
      return false;
    }

    Future<void> seatAssign() async {
      context.read<AuthProvider>().auth;
      if (await checkSeatWasAssigned(
          seatProvider.listSeatAssignment, assignmentSeatsAPI)) {
        // ignore: use_build_context_synchronously
        showSeatIsOccupied(context);
      } else {
        int exceptionCode = await SeatAssignmentApi.seatAssignment(
            seatsAssignment: seatProvider.listSeatAssignment);
        if (exceptionCode == 0) {
          await checkIn();
        } else {
          // ignore: use_build_context_synchronously
          showCheckInFailedDialog(context, 'seatAssign');
        }
      }
    }

    return Material(
      color: bg,
      child: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: BackgroundSeat(),
            ),
            Positioned(
              left: 0,
              right: 0,
              //top: 120,
              bottom: 20,
              child: Column(
                children: [
                  const SelectPassengerForSeat(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await seatAssign();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 12),
                        backgroundColor: priBlue,
                        shape: const StadiumBorder() // Background color
                        ),
                    child: const Text(
                      "TIẾP TỤC",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSeatIsOccupied(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'The seat is occupied!',
            style: TextStyle(
              color: red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Choose another seat and try again.',
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: yellow),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: priBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showCheckInFailedDialog(BuildContext context, String errorAt) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Check-In Failed!',
            style: TextStyle(
              color: red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'There was an error during check-in. Please try again.',
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: yellow),
              onPressed: () {
                if (errorAt == 'savePnr') {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
                if (errorAt == 'seatAssign' || errorAt == 'CheckIn') {
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: priBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
