import 'package:flutter/material.dart';

import '../../ulitites/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 32,
          ),
        ],
      ),
      actions: [
        const CircleAvatar(
          foregroundImage: AssetImage('assets/images/flagVN.png'),
          radius: 10,
        ),
        const SizedBox(width: 11),
        IconButton(
          icon: const Icon(
            Icons.circle_notifications,
            size: 26,
            color: priBlue,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            size: 26,
            color: priBlue,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
