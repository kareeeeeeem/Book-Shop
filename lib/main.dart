import 'package:bookly/config/manager/appsetting_cubit.dart';
import 'package:bookly/config/router/router.dart';
import 'package:bookly/config/theme/theme.dart';
import 'package:bookly/core/service_locator/locator.dart';
import 'package:bookly/firebase_options.dart';
import 'package:bookly/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppsettingCubit bloc = AppsettingCubit();
  await Future.wait([bloc.cashTheme(), bloc.cashLanguage()]);
  Bloc.observer = MyBlocObserver();
  setUpLocator();
  runApp(
    BlocProvider(
      create: (context) => bloc,
      child: const BookShope(),
    ),
  );
}

class BookShope extends StatelessWidget {
  const BookShope({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<AppsettingCubit, AppsettingState>(
          builder: (context, state) {
            AppsettingCubit bloc = BlocProvider.of<AppsettingCubit>(context);
            return MaterialApp(
              locale: Locale(bloc.languageCode),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              themeMode: bloc.appTheme,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              onGenerateRoute: AppRouter.onGenerateRoutes,
            );
          },
        );
      },
    );
  }
}
