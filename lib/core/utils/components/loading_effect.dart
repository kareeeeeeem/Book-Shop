import 'package:bookly/core/utils/helper/shimmer.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingEffect extends StatelessWidget {
  const LoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      width: SizeOfScreen.screenWidth(context),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const Gap(30),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerEffect(
                    width: double.infinity,
                    child: Container(
                      height: 10,
                      color: Colors.grey.withOpacity(.1),
                    )),
                const Gap(10),
                ShimmerEffect(
                    width: SizeOfScreen.screenWidth(context) * .5,
                    child: Container(
                      height: 10,
                      color: Colors.grey.withOpacity(.1),
                    )),
                const Gap(10),
                ShimmerEffect(
                    width: SizeOfScreen.screenWidth(context) * .3,
                    child: Container(
                      height: 10,
                      color: Colors.grey.withOpacity(.1),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
