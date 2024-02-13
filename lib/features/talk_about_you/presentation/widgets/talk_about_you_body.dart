import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/features/talk_about_you/presentation/manager/talk_about_cubit.dart';
import 'package:naraakom/features/talk_about_you/presentation/widgets/record.dart';

import '../../../../core/widgets/show_toast.dart';

class TalkAboutYouBody extends StatelessWidget {
  const TalkAboutYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: BlocConsumer<TalkAboutCubit, TalkAboutState>(
          listener: (context, state) {
            if (state is RecordSuccessState) {
              showToast(text: state.message, state: ToastStates.success);
            }
            if (state is RecordSuccessErrState) {
              showToast(text: state.err, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            var cubit = TalkAboutCubit().get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "اشرح للطبيب عن حالتك او استفسارك باختصار",
                  style: CustomTextStyles.bodyLargeBlack900Bold25,
                  textAlign: TextAlign.center,
                ),
                10.height,
                Form(
                  key: cubit.key,
                  child: CustomTextFormField(
                    hintText: 'اخبر الطبيب عن الأعراض التي تعاني منها',
                    maxLines: 10,
                    maxLength: 300,
                    controller: cubit.textController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "لا يوجد شرح للحالة";
                      } else if (value.length < 5) {
                        return "الشرح لا يمكن ان يقل عن 50 حرف";
                      }
                      return null;
                    },
                  ),
                ),
                20.height,
                FilledButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: AppColors.whiteA700,
                          title: Column(
                            children: [
                              Text(
                                " اضغط هنا لتسجيل حالتك صوتيا",
                                style: CustomTextStyles.bodyMediumBlack20001,
                              ),
                              RecordScreen(
                                cubit: cubit,
                              ),
                              Row(
                                children: [
                                  Text("متابعة").onTap(() {
                                    print(cubit.getDownloadAudioURL());
                                    cubit.recorder.closeRecorder();
                                    Navigator.pop(context);
                                  }),
                                  20.width,
                                  Text(
                                    "الغاء",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.mic,
                    )),
                50.height,
                state is RecordSuccessLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : CustomAppBottom(
                        label: AppStrings.continue0,
                        onPressed: () async {
                          if (cubit.key.currentState!.validate()) {
                            await cubit.recordSuccess();
                            cubit.textController.clear();
                          }
                        },
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
