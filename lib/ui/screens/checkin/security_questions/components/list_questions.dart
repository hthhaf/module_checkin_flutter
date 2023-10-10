import 'package:flutter/material.dart';
//import 'package:flutter_check_in_app/ui/screens/check-in/list_passport/passport_screen.dart';

import 'package:flutter_check_in_app/ui/screens/checkin/security_questions/components/question.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/selectPassengerForSeat/seat_screen.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

class ListQuestion extends StatefulWidget {
  const ListQuestion({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListQuestionState createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  List<TorF?> answers = List<TorF?>.filled(4, null);
  bool showResult = false;

  bool allFalse() {
    return answers.every((answer) => answer == TorF.F);
  }

  bool allAnswersSelected() {
    return answers.every((answer) => answer != null);
  }

  void _result() {
    if (allFalse()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SeatScreen()),
      );
    } else {
      _showDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Question(0, 'Bạn có phải là hành khách hạn chế di chuyển không?',
              answers[0], (value) {
            setState(() {
              answers[0] = value;
            });
          }),
          Question(1, 'Bạn có phải là hành khách đang có thai?', answers[1],
              (value) {
            setState(() {
              answers[1] = value;
            });
          }),
          Question(
              2, 'Bạn có phải là hành khách cần trợ giúp xe lăn?', answers[2],
              (value) {
            setState(() {
              answers[2] = value;
            });
          }),
          Question(
              3, 'Bạn có phải là hành khách cần trợ giúp y tế?', answers[3],
              (value) {
            setState(() {
              answers[3] = value;
            });
          }),
          const Spacer(),
          ElevatedButton(
            onPressed: allAnswersSelected()
                ? () {
                    setState(() {
                      showResult = true;
                    });
                    _result();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
              backgroundColor: allAnswersSelected() ? priBlue : colorBorder,
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "TIẾP TỤC",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Yêu cầu bị từ chối",
          //"Answers: $answers",
          style: TextStyle(fontSize: 16, color: red),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Hành khách có yêu cầu dịch vụ đặc biệt (trẻ sơ sinh, xe lăn...) sẽ được làm thủ tục tại sân bay.",
          style: TextStyle(fontSize: 13, color: red),
        ),
        actionsPadding: const EdgeInsets.all(20),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 10),
                    backgroundColor: yellow,
                    shape: const StadiumBorder() // Background color
                    ),
                child: const Text("Thoát"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    backgroundColor: priBlue,
                    shape: const StadiumBorder() // Background color
                    ),
                child: const Text("Quay lại"),
              ),
            ],
          ),
        ],
      );
    },
  );
}
