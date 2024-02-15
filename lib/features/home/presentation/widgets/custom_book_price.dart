import 'package:bookly/config/manager/appsetting_cubit.dart';
import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/helper/function/lanucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookPrice extends StatelessWidget {
  const BookPrice({
    super.key,
    required this.price,
    required this.url,
  });
  final String price;
  final String url;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AppsettingCubit>(context);
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: bloc.languageCode == 'en'
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                ),
              ),
              child: Text(
                price == 'NOT_FOR_SALE' ? 'Not for Sale' : '$price €',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () async {
                await launchCustomUr(context, url);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: orangeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: bloc.languageCode == 'en'
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12),
                        )
                      : const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                ),
              ),
              child: Text(
                'preview',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
