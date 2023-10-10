import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mr. NGUYEN VAN A",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("1900-01-01"),
            ],
          ),
          CircleAvatar(
            radius: 19,
            backgroundColor: yellow,
            child: IconButton(
              alignment: Alignment.center,
              icon: const Icon(
                Icons.add,
                color: priBlue,
              ),
              onPressed: () {
                _showDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  fillColor: bg,
                  filled: true,
                  labelText: "VD: M7W4AF",
                  hintText: "",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: priBlue.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: bg,
                  filled: true,
                  labelText: "VD: M7W4AF",
                  hintText: "",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: priBlue.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: bg,
                  filled: true,
                  labelText: "VD: M7W4AF",
                  hintText: "",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: priBlue.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: bg,
                  filled: true,
                  labelText: "VD: M7W4AF",
                  hintText: "",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: priBlue.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
