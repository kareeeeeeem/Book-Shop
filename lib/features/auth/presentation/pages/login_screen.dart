import 'package:bookly/config/router/routes.dart';
import 'package:bookly/core/utils/helper/function/custom_snackbar.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:bookly/features/auth/manager/auth_cubit.dart';
import 'package:bookly/features/auth/manager/auth_even.dart';
import 'package:bookly/features/auth/manager/auth_state.dart';
import 'package:bookly/features/auth/presentation/widgets/custom_button.dart';
import 'package:bookly/features/auth/presentation/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is LoginLoadingState) {
                  const Center(child: CircularProgressIndicator());
                } else if (state is LoginSuccessState) {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.home,
                  );
                } else if (state is LoginErrorState) {
                  customSnackBar(context, state.errorMassage);
                }
              },
              builder: (context, state) {
                return Form(
                  autovalidateMode: bloc.autovalidateModeLogin,
                  key: bloc.formLoginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(100),
                      Center(
                        child: Image.asset(
                          'assets/images/Logo.png',
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.15, // هنا تم استخدام 0.15 بدلاً من 0.2 لتقليل ارتفاع الصورة
                          fit: BoxFit.fill,
                        ),


                      ),
                      const Gap(30),
                      Text(
                        'Book Shop',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(20),
                       Text(
                        AppLocalizations.of(context)!.login,
                        textAlign: TextAlign.start,
                      ),
                      const Gap(20),
                      CustomTextFiled(
                        onSaved: (value) {
                          bloc.loginEmail = value!;
                        },
                        hintText: AppLocalizations.of(context)!.enterEmail,
                        type: AppLocalizations.of(context)!.email.trim(),
                        inputType: TextInputType.emailAddress,
                      ),
                      const Gap(20),
                      CustomTextFiled(
                        onSaved: (value) {
                          bloc.loginPassword = value!;
                        },
                        hintText:AppLocalizations.of(context)!.enterPassword,
                        type: AppLocalizations.of(context)!.password,
                        inputType: TextInputType.text,
                        visiable: true,
                      ),
                      const Gap(20),
                      CustomButton(
                        type: AppLocalizations.of(context)!.login,
                        function: () {
                          bloc.add(ValidateLogin());
                        },
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                          AppLocalizations.of(context)!.dontHaveAnAccount,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.regsisterPage);
                            },
                            child: Text(
                            AppLocalizations.of(context)!.creatOne,
                              style:const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
