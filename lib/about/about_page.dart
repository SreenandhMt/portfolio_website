import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AboutSection extends StatefulWidget {
  const AboutSection({super.key});
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>{

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width*1,
      height: size.height*1,
      color: Colors.white,
        child: AboutWidget(),
    );
  }

}

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => AboutWidgetState();
}

class AboutWidgetState extends State<AboutWidget>  with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;
   @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SlideTransition(
          position: _offsetAnimation!,
          child: FittedBox(
            fit: BoxFit.none,
            child: SizedBox(
                    width:size.width>1000? size.width*0.6:size.width*0.9,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 10,bottom: 16,right: 16),
                child: Column(
                  children: [
                    Text(
                      'About Me:',
                      style: GoogleFonts.anton(fontSize: 28),
                    ),
                    Text(
                      'Hi, I\'m Sreenandh MT, a passionate and self-taught Flutter developer from Kannur, Kerala. I specialize in creating high-performance, cross-platform applications that deliver exceptional experiences across iOS, Android, web, and Windows platforms',
                      style: GoogleFonts.sourceSans3(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
      );
  }
}