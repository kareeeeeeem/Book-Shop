import 'package:bookly/config/router/routes.dart';
import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/images/images.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SizedBox(
            child: Image.asset(
              AppImages.logo,
              width: SizeOfScreen.getWidth(75, context),
              height: SizeOfScreen.getHeight(16.1, context),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.search);
          },
          icon: const Icon(
            size: 25,
            color: whiteColor,
            FontAwesomeIcons.magnifyingGlass,
          ),
        )
      ],
    );
  }
}
