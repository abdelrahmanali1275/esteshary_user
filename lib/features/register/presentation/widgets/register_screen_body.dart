import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
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
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Text(state.message).paddingAll(10),
              ),
            );
          }
          if (state is RegisterSuccessState) {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Text(state.message).paddingAll(10),
              ),
            );
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
                  CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'الاسم',
                    controller: cubit.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل الاسم من فضلك";
                      }
                      return null;
                    },
                  ),
                  10.height,
                  Text(
                    AppStrings.email,
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  CustomTextFormField(
                    textInputType: TextInputType.emailAddress,
                    hintText: 'البريد الالكترونى',
                    controller: cubit.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل البريد الالكترونى من فضلك";
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
                    hintText: 'كلمة السر',
                    controller: cubit.pass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل كلمة السر من فضلك";
                      }
                      return null;
                    },
                  ),
                  10.height,
                  Text(
                    "العمر",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'العمر',
                    controller: cubit.age,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل العمر من فضلك";
                      }
                      return null;
                    },
                  ),
                  10.height,
                  Text(
                    "المستوى التعليمى",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'المستوى التعليمى',
                    controller: cubit.education,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل المستوى التعليمى من فضلك";
                      }
                      return null;
                    },
                  ),
                  10.height,
                  Text(
                    "الوظيفة",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'الوظيفة',
                    controller: cubit.job,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل الوظيفة من فضلك";
                      }
                      return null;
                    },
                  ),
                  10.height,
                  Text(
                    "رقم الواتساب",
                    style: CustomTextStyles.bodyMediumGrey600,
                  ),
                  10.height,
                  CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'رقم الواتساب',
                    controller: cubit.requiredWhatsApp,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل رقم الواتساب من فضلك";
                      }
                      return null;
                    },
                  ),
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
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'رقم واتساب اخر',
                    controller: cubit.optionalWhatsApp,
                  ),
                  10.height,
                  SizedBox(
                    child: DropdownButtonFormField(
                        isDense: true,
                        dropdownColor: AppColors.whiteA700,
                        borderRadius: BorderRadius.circular(13),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13)),
                        ),
                        hint: Text("النوع",
                            style: CustomTextStyles.bodyMediumBlack20001),
                        items: [
                          DropdownMenuItem(
                            value: "ذكر",
                            child: Text("ذكر",
                                style: CustomTextStyles.bodyMediumBlack20001),
                          ),
                          DropdownMenuItem(
                            value: "انثي",
                            child: Text("انثي",
                                style: CustomTextStyles.bodyMediumBlack20001),
                          ),
                        ],
                        onChanged: (v) {
                          cubit.gender = v!;
                        }),
                  ),
                  20.height,
                  state is RegisterLoadingGetDataUserState
                      ? Center(child: CircularProgressIndicator())
                      : CustomAppBottom(
                          label: AppStrings.login,
                          onPressed: () {
                            cubit.key.currentState!.validate();
                            cubit.register();
                          },
                        ),
                ]),
          );
        },
      ),
    );
  }
}
