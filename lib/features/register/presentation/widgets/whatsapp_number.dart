import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/register_cubit.dart';

class WhatsAppNumber extends StatelessWidget {
  const WhatsAppNumber({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.number,
      hintText: 'رقم الواتساب',
      controller: cubit.requiredWhatsApp,
      validator: (value) {
        if (value!.isEmpty) {
          return "ادخل رقم الواتساب من فضلك";
        } else if (value.length != 11) {
          return "رقم الواتساب يجب ان يكون 11 رقم";
        }
        return null;
      },
    );
  }
}