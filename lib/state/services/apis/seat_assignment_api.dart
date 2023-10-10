import 'package:flutter_check_in_app/state/models/seat_assignment_model.dart';
import 'package:flutter_check_in_app/state/services/http/http_endpoints.dart';

import '../http/dio_services.dart';

class SeatAssignmentApi {
  static String endpoint = Endpoints.seatAssignmentEndpoint;

  static Future<int> seatAssignment(
      {required List<SeatAssignmentModel> seatsAssignment}) async {
    final String url = endpoint;
    String confirmationNumber = seatsAssignment[0].confirmationNumber;
    final data = {
      "carrierCodes": [
        {"accessibleCarrierCode": "VU"}
      ],
      "clientIPAddress": "127.0.0.1",
      "actionType": 0,
      "reservationInfo": {
        "seriesNumber": "299",
        "confirmationNumber": confirmationNumber,
      },
      "seatAssignmentDetails": [
        for (var e in seatsAssignment)
          {
            "reservationKey": "299:$confirmationNumber",
            "logicalFlightKey": e.logicalFlightKey,
            "physicalFlightKey": e.physicalFlightKey,
            "customerKey": e.customer.customerKey,
            "airLinePersonKey": e.customer.airLinePersonKey,
            "seatAssignmentKey": e.customer.seatAssignmentKey,
            "seat": e.seat.seat,
            "rowNumber": e.seat.row.toString(),
            "oldSeat": "?",
            "oldRowNumber": "?"
          }
      ]
    };
    final res = await DioClient.post(url, data, haveToken: true);
    final body = res.data;
    print("############## seatAssignment ##################");
    print(
        "exceptionCode: " + body['exceptions'][0].toString());
    return body['exceptions'][0]['exceptionCode'];
  }
}
