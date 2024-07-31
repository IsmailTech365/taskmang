import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/onbording_controller.dart';
import 'package:nko_flutter/Core/constants/color.dart';
import 'package:nko_flutter/View/Widget/onbording/custombutton.dart';
import 'package:nko_flutter/View/Widget/onbording/customslider.dart';
import 'package:nko_flutter/View/Widget/onbording/dotcontroller.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ONBordingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.backgoundBording,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBording(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBording(),
                    Spacer(flex: 2),
                    CustomBordingButton(),
                  ],
                ))
          ]),
        ));
  }
}
