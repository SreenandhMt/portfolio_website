import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio_website/project_details/project_details_module.dart';

List<ProjectDetailsModule> listProjectDetails = [
  ProjectDetailsModule("Prime Store", "https://github.com/SreenandhMt/prime", "Prime Store is a cross-platform e-commerce application built with Flutter, offering a comprehensive and seamless shopping experience. The app is packed with essential e-commerce functionalities, including cart management, product favorites, user authentication, secure payment processing, and more. Additionally, it empowers users to create their own shop pages, buy and sell items, and engage with reviews and ratings."),
  ProjectDetailsModule("Goal Marker","https://github.com/SreenandhMt/Goals-Marker", "Goal Marker is a powerful and intuitive application designed to help users set, track, and achieve their goals. Whether it's daily, monthly, or yearly objectives, Goal Marker provides a comprehensive platform to keep users on track with their aspirations.")
];

class ProjectShowcaseSection extends StatefulWidget  {
  const ProjectShowcaseSection({super.key});

  @override
  State<ProjectShowcaseSection> createState() => _ProjectShowcaseSectionState();
}

class _ProjectShowcaseSectionState extends State<ProjectShowcaseSection> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Stack(
      children: [
        const ProjectBackGroundAnimation(),
        SizedBox(
          width: size.width*1,
          height: size.height*0.7,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Text('My Projects', style: GoogleFonts.anton(fontSize: 25)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ScaleTransition(
                    scale: _animation,
                      child: const ProjectBox(
                        index: 1,
                        imageurl:
                            "assets/image/project1.png",
                      ),
                    ),
                    ScaleTransition(
                     scale: _animation,
                      child: const ProjectBox(
                        index: 2,
                        imageurl:
                            "assets/image/project2.png",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ProjectBackGroundAnimation extends StatelessWidget {
  const ProjectBackGroundAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
          width: size.width*1,
          height: size.height*0.7,
          color: Colors.white,
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1150),
            builder: (context, value, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * value,
                  height: size.height*0.175,
                  decoration: BoxDecoration(color: Colors.amber[100],border: Border.all(width: 0,color: Colors.transparent)),
                ),
              );
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1250),
            builder: (context, value, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * value,
                  height: size.height*0.175,
                  decoration: BoxDecoration(color: Colors.amber[100],border: Border.all(width: 0,color: Colors.transparent)),
                ),
              );
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1500),
            builder: (context, value, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * value,
                  height: size.height*0.175,
                  decoration: BoxDecoration(color: Colors.amber[100],border: Border.all(width: 0,color: Colors.transparent)),
                ),
              );
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1700),
            builder: (context, value, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * value,
                  height: size.height*0.175,
                  decoration: BoxDecoration(color: Colors.amber[100],border: Border.all(width: 0,color: Colors.transparent)),
                ),
              );
            },
          ),
            ],
          ),
        );
  }
}

class ProjectBox extends StatefulWidget {
  final int index;
  final String imageurl;
  const ProjectBox({
    super.key,
    required this.index,
    required this.imageurl,
  });

  @override
  _ProjectBoxState createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
  bool _hovering = false,_showFirst=false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: _hovering ? Colors.blueAccent : Colors.amber[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // _launchURL("");
          context.go('/Project-Details/${widget.index-1}?query=${listProjectDetails[widget.index-1].projectName}');
        },
          child: MouseRegion(
            onEnter: (event) {
              _showFirst=true;
          setState(() {
            
          });
            },
            onExit: (event) {
              _showFirst=false;
          setState(() {
            
          });
            },
            child: AnimatedCrossFade(
              firstChild:  Container(color: Colors.blue,height:size.width>=1000? size.height*0.55:size.height*0.50, width: size.width>=1000?size.width*0.33:size.width*0.43,child: Image.asset(widget.imageurl,fit: BoxFit.fill,)),
              secondChild: Container(color: Colors.red,height:size.width>=1000? size.height*0.5:size.height*0.45, width: size.width>=1000?size.width*0.3:size.width*0.4,child: Image.asset(widget.imageurl,fit: BoxFit.cover,)),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          )
      ),
    );
  }
}

