class SeatMapModel {
  int rowNumber;
  String seats;
  String? wingSeats, exitSeats, blockedSeats, preBlockedSeats;

  SeatMapModel({
    required this.rowNumber,
    required this.seats,
    this.wingSeats,
    this.exitSeats,
    this.blockedSeats,
    this.preBlockedSeats,
  });

  factory SeatMapModel.fromJson(Map<String, dynamic> json) {
    //final seatMaps = json['physicalFlights'][0]['cabins'][0]['seatMaps'];
    return SeatMapModel(
      rowNumber: json['rowNumber'] as int,
      seats: json['seats'] as String,
      wingSeats: json['wingSeats'] as String?,
      exitSeats: json['exitSeats'] as String?,
      blockedSeats: json['blockedSeats'] as String?,
      preBlockedSeats: json['preBlockedSeats'] as String?,
    );
  }
}
