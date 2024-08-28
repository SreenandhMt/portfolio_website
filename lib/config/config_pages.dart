import 'package:flutter/material.dart';
import 'package:portfolio_website/connect/connect_page.dart';
import 'package:portfolio_website/project/project_page.dart';

import '../about/about_page.dart';
import '../home/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
            children: [
              Container(
              width: size.width * 1,
              height: size.height * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5dxJOb3Z_f30m77iX1ysC2isIAxPpMuxndQ&s"),
                      fit: BoxFit.cover)),
            ),
            ListView(
              children: [
                HomePage(),
                AboutSection(),
                ProjectShowcaseSection(),
                ConnectSection()
              ],
            ),
          ],
        ),
      );
  }
}