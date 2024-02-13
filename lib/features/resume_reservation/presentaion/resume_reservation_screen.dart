import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/features/resume_reservation/presentaion/manager/resume_cubit.dart';

import 'widgets/resume_reservation_body.dart';

class ResumeReservationScreen extends StatelessWidget {
  const ResumeReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: CustomAppBar(
          text: "متابعة الحجز",
        ),
        body: BlocProvider(
          create: (context) => ResumeCubit()..allRequests(),
          child: ResumeReservationBody(),
        ),
      ),
    );
  }
}
