import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetialsCustomAppBar extends StatelessWidget {
  const DetialsCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FontAwesomeIcons.x,
            size: 25,
            color: whiteColor,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            size: 25,
            FontAwesomeIcons.cartShopping,
            color: whiteColor,
          ),
        ),
      ],
    );
  }
}
