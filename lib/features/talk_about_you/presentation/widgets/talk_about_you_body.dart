import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/config/theme/custom_text_style.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/core/widgets/custom_text_form_field.dart';
import 'package:naraakom/features/talk_about_you/presentation/manager/talk_about_cubit.dart';

class TalkAboutYouBody extends StatelessWidget {
  const TalkAboutYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text(
              "اشرح للطبيب عن حالتك او استفسارك باختصار",
              style: CustomTextStyles.bodyLargeBlack900Bold25,
              textAlign: TextAlign.center,
            ),
            10.height,
            CustomTextFormField(
              hintText: 'اخبر الطبيب عن الأعراض التي تعاني منها',
              maxLines: 10,
              maxLength: 300,
            ),
            20.height,
            FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => BlocProvider(
                      create: (context) => TalkAboutCubit(),
                      child: BlocBuilder<TalkAboutCubit, TalkAboutState>(
                        builder: (context, state) {
                          var cubit = TalkAboutCubit().get(context);
                          return AlertDialog(
                            backgroundColor: AppColors.whiteA700,
                            title: Column(
                              children: [
                                Text(" اضغط هنا لتسجيل حالتك صوتيا",style: CustomTextStyles.bodyMediumBlack20001,),
                                FilledButton(
                                    onPressed: () {
                                      cubit.playIcon();
                                    },
                                    child: cubit.play == 1
                                        ? Icon(Icons.play_arrow)
                                        : Icon(Icons.stop)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.mic,
                )),
            50.height,
            CustomAppBottom(
              label: AppStrings.continue0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
