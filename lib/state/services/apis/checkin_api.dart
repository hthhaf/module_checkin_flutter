import 'package:flutter_check_in_app/state/services/http/http_endpoints.dart';

import '../../models/seat_assignment_model.dart';
import '../http/dio_services.dart';

class CkeckInApi {
  static String endpoint = Endpoints.checkInEndpoint;

  static Future<int> checkIn(
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
      "checkInDetails": [
        for (var e in seatsAssignment)
          {
            "reservationKey": "299:$confirmationNumber",
            "logicalFlightKey": e.logicalFlightKey,
            "physicalFlightKey": e.physicalFlightKey,
            "customerKey": e.customer.customerKey,
            "airLinePersonKey": e.customer.airLinePersonKey,
            "seatAssignmentKey": e.customer.seatAssignmentKey,
          }
      ],
    };
    final res = await DioClient.post(url, data, haveToken: true);
    final body = res.data;
    print("############## checkIn ##################");
    print(body['exceptions'][0].toString());
    return body['exceptions'][0]['exceptionCode'];
  }
}
