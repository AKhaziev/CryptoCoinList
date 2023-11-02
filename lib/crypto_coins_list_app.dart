import 'package:flutter/material.dart';
import 'router/router.dart';
import 'theme/theme.dart';

class CryptoCoinsListApp extends StatelessWidget {
  const CryptoCoinsListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crypto Currencies List',
        theme: darkTheme,
        // home: const CryptoListScreen(),
        routes: routes
    );
  }
}