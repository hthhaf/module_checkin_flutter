import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/seat_map_model.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';
import 'package:provider/provider.dart';

import '../../../../../state/models/seat_model.dart';
import '../../../../../state/models/state_seat_model.dart';
import '../../../../../state/providers/seat_provider.dart';

//ignore: must_be_immutable
class SeatMap extends StatefulWidget {
  List<SeatMapModel> seatsMap;
  List<SeatModel> assignmentSeats;
  List<SeatModel> seatExceptions;

  SeatMap({
    super.key,
    required this.seatsMap,
    required this.assignmentSeats,
    required this.seatExceptions,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SeatMapState createState() => _SeatMapState();
}

class _SeatMapState extends State<SeatMap> {
  List<SeatModel> listExitSeats = [];
  List<String> splitSeats(String input) {
    List<String> characters = [];

    for (int i = 0; i < 7; i++) {
      if (i < input.length) {
        characters.add(input[i]);
      } else {
        characters.add(" ");
      }
    }
    return characters;
  }

  List<String> splitExitSeats(String? input) {
    List<String> characters = [];
    if (input != null) {
      characters = input.split(' ').where((str) => str.isNotEmpty).toList();
    }
    return characters;
  }

  @override
  void initState() {
    super.initState();
  }

  //return Container();
  int selectedCard = -1;

  @override
  Widget build(BuildContext context) {
    Set<SeatModel> setseatAssignments = Set.from(widget.assignmentSeats);
    Set<SeatModel> setseatExceptions = Set.from(widget.seatExceptions);

    List<StateSeatModel> addListSeat() {
      List<StateSeatModel> listSeat = [];

      for (var element in widget.seatsMap) {
        int row = element.rowNumber;
        List<String> seats = splitSeats(element.seats);

        for (var e in seats) {
          SeatModel seatModel = SeatModel(row: row, seat: e);

          if (element.exitSeats == null) {
            if (setseatAssignments.contains(seatModel)) {
              listSeat.add(StateSeatModel(
                seat: seatModel,
                color: colorBorder,
                isSeatAssignment: true,
                isException: false,
              ));
            } else if (setseatExceptions.contains(seatModel)) {
              listSeat.add(StateSeatModel(
                seat: seatModel,
                color: colorBorder,
                isSeatAssignment: true,
                isException: true,
              ));
            } else {
              listSeat.add(StateSeatModel(
                seat: seatModel,
                color: priBlue,
                isSeatAssignment: false,
                isException: false,
              ));
            }
          } else {
            List<String> exitSeats = splitExitSeats(element.exitSeats);

            for (var s in exitSeats) {
              listExitSeats.add(SeatModel(row: row, seat: s));
            }
            Set<SeatModel> setExitSeats = Set.from(listExitSeats);

            if (setExitSeats.contains(seatModel)) {
              listSeat.add(StateSeatModel(
                seat: seatModel,
                color: seatColor,
                isSeatAssignment: false,
                isException: false,
              ));
            } else {
              listSeat.add(StateSeatModel(
                seat: seatModel,
                color: priBlue,
                isSeatAssignment: false,
                isException: false,
              ));
            }
          }
        }
      }
      return listSeat;
    }

    List<StateSeatModel> list = addListSeat();

    return GridView.builder(
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (list[index].isException == true || list[index].seat.seat == " ") {
          if (index % 7 == 3) {
            return Container(
              padding: const EdgeInsets.only(top: 16),
              width: 40,
              height: 40,
              child: Text(
                list[index].seat.row.toString(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          } else {
            return const SizedBox(width: 40, height: 40);
          }
        } else {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCard = selectedCard == index ? -1 : index;
                Provider.of<SeatProvider>(context, listen: false)
                    .addSeatModel(list[index].seat);
                Provider.of<SeatProvider>(context, listen: false)
                    .toggleElement(selectedCard != -1);
              });
            },
            child: IgnorePointer(
              ignoring: list[index].isSeatAssignment,
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: selectedCard == index ? red : list[index].color,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
