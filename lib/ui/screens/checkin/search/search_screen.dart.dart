import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';

import 'components/search_form.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: bg,
      ),
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                'assets/images/airbus.png',
                height: 160,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SearchForm(),
            ),
          )
        ],
      ),
    );
  }
}
