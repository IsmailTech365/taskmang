// ignore_for_file: prefer_const_constructors, must_be_immutable, unnecessary_string_interpolations, unnecessary_question_mark, file_names

import 'package:flutter/material.dart';
import 'package:nko_flutter/Core/constants/color.dart';

class MyTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String lableText;
  String hittext;
  Widget? prefix;
  dynamic ontapp;
  dynamic onedit;
  dynamic onchange;
  dynamic? onsave;
  dynamic validatortext;
  Widget? suffix;
  bool readonly;
  String? initialval;
  TextInputType keyboardtype;

  MyTextFormField(
      {super.key,
      this.controller,
      this.suffix,
      this.initialval,
      this.onsave,
      this.onchange,
      required this.lableText,
      this.prefix,
      this.ontapp,
      this.onedit,
      required this.keyboardtype,
      required this.readonly,
      this.validatortext,
      required this.hittext});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialval,
      onSaved: widget.onsave,
      onEditingComplete: widget.onedit,
      onTap: widget.ontapp,
      onChanged: widget.onchange,
      keyboardType: widget.keyboardtype,
      maxLines: 3,
      minLines: 1,
      controller: widget.controller,
      readOnly: widget.readonly,
      style:
          TextStyle(color: AppColor.blue, fontSize: 18, fontFamily: 'Tajawal'),
      decoration: InputDecoration(
          //  labelText: widget.lableText,
          suffixIcon: widget.suffix,
          hintText: widget.hittext,
          prefixIcon: widget.prefix,
          prefixIconColor: AppColor.blue,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16),
          iconColor: AppColor.blue,
          labelStyle: TextStyle(
            fontSize: 18,
            color: AppColor.blue,
          ),
          focusColor: AppColor.blue,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.blue,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)))),
      validator: widget.validatortext,
      textDirection: TextDirection.rtl,
      textAlignVertical: TextAlignVertical.bottom,
      cursorHeight: 22,
      textAlign: TextAlign.right,
      mouseCursor: SystemMouseCursors.text,
      cursorColor: AppColor.blue,
    );
  }
}
