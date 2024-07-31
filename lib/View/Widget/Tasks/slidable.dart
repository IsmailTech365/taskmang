import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/bindings.dart';
import 'package:nko_flutter/Controller/viewTaskcontroller.dart';
import 'package:nko_flutter/Core/constants/color.dart';
import 'package:nko_flutter/View/Task/edit_task.dart';
import 'package:nko_flutter/View/Widget/Tasks/card_task.dart';
import '../../../Data/Model/tasks.dart';

class SlidableTask extends GetView<ViewTaskscontroller> {
  const SlidableTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.data.length,
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    onPressed: (_) {
                      Get.to(
                          () => Edit_Task(idb: {
                                'id': controller.data[i]['id'],
                                'Supoort': controller.data[i]['Supoort'],
                                'Date': controller.data[i]['Date'],
                                'Target': controller.data[i]['Target'],
                                'Team': controller.data[i]['Team'],
                                'Destination': controller.data[i]
                                    ['Destination'],
                                'Point': controller.data[i]['Point'],
                              }),
                          binding: Binding_edit_task());
                    },
                    backgroundColor: AppColor.white,
                    foregroundColor: AppColor.blue,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    flex: 1,
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    onPressed: (_) {
                      controller.pdfTask(Tasks.fromJson(controller.data[i]));
                    },
                    backgroundColor: AppColor.white,
                    foregroundColor: AppColor.blue,
                    icon: Icons.print,
                    label: 'Print',
                  )
                ],
              ),
              child: Card_Task(t: Tasks.fromJson(controller.data[i])));
        });
  }
}
