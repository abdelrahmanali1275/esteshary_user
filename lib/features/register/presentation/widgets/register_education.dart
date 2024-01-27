import 'package:flutter/material.dart';
import 'package:naraakom/features/register/presentation/manager/register_cubit.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterEducation extends StatelessWidget {
  const RegisterEducation({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.text,
      hintText: 'المستوى التعليمى',
      controller: cubit.education,
      validator: (value) {
        if (value!.isEmpty) {
          return "ادخل المستوى التعليمى من فضلك";
        }
        return null;
      },
    );
  }
}