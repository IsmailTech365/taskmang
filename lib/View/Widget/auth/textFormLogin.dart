// // ignore_for_file: prefer_const_constructors, must_be_immutable, unnecessary_string_interpolations, file_names, unnecessary_null_comparison

// import 'package:flutter/material.dart';

// class MyTextFormFieldAuth extends StatefulWidget {
//   TextEditingController? controller;
//   String lableText;
//   String hittext;
//   Widget prefix;
//   Widget? suffix;
//   dynamic onsav;
//   dynamic onchange;
//   dynamic ontapp;
//   dynamic onedit;
//   String? txt;
//   String? placeholder;
//   bool ispasswordtextfield;

//   bool readonly;
//   TextInputType keyboardtype;
//   MyTextFormFieldAuth(
//       {Key? key,
//       this.controller,
//       this.suffix,
//       this.txt,
//       this.placeholder,
//       this.onchange,
//       this.onsav,
//       required this.ispasswordtextfield,
//       required this.lableText,
//       required this.prefix,
//       required this.ontapp,
//       required this.onedit,
//       required this.keyboardtype,
//       required this.readonly,
//       required this.hittext})
//       : super(key: key);

//   @override
//   State<MyTextFormFieldAuth> createState() => _MyTextFormFieldAuthState();
// }

// class _MyTextFormFieldAuthState extends State<MyTextFormFieldAuth> {
//   late bool ob = true;

//   IconData? c = Icons.remove_red_eye;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       initialValue: widget.txt,
//       onEditingComplete: widget.onedit,
//       onTap: widget.ontapp,
//       onSaved: widget.onsav,
//       onChanged: widget.onchange,
//       keyboardType: widget.keyboardtype,
//       obscureText: widget.ispasswordtextfield ? ob : false,
//       controller: widget.controller,
//       readOnly: widget.readonly,
//       textDirection: TextDirection.rtl,
//       style: TextStyle(
//           color: Colors.white,
//           fontSize: 18,
//           fontFamily: 'Tajawal',
//           decorationColor: Colors.white,
//           decorationStyle: TextDecorationStyle.dashed),
//       decoration: InputDecoration(
//           hoverColor: Colors.white,
//           labelText: widget.lableText,
//           hintText: widget.hittext,
//           prefixIcon: widget.prefix,
//           suffixIcon: widget.ispasswordtextfield
//               ? IconButton(
//                   onPressed: () {
//                     setState(() {
//                       if (ob == true) {
//                         ob = false;
//                         c = Icons.remove_circle;
//                       } else {
//                         ob = true;
//                         c = Icons.remove_red_eye;
//                       }
//                     });
//                   },
//                   icon: Icon(
//                     c,
//                     color: Color.fromARGB(255, 255, 255, 255),
//                   ),
//                 )
//               : widget.suffix,
//           prefixIconColor: Colors.white,
//           hintStyle: TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
//           iconColor: Colors.white,
//           labelStyle: TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//           ),
//           focusColor: Colors.white,
//           border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.white,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(20)))),
//       validator: (value) => value != null && value.isEmpty
//           ? ' ${widget.lableText} هذا الحقل مطلوب الرجاء ادخل الـ'
//           : null,
//       cursorHeight: 22,
//       textAlign: TextAlign.right,
//       textAlignVertical: TextAlignVertical.bottom,
//       mouseCursor: SystemMouseCursors.text,
//       cursorColor: Color.fromARGB(255, 39, 204, 172),
//     );
//   }
// }

// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/login_controller.dart';

class Login_TextField extends StatelessWidget {
  TextEditingController? mycontroller;
  String lableText;
  String hittext;
  Widget prefix;
  Widget? suffix;
  dynamic onsav;
  dynamic onchange;
  dynamic ontapp;
  dynamic onedit;
  String? txt;
  String? placeholder;
  bool ispasswordtextfield;

  bool readonly;
  TextInputType keyboardtype;
  Login_TextField(
      {super.key,
      this.mycontroller,
      this.suffix,
      this.txt,
      this.placeholder,
      this.onchange,
      this.onsav,
      required this.ispasswordtextfield,
      required this.lableText,
      required this.prefix,
      required this.ontapp,
      required this.onedit,
      required this.keyboardtype,
      required this.readonly,
      required this.hittext});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Login_controller>(
        builder: (c) => Container(
              width: MediaQuery.of(context).size.width - 10,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                initialValue: txt,
                onEditingComplete: onedit,
                onTap: ontapp,
                onSaved: onsav,
                onChanged: onchange,
                keyboardType: keyboardtype,
                obscureText: ispasswordtextfield ? c.ob : false,
                controller: mycontroller,
                readOnly: readonly,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Tajawal',
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.dashed),
                decoration: InputDecoration(
                    hoverColor: Colors.white,
                    labelText: lableText,
                    hintText: hittext,
                    prefixIcon: prefix,
                    suffixIcon: ispasswordtextfield
                        ? IconButton(
                            onPressed: () {
                              c.onchange_suffixIcon();
                            },
                            icon: Icon(
                              c.c,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          )
                        : suffix,
                    prefixIconColor: Colors.white,
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                    iconColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    focusColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                validator: (value) => value != null && value.isEmpty
                    ? ' $lableText هذا الحقل مطلوب الرجاء ادخل الـ'
                    : null,
                cursorHeight: 22,
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.bottom,
                mouseCursor: SystemMouseCursors.text,
                cursorColor: const Color.fromARGB(255, 39, 204, 172),
              ),
            ));
  }
}
