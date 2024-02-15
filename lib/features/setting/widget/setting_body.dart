import 'package:bookly/config/manager/appsetting_cubit.dart';
import 'package:bookly/features/setting/widget/custom_settingbottom_sheet.dart';
import 'package:bookly/features/setting/widget/language_bottomsheet.dart';
import 'package:bookly/features/setting/widget/themeing_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AppsettingCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Text(
            bloc.languageCode == 'en' ? 'Language' : 'اللغه',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(10),
          CustomSettingBottomSheet(
            text: bloc.languageCode == 'en' ? 'English' : 'العربيه',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const LanguageBottomSheet(),
              );
            },
          ),
          const Gap(20),
          Text(
            AppLocalizations.of(context)!.themeing,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(10),
          CustomSettingBottomSheet(
            text: bloc.appTheme == ThemeMode.dark
                ? AppLocalizations.of(context)!.dark
                : AppLocalizations.of(context)!.light,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const ThemeingBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
