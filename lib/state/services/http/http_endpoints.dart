class Endpoints {
  static const String baseUrl = 'https://apiv2.vietravelairlines.online/api/';
  static const int receiveTimeout = 30;
  static const int connectionTimeout = 30;

  static const String authEndpoint = 'User/LoginSTD';
  static const String retrievePnrEndpoint = 'ResReservation/RetrievePNR';
  static const String retrieveSeatAvailabilityList =
      'ResFlight/RetrieveSeatAvailabilityList';
  static const String seatAssignmentEndpoint = 'ResSeating/SeatAssignment';
  static const String checkInEndpoint = 'ResCheckIn/CheckInAsync';
  static const String savePnrEndpoint = 'ResReservation/SavePNR';
}
