import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {

  double turns = 0.0;
  bool isClicked = false;
  Color customBlackColor = const Color.fromARGB(255, 53, 53, 53);
  Color customWhiteColor = const Color.fromARGB(255, 237, 237, 237);
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhiteColor,
      appBar: AppBar(
        title: const Text('Neumorphism', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: AnimatedRotation(
          curve: Curves.easeOutExpo,
          turns: turns,
          duration: const Duration(seconds: 1),
          child: GestureDetector(
            onTap: (){
              if(isClicked){
                setState(() {
                  turns -= 1/4;
                  controller.reverse();
                });
              }
              else {
                setState(() {
                  turns += 1/4;
                  controller.forward();
                });
              }
              isClicked = !isClicked;
            },
            child: AnimatedContainer(
              curve: Curves.easeOutExpo,
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: customWhiteColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30.0,
                    offset: isClicked ? const Offset(20, -20) : const Offset(20, 20),
                    color: Colors.grey,
                  ),
                  BoxShadow(
                    blurRadius: 30.0,
                    offset: isClicked ? const Offset(-20, 20) : const Offset(-20, -20),
                    color: Colors.white,
                  ),
                ]
              ),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.home_menu,
                    progress: controller,
                    size: 100,
                    color: customBlackColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
