import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/seat_model.dart';

class StateSeatModel {
  SeatModel seat;
  Color color;
  bool isSeatAssignment, isException;

  StateSeatModel({
    required this.seat,
    required this.color,
    required this.isSeatAssignment,
    required this.isException,
  });
}
