import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:wallpaper_app/api_class.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({Key? key}) : super(key: key);

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  
  // ==============================function of FETCHING========================== START/////
  List images = [];
  @override // initState function is a function which gets called every time the app runs;
  void initState()  {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':
              '563492ad6f917000010000010d73e634e1b1435baa4691f46df80103'
          // ignore: avoid_print
        }).then((value) {
      Map result = jsonDecode(value.body);
      print(result);
      setState(() { 
        images = result['photos'];
      });
    });
  }

// ==============================function of FETCHING========================== END///////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: Image.network(
                      images[index]['src']['tiny'],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          )),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.black,
            child: const Center(
                child: Text(
              "Load More!!!!!",
              style: TextStyle(fontSize: 20),
            )),
          )
        ],
      ),
    );
  }
}

