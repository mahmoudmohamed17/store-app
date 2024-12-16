import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';

OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: kPrimaryColor),
      );
  }