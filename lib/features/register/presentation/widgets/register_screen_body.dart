import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/login/presentation/pages/login_screen.dart';
import 'package:naraakom/features/register/presentation/widgets/register_age.dart';
import 'package:naraakom/features/register/presentation/widgets/register_education.dart';
import 'package:naraakom/features/register/presentation/widgets/register_email.dart';
import 'package:naraakom/features/register/presentation/widgets/register_gender.dart';
import 'package:naraakom/features/register/presentation/widgets/register_job.dart';
import 'package:naraakom/features/register/presentation/widgets/register_name.dart';
import 'package:naraakom/features/register/presentation/widgets/register_pass.dart';
import 'package:naraakom/features/register/presentation/widgets/whatsapp_number.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/show_toast.dart';
import '../manager/register_cubit.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrState) {
            showToast(text: state.message, state: ToastStates.error);
          }
          if (state is RegisterSuccessState) {
            showToast(text: state.message, state: ToastStates.success);
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Form(
            key: cubit.key,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Image.asset(
                      AppAssets.splach,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Text(
                    "تسجيل مستخدم جديد",
                    style: CustomTextStyles.bodyLargeBlack900Bold20,
                  ),
                  20.height,
                  Text(
                    "الاسم",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  RegisterName(cubit: cubit),
                  10.height,
                  Text(
                    AppStrings.email,
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  RegisterEmail(cubit: cubit),
                  10.height,
                  Text(
                    AppStrings.password,
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  RegisterPass(cubit: cubit),
                  10.height,
                  Text(
                    "العمر",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  RegisterAge(cubit: cubit),
                  10.height,
                  Text(
                    "المستوى التعليمى",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  RegisterEducation(cubit: cubit),
                  10.height,
                  Text(
                    "الوظيفة",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  RegisterJob(cubit: cubit),
                  10.height,
                  Text(
                    "رقم الواتساب",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  WhatsAppNumber(cubit: cubit),
                  10.height,
                  Text(
                    "* اختياري",
                    style: CustomTextStyles.bodyMediumPrimary,
                  ),
                  10.height,
                  Text(
                    "رقم واتساب اخر",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  CustomTextFormField(
                    textInputType: TextInputType.number,
                    hintText: 'رقم واتساب اخر',
                    controller: cubit.optionalWhatsApp,
                  ),
                  10.height,
                  RegisterGender(cubit: cubit),
                  20.height,
                  state is RegisterLoadingGetDataUserState
                      ? Center(child: CircularProgressIndicator())
                      : CustomAppBottom(
                          label: AppStrings.login,
                          onPressed: () async {
                            if (cubit.key.currentState!.validate()) {
                              await cubit.register(context);
                            }
                          },
                        ),
                ]),
          );
        },
      ),
    );
  }
}
















