import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/login_cubit.dart';

class LoginScreenEmail extends StatelessWidget {
  const LoginScreenEmail({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: AppStrings.email,
      textInputType: TextInputType.emailAddress,
      controller: cubit.email,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.pleaseEmail;
        } else if (value.validateEmail == false) {
          return AppStrings.pleaseEmailTrue;
        }
        return null;
      },
    );
  }
}