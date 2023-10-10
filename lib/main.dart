import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/providers/seat_provider.dart';
import 'package:flutter_check_in_app/ui/screens/Auth/login_screen.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';
import 'package:provider/provider.dart';

import 'state/providers/auth_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => SeatProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, SeatProvider>(
      builder: (
        context,
        AuthProvider authProvider,
        SeatProvider seatProvider,
        child,
      ) {
        return MaterialApp(
          title: 'Tutor App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Exo', primaryColor: bg),
          home: const Login(),
          //const BottomNavBar(),
        );
      },
    );
  }
}
