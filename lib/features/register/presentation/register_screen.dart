import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/features/home/presentation/home.dart';

import '../../../core/widgets/custom_app_bottom.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController age = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController requiredWhatsApp = TextEditingController();
  TextEditingController optionalWhatsApp = TextEditingController();
  String gender = "";
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: key,
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
                    10.height,
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'الاسم',
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل الاسم من فضلك";
                        }
                        return null;
                      },
                    ),
                    20.height,
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'البريد الالكترونى',
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل البريد الالكترونى من فضلك";
                        }
                        return null;
                      },
                    ),
                    20.height,
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'العمر',
                      controller: age,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل العمر من فضلك";
                        }
                        return null;
                      },
                    ),
                    30.height,
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'كلمة السر',
                      controller: pass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل كلمة السر من فضلك";
                        }
                        return null;
                      },
                    ),
                    20.height,
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'المستوى التعليمى',
                      controller: education,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل المستوى التعليمى من فضلك";
                        }
                        return null;
                      },
                    ),
                    20.height,
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'الوظيفة',
                      controller: job,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل الوظيفة من فضلك";
                        }
                        return null;
                      },
                    ),
                    20.height,
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'رقم الواتساب',
                      controller: requiredWhatsApp,
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
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      hintText: 'رقم واتساب اخر',
                      controller: optionalWhatsApp,
                    ),
                    20.height,

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
                          hint:  Text("النوع",style: CustomTextStyles.bodyMediumBlack20001),
                          items:  [
                            DropdownMenuItem(
                              value: "ذكر",
                              child: Text("ذكر",style: CustomTextStyles.bodyMediumBlack20001),
                            ),
                            DropdownMenuItem(
                              value: "انثي",
                              child: Text("انثي",style: CustomTextStyles.bodyMediumBlack20001),
                            ),
                          ],
                          onChanged: (v) {
                            gender = v!;
                          }),
                    ),
                    10.height,
                    CustomAppBottom(
                      label: 'تسجيل',
                      onPressed: () {
                        HomeScreen().launch(context);
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
