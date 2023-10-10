import 'package:flutter/material.dart';

import '../../../../../ulitites/Colors.dart';
import '../../../../shared/navbar_custom_widget.dart';

class BackgroundSeat extends StatelessWidget {
  const BackgroundSeat({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.25;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30)),
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/clouds.jpg',
          ),
          colorFilter:
              ColorFilter.mode(priBlue.withOpacity(0.72), BlendMode.srcATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavBarCustom(
            text: 'Chọn ghế ngồi',
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Chọn hành khách để chọn ghế",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
