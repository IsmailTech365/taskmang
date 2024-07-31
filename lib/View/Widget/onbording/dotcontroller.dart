import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nko_flutter/Controller/onbording_controller.dart';
import 'package:nko_flutter/Core/constants/color.dart';
import 'package:nko_flutter/Data/datasource/static/static.dart';

class CustomDotControllerOnBording extends StatelessWidget {
  const CustomDotControllerOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ONBordingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBordingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
