import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/passboard_model.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../../ulitites/Colors.dart';
import '../../../../shared/navbar_custom_widget.dart';

// ignore: must_be_immutable
class Passboard extends StatefulWidget {
  PassboardModel pb;
  Passboard({super.key, required this.pb});

  @override
  // ignore: library_private_types_in_public_api
  _PassboardState createState() => _PassboardState();
}

class _PassboardState extends State<Passboard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      //height: MediaQuery.of(context).size.height,
      color: bg,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            image: DecorationImage(
              image: const AssetImage(
                'assets/images/bgclouds.jpg',
              ),
              colorFilter: ColorFilter.mode(
                  priBlue.withOpacity(0.32), BlendMode.srcATop),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            NavBarCustom(
              text: 'Passboard',
            ),
            passboard()
          ]),
        ),
      ),
    );
  }

  Container passboard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      height: 738,
      decoration: const BoxDecoration(
        //color: yellow,
        image: DecorationImage(
          image:
              AssetImage('assets/images/passboard.png'), // Corrected asset path
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: colorBorder,
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/logo.png',
                  width: 140,
                ),
                const SizedBox(
                  height: 36,
                )
              ],
            ),
          ),
          // const SizedBox(
          //   height: 32,
          // ),
          Container(
            color: colorBorder,
            height: 0.5,
          ),
          SizedBox(
            //alignment: Alignment.centerLeft,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 42),
                const Text(
                  "Tên hành khách/Passenger Name ",
                ),
                Text(
                  "${widget.pb.customer.lastName}/${widget.pb.customer.firstName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.26,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.pb.pnr.origin,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18),
                            ),
                            Text(DateFormat('HH:mm')
                                .format(widget.pb.pnr.departureTime)),
                          ]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: white,
                      width: MediaQuery.of(context).size.width * 0.26,
                      child: Column(
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(widget.pb.pnr.departureDate),
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Image.asset('assets/images/icon.png'),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width * 0.26,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.pb.pnr.destination,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                          Text(DateFormat('HH:mm')
                              .format(widget.pb.pnr.arrivaltime)),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Seat"),
                            Text(
                              "${widget.pb.seat.row.toString()}${widget.pb.seat.seat}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18),
                            )
                          ]),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Booking Ref"),
                          Text(
                            widget.pb.pnr.confirmationNumber,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(height: 16),
                const Text(
                  "Cửa ra máy bay sẽ đóng 15 phút trước giờ khởi hành/ Boarding gate will be closed 15 minutes prior to departure time.",
                  style: TextStyle(fontSize: 12.7),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Text("               Send mail"),
                    Spacer(),
                    Text("Download               "),
                  ],
                ),
                const SizedBox(height: 6),
              ],
            ),
          )
        ],
      ),
    );
  }
}
