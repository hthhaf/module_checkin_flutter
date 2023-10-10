class RetrievePnrCustomModel {
  int logicalFlightID, flightDuration, logicalFlightCount, activePassengerCount;
  String operatingFlightNumber,
      confirmationNumber,
      logicalFlightKey,
      physicalFlightKey,
      origin,
      originName,
      destination,
      destinationName;
  DateTime departureTime, arrivaltime, departureDate;

  RetrievePnrCustomModel({
    required this.confirmationNumber,
    required this.logicalFlightCount,
    required this.activePassengerCount,
    required this.logicalFlightKey,
    required this.logicalFlightID,
    required this.departureDate,
    required this.operatingFlightNumber,
    required this.physicalFlightKey,
    required this.origin,
    required this.originName,
    required this.destination,
    required this.destinationName,
    required this.departureTime,
    required this.arrivaltime,
    required this.flightDuration,
  });

  factory RetrievePnrCustomModel.fromJson(Map<String, dynamic> json) {
    final confirmationNumber = json['confirmationNumber'];

    final logicalFlight = json['airlines'][0]['logicalFlight'][0];
    final physicalFlights = logicalFlight['physicalFlights'][0];

    return RetrievePnrCustomModel(
      confirmationNumber: confirmationNumber,
      logicalFlightCount: json['logicalFlightCount'] as int,
      activePassengerCount: json['activePassengerCount'] as int,
      logicalFlightKey: logicalFlight['key'],
      logicalFlightID: logicalFlight['logicalFlightID'] as int,
      departureDate: DateTime.parse(logicalFlight['departureDate']),
      origin: logicalFlight['origin'],
      originName: logicalFlight['originName'],
      destination: logicalFlight['destination'],
      destinationName: logicalFlight['destinationName'],
      operatingFlightNumber: logicalFlight['operatingFlightNumber'],
      departureTime: DateTime.parse(logicalFlight['departureTime']),
      arrivaltime: DateTime.parse(logicalFlight['arrivaltime']),
      physicalFlightKey: physicalFlights['key'],
      flightDuration: physicalFlights['flightDuration'] as int,
    );
  }
}
