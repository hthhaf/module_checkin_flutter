import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ui/screens/checkin/security_questions/components/list_questions.dart';

import '../../../../ulitites/Colors.dart';
import 'components/background_questions.dart';

class SecurityQuestionsScreen extends StatelessWidget {
  const SecurityQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: bg,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: BackgroundQuestions(),
            ),
            Positioned(
              left: 0,
              right: 0,
              //top: 120,
              bottom: 20,
              child: ListQuestion(),
            ),
          ],
        ),
      ),
    );
  }
}
