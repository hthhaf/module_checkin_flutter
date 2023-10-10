import 'package:flutter/material.dart';

import 'package:flutter_check_in_app/ui/screens/checkin/seatonairbus/components/seats_map.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

import '../../../../../state/models/seat_map_model.dart';
import '../../../../../state/models/seat_model.dart';

// ignore: must_be_immutable
class SeatsOnAirbus extends StatefulWidget {
  dynamic retrieveSeats;
  SeatsOnAirbus({
    super.key,
    required this.retrieveSeats,
  });

  @override
  State<SeatsOnAirbus> createState() => _SeatsOnAirbusState();
}

class _SeatsOnAirbusState extends State<SeatsOnAirbus> {
  List<SeatMapModel> seatsMap = [];
  List<SeatModel> assignmentSeats = [];
  List<SeatModel> seatExceptions = [];

  @override
  void initState() {
    super.initState();
    fetchSeats(context);
  }

  // Future<RetrievePnrCustomModel> customPnr() async {
  //   final pnr = await SharedRServices().getString(SharedPnr.pnr);
  //   final decodedPnr = json.decode(pnr);
  //   final customPnr = RetrievePnrCustomModel.fromJson(decodedPnr);
  //   return customPnr;
  // }

  // Future<dynamic> retrieveSeats(BuildContext context) async {
  //   ProgressDialog progressDialog = ProgressDialog(context);
  //   progressDialog.style(
  //     progressWidget: const CircularProgressIndicator(),
  //   );

  //   try {
  //     progressDialog.show();

  //     context.read<AuthProvider>().auth;
  //     RetrievePnrCustomModel pnr = await customPnr();
  //     String formattedDate = DateFormat('yyyy-MM-dd').format(pnr.departureDate);
  //     final seats = await RetrieveSeatAvailabilityListApi.seatsAvailabilityList(
  //         pnr.logicalFlightID, formattedDate);

  //     progressDialog.hide();

  //     return seats;
  //   } catch (error) {
  //     setState(() {});
  //   }
  // }

  Future<void> fetchSeats(BuildContext context) async {
    final lseats = widget.retrieveSeats;
    final cabins = lseats['physicalFlights'][0]['cabins'][0];
    final seatMaps = cabins['seatMaps'];
    final seatAssignments = cabins['seatAssignments'];
    final exceptions = cabins['seatExceptions'];

    List<SeatMapModel> listAvailableSeats =
        seatMaps.map<SeatMapModel>((e) => SeatMapModel.fromJson(e)).toList();

    for (var e in seatAssignments) {
      int rowNumber = e["rowNumber"];
      String seat = e["seat"];
      assignmentSeats.add(SeatModel(row: rowNumber, seat: seat));
    }

    for (var e in exceptions) {
      int rowNumber = e["rowNumber"];
      String seat = e["seat"];
      seatExceptions.add(SeatModel(row: rowNumber, seat: seat));
    }

    setState(() {
      seatsMap = listAvailableSeats;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> seats1 = ['A', 'B', 'C'];
    List<String> seats2 = ['D', 'E', 'F'];

    return Container(
      margin: const EdgeInsets.fromLTRB(25, 5, 25, 0),
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(300),
        ),
        color: white,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(bottom: 10),
            width: 260,
            height: 115,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    typeSeat(green, "  Wing Seats"),
                    typeSeat(blue, "  Exit Seats"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    typeSeat(colorBorder, "  Occupied Seat"),
                    typeSeat(yellow, "  Selected Seat"),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [for (var e in seats1) seat(e)]),
              //const SizedBox(width: 40),
              Row(children: [for (var e in seats2) seat(e)])
            ],
          ),
          Expanded(
            child: SeatMap(
              seatsMap: seatsMap,
              assignmentSeats: assignmentSeats,
              seatExceptions: seatExceptions,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Container seat(String seat) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 36,
      child: Text(
        textAlign: TextAlign.center,
        seat,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Row typeSeat(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 6,
        ),
        Text(text, style: const TextStyle(height: 1.5)),
      ],
    );
  }
}
