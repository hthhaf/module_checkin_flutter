import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/shared/navbar_custom_widget.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

class BackgroundQuestions extends StatelessWidget {
  const BackgroundQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.32;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
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
            text: 'Câu hỏi an ninh',
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Trả lời toàn bộ câu hỏi để tiếp tục",
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
