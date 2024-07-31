import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/onbording_controller.dart';
import 'package:nko_flutter/Core/constants/color.dart';

class CustomBordingButton extends GetView<ONBordingControllerImp> {
  const CustomBordingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 40,
      child: MaterialButton(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: () {
          controller.next();
        },
        color: AppColor.blue,
        child: const Text(
          'Continue',
          style: TextStyle(color: AppColor.white),
        ),
      ),
    );
  }
}
