import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width*1,
      height: size.height*1,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Welcome to My Portfolio',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
          AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  colors: [
                    Colors.white,
                    Colors.blueAccent,
                    const Color.fromARGB(255, 223, 117, 153),
                    const Color.fromARGB(255, 54, 94, 127),
                  ],
                  'I\'m Sreenandh MT',
                  textStyle: GoogleFonts.kanit(fontSize: 30,fontWeight: FontWeight.w500),
                  speed: const Duration(milliseconds: 400),
                ),
              ],
              totalRepeatCount: 1,
            ),
            
                SizedBox(
                  height: 50,
                  child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(
                      'Mobile Application Developer',
                      textStyle: GoogleFonts.kanit(fontSize: 25),
                    ),
                    RotateAnimatedText(
                      'Website Developer',
                      textStyle: GoogleFonts.kanit(fontSize: 25),
                    ),
                    RotateAnimatedText(
                      'Desktop Application Developer',
                      textStyle: GoogleFonts.kanit(fontSize: 25),
                    ),
                    RotateAnimatedText(
                      'Flutter Developer',
                      textStyle: GoogleFonts.kanit(fontSize: 25),
                      rotateOut: false
                    ),
                  ],
                  totalRepeatCount: 1,
                             ),
                )
              ],
             ),
    );
  }
}
