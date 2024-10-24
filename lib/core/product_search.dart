import 'package:flutter/material.dart';
import 'package:product_search/view/launch_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const LaunchPage(),
    );
  }
}
