import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_strings.dart';

import 'package:naraakom/features/home/presentation/widgets/home_screen_body.dart';
import 'package:naraakom/features/home/presentation/widgets/profile_drawer.dart';

import '../../../core/widgets/custom_app_bar.dart';
import 'manager/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..allDoctorSpecialist(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.home,
        ),
        drawer: ProfileDrawer(),
        body: HomeScreenBody(),
      ),
    );
  }
}
