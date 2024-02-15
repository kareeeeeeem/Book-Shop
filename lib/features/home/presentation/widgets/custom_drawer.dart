import 'package:bookly/config/router/routes.dart';
import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/images/images.dart';
import 'package:bookly/features/home/presentation/widgets/drawer_iteam.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Image.asset(AppImages.logo),
            const Gap(20),
            Text(
              '${AppLocalizations.of(context)!.email} : ${FirebaseAuth.instance.currentUser?.email!}',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const Gap(5),
            Divider(
              color: Colors.grey.withOpacity(.5),
              thickness: 2,
            ),
            const Gap(10),
            DrawerIteam(
              icon: Icons.home,
              title: AppLocalizations.of(context)!.home,
              onTap: () {
                Scaffold.of(context).closeDrawer();
              },
            ),
            const Gap(10),
            DrawerIteam(
              icon: FontAwesomeIcons.magnifyingGlass,
              title: AppLocalizations.of(context)!.searchYourBook,
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Navigator.pushNamed(context, AppRoutes.search);
              },
            ),
            const Gap(10),
            DrawerIteam(
              icon: Icons.settings,
              title: AppLocalizations.of(context)!.setting,
              onTap: () {
                Scaffold.of(context).closeDrawer();
                Navigator.pushNamed(context, AppRoutes.setting);
              },
            ),
            const Spacer(
              flex: 3,
            ),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.loginPage));
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      width: 1,
                      color: whiteColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.logOut,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: whiteColor),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
