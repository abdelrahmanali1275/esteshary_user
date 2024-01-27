import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/register_cubit.dart';

class RegisterName extends StatelessWidget {
  const RegisterName({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.name,
      hintText: 'الاسم',
      controller: cubit.name,
      validator: (value) {
        if (value!.isEmpty) {
          return "ادخل الاسم من فضلك";
        }
        return null;
      },
    );
  }
}