import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: whiteColor),),
    ),
  );
}