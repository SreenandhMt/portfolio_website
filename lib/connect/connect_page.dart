import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectSection extends StatefulWidget {
  const ConnectSection({super.key});
  @override
  State<ConnectSection> createState() => _ConnectSectionState();
}

class _ConnectSectionState extends State<ConnectSection> {
  bool selected=false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const ConnectBackGroundAnimation(),
        Container(
          width: size.width*1,
          height: size.height*0.3,
          color: Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Connect Me', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.amber[100])),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedIconButton(
                        icon: Icons.mail,
                        text: "Open Email",
                        url: 'assets/image/email.png',
                      ),
                      SizedBox(width: 6),
                      AnimatedIconButton(
                        icon: Icons.linked_camera,
                        text: "Open LInkedin",
                        url: 'assets/image/linkedin2.png',
                      ),
                       SizedBox(width: 6),
                      AnimatedIconButton(
                        icon: Icons.linked_camera,
                        text: "Open GitHub",
                        url: 'assets/image/github.png',
                      ),
                      SizedBox(width: 6),
                      AnimatedIconButton(
                        icon: Icons.linked_camera,
                        text: "Download CV",
                        url: 'assets/image/cvlogo.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ),
      ],
    );
  }
}

class ConnectBackGroundAnimation extends StatelessWidget {
  const ConnectBackGroundAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
          width: size.width*1,
          height: size.height*0.3,
          color: Colors.white,
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1900),
            builder: (context, value, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * value,
                  height: size.height*0.15,
                  decoration: BoxDecoration(color: Colors.black,border: Border.all(width: 0)),
                ),
              );
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 2200),
            builder: (context, value, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * value,
                  height: size.height*0.15,
                  decoration: BoxDecoration(color: Colors.black,border: Border.all(width: 0)),
                ),
              );
            },
          ),
            ],
          )
        );
  }
}

class AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String text;

  const AnimatedIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.text,
  });

  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  bool showText=false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(widget.url),
      onHover: (value) {
        setState(() {
          showText=value;
        });
      },
      child: Row(
        children: [
          Image.asset(widget.url,height: 30),
          // Icon(widget.icon, size: 40, color: Colors.blue),
          const SizedBox(width: 6),
          if(showText) MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedTextKit(
            animatedTexts: [
            TypewriterAnimatedText(
              widget.text,
              textStyle: GoogleFonts.sourceCodePro(color: Colors.amber),
              curve: Easing.legacy,
              speed: const Duration(milliseconds: 100),
            ),
          ],)
          )
        ]
      ),
    );
  }

  void _launchURL(String url) async {
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}