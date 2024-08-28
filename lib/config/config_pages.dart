import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/connect/connect_page.dart';
import 'package:portfolio_website/project/project_page.dart';

import '../about/about_page.dart';
import '../home/home_page.dart';

ScrollController scrollController = ScrollController();
const appBarSpace = SizedBox(width: 80);
const appBarSpaceMobile = SizedBox(width: 30);

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  PreferredSize(preferredSize: Size(size.width, 50), child: CustomAppbars()),
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
              controller: scrollController,
              children: const [
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

class CustomAppbars extends StatelessWidget {
  const CustomAppbars({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox(height: 50)),
          InkWell(mouseCursor: SystemMouseCursors.click,onTap: () {
            scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Easing.legacy);
          },child: Text("Home",style: GoogleFonts.inconsolata(fontSize: 17),)),
          if(size.width>=1000) appBarSpace else appBarSpaceMobile,
          InkWell(mouseCursor: SystemMouseCursors.click,onTap: () {
            scrollController.animateTo(size.height*1.07, duration: const Duration(seconds: 1), curve: Easing.legacy);
          },child: Text("About",style: GoogleFonts.inconsolata(fontSize: 17),)),
          if(size.width>=1000) appBarSpace else appBarSpaceMobile,
          InkWell(mouseCursor: SystemMouseCursors.click,onTap: () {
            scrollController.animateTo(size.height*2.1, duration: const Duration(seconds: 1), curve: Easing.legacy);
          },child: Text("Project",style: GoogleFonts.inconsolata(fontSize: 17),)),
          if(size.width>=1000) appBarSpace else appBarSpaceMobile,
          InkWell(mouseCursor: SystemMouseCursors.click,onTap: () {
            scrollController.animateTo(size.height*2.1, duration: const Duration(seconds: 1), curve: Easing.legacy);
          },child: Text("Connect Me",style: GoogleFonts.inconsolata(fontSize: 17),)),
          if(size.width>=1000) appBarSpace else appBarSpaceMobile,
        ],
      );
  }
}