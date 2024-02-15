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

class Register extends StatelessWidget {
  const Register({super.key});

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
                if (state is RegisterSuccessState) {
                  customSnackBar(context, 'Success');
                  Navigator.pushNamed(context, AppRoutes.home);
                } else if (state is RegisterErrorState) {
                  Navigator.pop(context);
                  customSnackBar(context, state.errorMassage);
                } else if (state is RegisterLoadingState) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: bloc.formRegisterkey,
                  autovalidateMode: bloc.autovalidateModeRegister,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(100),
                      Center(
                        child: Image.asset(
                          'assets/images/Logo.png',
                          width: SizeOfScreen.screenWidth(context),
                          height: SizeOfScreen.screenHeight(context) * .2,
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
                     AppLocalizations.of(context)!.signUp,
                        
                        textAlign: TextAlign.start,
                      ),
                      const Gap(20),
                      CustomTextFiled(
                        hintText: AppLocalizations.of(context)!.enterEmail,
                        onSaved: (value) {
                          bloc.registerEmail = value;
                        },
                        type: AppLocalizations.of(context)!.email.trim(),
                        inputType: TextInputType.name,
                        
                      ),
                      const Gap(20),
                      CustomTextFiled(
                        hintText: AppLocalizations.of(context)!.enterPassword,
                        type: AppLocalizations.of(context)!.password,
                        onSaved: (value) {
                          bloc.registerPassword = value;
                        },
                        visiable: true,
                        inputType: TextInputType.text,
                      ),
                      const Gap(20),
                      CustomButton(
                        type: AppLocalizations.of(context)!.signUp,
                        function: () {
                          bloc.add(ValidateRegeiseter());
                        },
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                           AppLocalizations.of(context)!.alreadyHaveAnAccount,
                            
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.loginPage);
                            },
                            child:  Text(
                             AppLocalizations.of(context)!.login,
                              style: const TextStyle(
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
