import 'package:bookly/config/manager/appsetting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AppsettingCubit>(context);
    return BlocBuilder<AppsettingCubit, AppsettingState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          height: MediaQuery.of(context).size.height * .2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  bloc.changeLanguage('en');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('English',
                        style: Theme.of(context).textTheme.bodyMedium!),
                    bloc.languageCode == 'en'
                        ? const Icon(
                            Icons.check,
                            size: 35,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  bloc.changeLanguage('ar');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('العربية',
                        style: Theme.of(context).textTheme.bodyMedium!),
                    bloc.languageCode == 'en'
                        ? const SizedBox.shrink()
                        : const Icon(
                            Icons.check,
                            size: 35,
                          ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
