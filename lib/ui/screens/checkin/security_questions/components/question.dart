import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

enum TorF { T, F }

class Question extends StatefulWidget {
  final int index;
  final String question;
  final TorF? selectedValue;
  final Function(TorF?) onChanged;

  const Question(this.index, this.question, this.selectedValue, this.onChanged,
      {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  TorF? selectedAnswer;

  @override
  void initState() {
    super.initState();
    selectedAnswer = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 32, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: const TextStyle(fontSize: 15),
          ),
          RadioButton(selectedAnswer, widget.onChanged, widget.index),
        ],
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  final TorF? selectedValue;
  final Function(TorF?) onChanged;
  final int index;

  const RadioButton(this.selectedValue, this.onChanged, this.index,
      {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  TorF? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio<TorF>(
              value: TorF.T,
              groupValue: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                  widget.onChanged(value);
                });
              },
              activeColor: priBlue,
            ),
            const Text(
              "Đúng",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Row(
          children: [
            Radio<TorF>(
              value: TorF.F,
              groupValue: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                  widget.onChanged(value);
                });
              },
              activeColor: priBlue,
            ),
            const Text(
              "Không",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        // if (widget.index == 0 && _isChecked != null)
        //   IconButton(
        //     icon: Icon(Icons.refresh),
        //     onPressed: () {
        //       setState(() {
        //         _isChecked = null;
        //         widget.onChanged(null);
        //       });
        //     },
        //   ),
      ],
    );
  }
}
