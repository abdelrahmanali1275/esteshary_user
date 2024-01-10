import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/login/presentation/manager/login_cubit.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bottom.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../home/presentation/home.dart';
import '../../../../register/presentation/register_screen.dart';

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
          child: BlocBuilder<LoginCubit, LoginState>(
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
                          CustomTextFormField(
                            hintText: AppStrings.email,
                            controller: cubit.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.pleaseEmail;
                              }
                              return null;
                            },
                          ),
                          10.height,
                          Text(
                            AppStrings.password,
                            style: CustomTextStyles.bodyMediumGrey600,
                          ),
                          10.height,
                          CustomTextFormField(
                            textInputType: TextInputType.visiblePassword,
                            hintText: AppStrings.password,
                            controller: cubit.pass,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.pleasePassword;
                              }
                              return null;
                            },
                          ),
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
                          CustomAppBottom(
                            label: AppStrings.login,
                            onPressed: () {
                             HomeScreen().launch(context);
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
