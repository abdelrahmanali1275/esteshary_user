import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/register_cubit.dart';

class RegisterAge extends StatelessWidget {
  const RegisterAge({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.number,
      hintText: 'العمر',
      controller: cubit.age,
      validator: (value) {
        if (value!.isEmpty) {
          return "ادخل العمر من فضلك";
        }
        return null;
      },
    );
  }
}