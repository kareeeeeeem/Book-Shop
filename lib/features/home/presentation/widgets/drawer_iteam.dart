

import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';

class DrawerIteam extends StatelessWidget {
  const DrawerIteam({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: whiteColor, size: 20),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
