// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/constants/color.dart';

import '../../../Controller/vac_add_controller.dart';
import '../Tasks/TextFormField.dart';

class StepperAddVAc extends StatelessWidget {
  StepperAddVAc({super.key});
  final Vac_add_controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: c.formkey,
      child: ListView(
        children: [
          Obx(
            () => Stepper(
              type: StepperType.vertical,
              currentStep: c.currentStep.value,
              onStepContinue: c.onStepContinue,
              onStepCancel: c.onStepCancel,
              onStepTapped: c.onStepTapped,
              controlsBuilder: c.controlBuilders,
              steps: [
                Step(
                  title: const Text("طلب إجازة"),
                  content: const Row(
                    children: [
                      Text('هل تريد تقديم طلب اجازة؟'),
                    ],
                  ),
                  isActive: c.currentStep.value >= 0,
                  state: c.currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text("نوع الاجازة"),
                  content: Wrap(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => RadioListTile<int>(
                                title: const Text(
                                  'اجازة اعتيادية',
                                  style: TextStyle(
                                    color:AppColor.blue,
                                  ),
                                ),
                                value: 1,
                                groupValue: c.selected_type_vac.value,
                                onChanged: (value) {
                                  c.selected_type_vac.value = value!;
                                },
                              )),
                          Obx(() => RadioListTile<int>(
                                title: const Text(
                                  'اجازة مرضية',
                                  style: TextStyle(
                                    color:AppColor.blue,
                                  ),
                                ),
                                value: 2,
                                groupValue: c.selected_type_vac.value,
                                onChanged: (value) {
                                  c.selected_type_vac.value = value!;
                                },
                              )),
                          Obx(() => RadioListTile<int>(
                                title: const Text(
                                  'اجازة بلا اجر',
                                  style: TextStyle(
                                    color: AppColor.blue
                                  ),
                                ),
                                value: 3,
                                groupValue: c.selected_type_vac.value,
                                onChanged: (value) {
                                  c.selected_type_vac.value = value!;
                                },
                              )),
                        ],
                      ),
                    ),
                  ]),
                  state: c.currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                  isActive: c.currentStep.value >= 1,
                ),
                Step(
                  title: const Text("مدة الاجازة"),
                  content: Wrap(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => RadioListTile<int>(
                                title: const Text(
                                  'نصف يوم',
                                  style: TextStyle(
                                    color:AppColor.blue
                                  ),
                                ),
                                value: 1,
                                groupValue: c.selectedTimeVac.value,
                                onChanged: (value) {
                                  c.selectedTimeVac.value = value!;
                                },
                              )),
                          Obx(() => RadioListTile<int>(
                                title: const Text(
                                  'يوم واحد',
                                  style: TextStyle(
                                    color:AppColor.blue
                                  ),
                                ),
                                value: 2,
                                groupValue: c.selectedTimeVac.value,
                                onChanged: (value) {
                                  c.selectedTimeVac.value = value!;
                                },
                              )),
                          Obx(
                            () => RadioListTile<int>(
                              title: const Text(
                                'يومان',
                                style: TextStyle(
                                  color:AppColor.blue
                                ),
                              ),
                              value: 3,
                              groupValue: c.selectedTimeVac.value,
                              onChanged: (value) {
                                c.selectedTimeVac.value = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  state: c.currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                  isActive: c.currentStep.value >= 2,
                ),
                Step(
                  title: const Text("فترة الاجازة"),
                  content: Wrap(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => RadioListTile<int>(
                                title: const Text(
                                  'الفترة الصباحية',
                                  style: TextStyle(
                                    color: AppColor.blue
                                  ),
                                ),
                                value: 1,
                                groupValue: c.selectedProidVac.value,
                                onChanged: (value) {
                                  c.selectedProidVac.value = value!;
                                },
                              )),
                          Obx(() => RadioListTile<int>(
                                title: const Text(
                                  'الفترة المسائية',
                                  style: TextStyle(
                                    color: AppColor.blue
                                  ),
                                ),
                                value: 2,
                                groupValue: c.selectedProidVac.value,
                                onChanged: (value) {
                                  c.selectedProidVac.value = value!;
                                },
                              )),
                        ],
                      ),
                    ),
                  ]),
                  state: c.currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                  isActive: c.currentStep.value >= 3,
                ),
                Step(
                  title: const Text("تاريخ بدء الاجازة"),
                  content: MyTextFormField(
                    controller: c.startDateController,
                    lableText: 'Start Date',
                    hittext: 'Select Start Vacation',
                    prefix: const Icon(
                      color: AppColor.blue,
                      Icons.calendar_today_outlined,
                    ),
                    validatortext: (value) {
                      if (value.isEmpty) {
                        return 'يرجى اختيار تاريخ بدء الاجازة';
                      }
                      return null;
                    },
                    onedit: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    readonly: true,
                    keyboardtype: TextInputType.datetime,
                    ontapp: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (pickedDate != null) {
                        c.updateSelectedStartDate(pickedDate);
                      }
                    },
                  ),
                  state: c.currentStep >= 4
                      ? StepState.complete
                      : StepState.disabled,
                  isActive: c.currentStep.value >= 4,
                ),
                Step(
                    isActive: c.currentStep.value >= 5,
                    state: c.currentStep >= 5
                        ? StepState.complete
                        : StepState.disabled,
                    title: const Text('تأكيد الطلب'),
                    content: const Text(
                        'في حال ضغطت على موافق فإنه لايمكن التراجع عن الاجازة وسيتم ارسالها الى المدير ليتم الرفض او الموافقة'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
                      

// class StepperAddVAc extends StatefulWidget {
//   const StepperAddVAc({super.key});

//   @override
//   State<StepperAddVAc> createState() => _StepperAddVAcState();
// }

// class _StepperAddVAcState extends State<StepperAddVAc> {
//   int currentStep = 0;
//   continueStep() {
//     if (currentStep < 2) {
//       setState(() {
//         currentStep = currentStep + 1; //currentStep+=1;
//       });
//     }
//   }

//   cancelStep() {
//     if (currentStep > 0) {
//       setState(() {
//         currentStep = currentStep - 1; //currentStep-=1;
//       });
//     }
//   }

//   onStepTapped(int value) {
//     setState(() {
//       currentStep = value;
//     });
//   }

//   Widget controlBuilders(context, details) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           ElevatedButton(
//             onPressed: details.onStepContinue,
//             child: const Text('Next'),
//           ),
//           const SizedBox(width: 10),
//           OutlinedButton(
//             onPressed: details.onStepCancel,
//             child: const Text('Back'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stepper(
//         elevation: 0, //Horizontal Impact
//         // margin: const EdgeInsets.all(20), //vertical impact
//         controlsBuilder: controlBuilders,
//         type: StepperType.vertical,
//         // physics: const ScrollPhysics(),
//         onStepTapped: onStepTapped,
//         onStepContinue: continueStep,
//         onStepCancel: cancelStep,
//         currentStep: currentStep, //0, 1, 2
//         steps: [
//           Step(
//               title: const Text('Step 1'),
//               content: const Column(
//                 children: [
//                   Text('This is the first step.'),
//                 ],
//               ),
//               isActive: currentStep >= 0,
//               state:
//                   currentStep >= 0 ? StepState.complete : StepState.disabled),
//           Step(
//             title: const Text('Step 2'),
//             content: const Text('This is the Second step.'),
//             isActive: currentStep >= 1,
//             state: currentStep >= 1 ? StepState.complete : StepState.disabled,
//           ),
//           Step(
//             title: const Text('Step 3'),
//             content: const Text('This is the Third step.'),
//             isActive: currentStep >= 2,
//             state: currentStep >= 2 ? StepState.complete : StepState.disabled,
//           ),
//         ],
//       ),
//     );
//   }
// }
