import 'package:flutter/material.dart';
import 'package:wallpaper_app/wallpaper.dart';

void main() {
  // 563492ad6f917000010000010d73e634e1b1435baa4691f46df80103 // api KEY of pexels api
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const Wallpaper(),

    );
  }
}
