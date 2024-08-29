import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/project/project_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({
    super.key,
    required this.details,
  });
  final dynamic details;

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  bool selected = false,showCloseButton = false;
  double _topPosition = -500.0;
  bool _isVisible = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      final size = MediaQuery.of(context).size;
      await Future.delayed(const Duration(seconds: 1));
      selected = true;
      setState(() {
        
      });
      await Future.delayed(const Duration(milliseconds: 1000));
      showCloseButton = true;
      setState(() {
        _topPosition = 10;
        _isVisible = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CallbackShortcuts(
    bindings: <ShortcutActivator, VoidCallback>{
      const SingleActivator(LogicalKeyboardKey.escape): () async{
        setState(() {
                                    _topPosition = -1000;
                                    _isVisible = true;
                                  });
                                  await Future.delayed(const Duration(seconds: 1));
                                  selected = false;
                                  setState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 950));
                                  // ignore: use_build_context_synchronously
                                  context.go('/');
      },
    },
      child: Focus(
      autofocus: true,
        child: Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                      width: selected ? size.width*1 : 100.0,
                      height: selected ? size.height*1 : 100.0,
                      decoration: BoxDecoration(color: Colors.amber[100],borderRadius: BorderRadius.circular(selected?0:50)),
                      alignment:
                          selected ? Alignment.center : AlignmentDirectional.topCenter,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastOutSlowIn
                    ),
              ),
              
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                top: _topPosition,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _isVisible ? 1.0 : 0.0,
                  child: Container(
                    height: size.height*0.85,
                    width: size.width*1,
                   
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      //  color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Visibility(
                            visible: showCloseButton,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      _topPosition = -1000;
                                      _isVisible = true;
                                    });
                                    await Future.delayed(const Duration(seconds: 1));
                                    selected = false;
                                    setState(() {});
                                    await Future.delayed(
                                        const Duration(milliseconds: 950));
                                    // ignore: use_build_context_synchronously
                                    context.go('/');
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0,right: 8.0,bottom: 4),
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor:
                                            const Color.fromARGB(255, 237, 216, 148),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: selected
                                              ? Colors.amber[100]
                                              : Colors.white,
                                          child: const Icon(Icons.close),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(alignment: Alignment.topRight,child: Container(width: 50,height: 25,margin: const EdgeInsets.only(right: 8.0),decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(2)),child: Center(child: Text("ESC",style: GoogleFonts.oswald(fontWeight: FontWeight.w500)))))
                              ],
                            )),
              Text(listProjectDetails[widget.details].projectName,style: GoogleFonts.concertOne(fontSize: 30,fontWeight: FontWeight.w500),),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: (size.width*.1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Project Overview",style: GoogleFonts.concertOne(fontSize: 23),),
                      SizedBox(height: 20),
                      SizedBox(width: size.width<=1000?size.width*0.6:size.width*.4,child: Text(listProjectDetails[widget.details].description,style: GoogleFonts.caveat(fontSize: 20),))
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    try {
                      launchUrl(Uri.parse(listProjectDetails[widget.details].projectLink));
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                  child: Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.transparent,border: Border.all(width: 0.7,color: Colors.black)),
                    child: Center(child: Text("Open GitHub",style:GoogleFonts.caveat(fontSize: 20,fontWeight: FontWeight.w600)),),
                  ),
                ),
              )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}