// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_element

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nko_flutter/View/crud/Home_task.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     resetsheet();
//     super.initState();
//     Timer(Duration(seconds: 1), () {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) => Home_Task()));
//     });
//   }

//   resetsheet() async {
//     await SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 20, 98, 128),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // logo here
//             Image.asset(
//               'assets/images/4.png',
//               width: size.width * 0.8,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Feel free to use the code in your projects but do not forget to give me the credits adding my app (Flutter Animation Gallery) where you are gonna use it.

// ------------------------------------------

// import these Packages in pubspec.yaml file.
// dependencies:
//
//   animated_text_kit:

// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, use_key_in_widget_constructors, sort_child_properties_last

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:nko_flutter/View/crud/Home_task.dart';

// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(Duration(milliseconds: 400), () {
//       setState(() {
//         _a = true;
//       });
//     });
//     Timer(Duration(milliseconds: 400), () {
//       setState(() {
//         _b = true;
//       });
//     });
//     Timer(Duration(milliseconds: 1300), () {
//       setState(() {
//         _c = true;
//       });
//     });
//     Timer(Duration(milliseconds: 1700), () {
//       setState(() {
//         _e = true;
//       });
//     });
//     Timer(Duration(milliseconds: 3400), () {
//       setState(() {
//         _d = true;
//       });
//     });
//     Timer(Duration(milliseconds: 3850), () {
//       setState(() {
//         Navigator.of(context).pushReplacement(
//           ThisIsFadeRoute(page: Home_Task()),
//         );
//       });
//     });
//   }

//   bool _a = false;
//   bool _b = false;
//   bool _c = false;
//   bool _d = false;
//   bool _e = false;

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double _h = MediaQuery.of(context).size.height;
//     double _w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 20, 98, 128),
//       body: Center(
//         child: Column(
//           children: [
//             AnimatedContainer(
//               duration: Duration(milliseconds: _d ? 900 : 2500),
//               curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
//               height: _d
//                   ? 0
//                   : _a
//                       ? _h / 2
//                       : 20,
//               width: 20,
//               // color: Colors.deepPurpleAccent,
//             ),
//             AnimatedContainer(
//               duration: Duration(
//                   seconds: _d
//                       ? 1
//                       : _c
//                           ? 2
//                           : 0),
//               curve: Curves.fastLinearToSlowEaseIn,
//               height: _d
//                   ? _h
//                   : _c
//                       ? 80
//                       : 20,
//               width: _d
//                   ? _w
//                   : _c
//                       ? 200
//                       : 20,
//               decoration: BoxDecoration(
//                   color: _b ? Colors.white : Colors.transparent,
//                   // shape: _c? BoxShape.rectangle : BoxShape.circle,
//                   borderRadius:
//                       _d ? BorderRadius.only() : BorderRadius.circular(30)),
//               child: Center(
//                 child: _e
//                     ? AnimatedTextKit(
//                         totalRepeatCount: 1,
//                         animatedTexts: [
//                           FadeAnimatedText(
//                             'Nasaem Khair',
//                             duration: Duration(milliseconds: 1700),
//                             textStyle: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ThisIsFadeRoute extends PageRouteBuilder {
//   final Widget page;

//   ThisIsFadeRoute({required this.page})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               FadeTransition(
//             opacity: animation,
//             child: page,
//           ),
//         );
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nko_flutter/Core/constants/imageasset.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition(Main_Screen()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 98, 128),
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'Nasaem Khair',
                  style: TextStyle(
                    color: Color.fromARGB(255, 39, 204, 172),
                    //   fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _width / _containerSize,
                width: _width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(AppImageAsset.onBordingImagesFour),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1500),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn, parent: animation);
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                  sizeFactor: animation, child: page, axisAlignment: 0),
            );
          },
        );
}
