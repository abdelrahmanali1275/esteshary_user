import 'package:flutter/material.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';

import 'widgets/resume_reservation_body.dart';

class ResumeReservationScreen extends StatelessWidget {
  const ResumeReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        appBar: CustomAppBar(
          text: "متابعة الحجز",
        ),
        body: ResumeReservationBody(),
      ),
    );
  }
}
