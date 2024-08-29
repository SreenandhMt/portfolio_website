import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return Stack(
    //   children: [
    return Container(
          width: size.width*1,
          height: size.height*1,
          decoration: const BoxDecoration(color: Colors.transparent),
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
        // FrostedGlassBox(theWidth: size.width*0.25,theHeight: size.height*.4,theChild: Wrap(
        //   spacing: 5,
        //   runSpacing: 6,
        //   children: List.generate(7, (index) => const keybindinfo(),),
        // ),)
    //   ],
    // );
  }
}

// class keybindinfo extends StatefulWidget {
//   const keybindinfo({super.key});

//   @override
//   State<keybindinfo> createState() => _keybindinfoState();
// }

// class _keybindinfoState extends State<keybindinfo> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(width:size.width*.05,height: size.height*.1,margin: const EdgeInsets.only(right: 8.0),decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(2)),child: Center(child: Text("ESC",style: GoogleFonts.oswald(fontWeight: FontWeight.w500))));
//   }
// }
