import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/data/firebase/user.dart';
import 'package:naraakom/core/helper/functions/common.dart';
import 'package:naraakom/core/utils/extension/bool.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/login/presentation/manager/login_cubit.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bottom.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/show_toast.dart';
import '../../../../register/register_screen.dart';
import 'login_screen_email.dart';
import 'login_screen_pass.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginErrState) {
                showToast(text: state.message, state: ToastStates.error);
              }
              if (state is LoginSuccessState) {
                showToast(text: state.message, state: ToastStates.success);
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return Form(
                key: cubit.key,
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.splach,
                      width: 200,
                      height: 200,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            AppStrings.login,
                            style: CustomTextStyles.bodyLargeBlack900Bold20,
                          ),
                          20.height,
                          Text(
                            AppStrings.email,
                            style: CustomTextStyles.bodyMediumGrey600,
                          ),
                          10.height,
                          LoginScreenEmail(cubit: cubit),
                          10.height,
                          Text(
                            AppStrings.password,
                            style: CustomTextStyles.bodyMediumGrey600,
                          ),
                          10.height,
                          LoginScreenPass(cubit: cubit),
                          Row(
                            children: [
                              Text(
                                AppStrings.notHaveEmail,
                                style: CustomTextStyles.bodyMediumBlack20001,
                              ),
                              TextButton(
                                onPressed: () {
                                  RegisterScreen().launch(context);
                                },
                                child: Text(
                                  AppStrings.enterNow,
                                  style: CustomTextStyles.bodyMediumPrimary,
                                ),
                              ),
                            ],
                          ),
                          10.height,
                          state is LoginLoadingGetDataUserState
                              ? Center(child: CircularProgressIndicator())
                              : CustomAppBottom(
                                  label: AppStrings.login,
                                  onPressed: () {
                                    if (cubit.key.currentState!.validate()) {
                                      cubit.login(context);
                                    }
                                  },
                                )
                        ]),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
