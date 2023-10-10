import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavBarCustom extends StatelessWidget {
  String text;
  NavBarCustom({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavBarItem(
              icon: Icons.arrow_back,
              press: () {
                Navigator.pop(context);
              },
            ),
            Text(
              text,
              style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.5),
                      offset: const Offset(12, 8),
                      spreadRadius: 3,
                      blurRadius: 10,
                    ),
                  ],
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            NavBarItem(
              icon: Icons.list,
              press: () {
                Navigator.pop(context);
              },
            )
          ]),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback press;

  const NavBarItem({super.key, required this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.5),
            offset: const Offset(12, 8),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        alignment: Alignment.center,
        icon: Icon(
          icon,
          size: 20,
        ),
        onPressed: press,
      ),
    );
  }
}
