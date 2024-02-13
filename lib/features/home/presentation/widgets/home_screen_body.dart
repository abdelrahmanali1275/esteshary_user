import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/helper/save_data.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/show_toast.dart';
import 'package:naraakom/features/chat/presentation/pages/chat_screen.dart';
import 'package:naraakom/features/home/presentation/widgets/specialization_list.dart';
import 'package:naraakom/features/new_reservation/enter_doctor.dart';
import '../../../resume_reservation/presentaion/resume_reservation_screen.dart';
import '../../../talk_about_you/presentation/talk_about_you.dart';
import '../manager/home_cubit.dart';
import 'home_screen_circle_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  Widget build(BuildContext context) {
    return Column(
      children: [
        30.height,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeScreenCircleWidget(
                image: AppAssets.hagz,
                text: AppStrings.resumeReservation,
                function: () {
                  const ResumeReservationScreen().launch(context);
                },
              ),
              HomeScreenCircleWidget(
                image: AppAssets.chat,
                text: AppStrings.needHelp,
                function: () {
                  ChatScreen(
                    userId: CacheHelper.getUser().userId,
                  ).launch(context);
                },
              ),
              HomeScreenCircleWidget(
                image: AppAssets.newHagz,
                text: AppStrings.newReservation,
                function: () {
                  const EnterDoctor().launch(context);
                },
              ),
              HomeScreenCircleWidget(
                image: AppAssets.newHagz,
                text: AppStrings.talkAboutYou,
                function: () {
                  const TalkAboutYou().launch(context);
                },
              ),
            ],
          ),
        ),
        30.height,
        Text(
          AppStrings.specialestAvailable,
          style: CustomTextStyles.bodyLargeBlackFont40,
        ),
        30.height,
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSpecialistErr) {
              showToast(text: state.err, state: ToastStates.error);
            }
            if (state is HomeSpecialistSuccess) {
              return SpecializationList(
                data: state.doctor,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
