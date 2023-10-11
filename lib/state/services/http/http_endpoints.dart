class Endpoints {
  
  static const int receiveTimeout = 30;
  static const int connectionTimeout = 30;

  static const String authEndpoint = 'LoginSTD';
  static const String retrievePnrEndpoint = 'RetrievePNR';
  static const String retrieveSeatAvailabilityList =
      'RetrieveSeatAvailabilityList';
  static const String seatAssignmentEndpoint = 'SeatAssignment';
  static const String checkInEndpoint = 'CheckInAsync';
  static const String savePnrEndpoint = 'SavePNR';
}
