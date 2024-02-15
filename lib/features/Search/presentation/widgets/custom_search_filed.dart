import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({super.key, this.onChanged, required this.controller});
final Function(String)? onChanged;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller:controller ,
        onChanged:onChanged,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
                color: whiteColor,
              ),
              onPressed: () {},
            ),
            hintText:AppLocalizations.of(context)!.searchYourBook ,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 2,
                  color: whiteColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 2,
                  color: whiteColor,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 2,
                  color: whiteColor,
                ),),),
      ),
    );
  }
}
