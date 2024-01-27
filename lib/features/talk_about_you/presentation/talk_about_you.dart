import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/features/talk_about_you/presentation/manager/talk_about_cubit.dart';

import 'widgets/talk_about_you_body.dart';

class TalkAboutYou extends StatelessWidget {
  const TalkAboutYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.talkAboutYou,
      ),
      body: BlocProvider(
        create: (context) => TalkAboutCubit(),
        child: TalkAboutYouBody(),
      ),
    );
  }
}
