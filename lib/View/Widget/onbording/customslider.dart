// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/onbording_controller.dart';
import 'package:nko_flutter/Core/constants/color.dart';
import 'package:nko_flutter/Data/datasource/static/static.dart';

class CustomSliderOnBording extends GetView<ONBordingControllerImp> {
  const CustomSliderOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (value) {
        print(value);
        controller.onPageChanged(value);
      },
      itemCount: onBordingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(onBordingList[i].title!,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 80),
          Image.asset(onBordingList[i].image!,
              width: 200, height: 200, fit: BoxFit.fill),
          const SizedBox(height: 80),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBordingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 2,
                  color: AppColor.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
