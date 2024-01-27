import 'package:flutter/widgets.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/register_cubit.dart';

class RegisterJob extends StatelessWidget {
  const RegisterJob({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.text,
      hintText: 'الوظيفة',
      controller: cubit.job,
      validator: (value) {
        if (value!.isEmpty) {
          return "ادخل الوظيفة من فضلك";
        }
        return null;
      },
    );
  }
}