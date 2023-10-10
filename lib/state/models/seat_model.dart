class SeatModel {
  int row;
  String seat;
  SeatModel({
    required this.row,
    required this.seat,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SeatModel && other.row == row && other.seat == seat;
  }

  @override
  int get hashCode => row.hashCode ^ seat.hashCode;
}
