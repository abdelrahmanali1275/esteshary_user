import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import '../../core/widgets/custom_app_bar.dart';
import 'presentation/widgets/new_reservation_body.dart';

class NewReservationScreen extends StatelessWidget {
  const NewReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewReservationCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.timeAvailable,
        ),
        body: NewReservationBody(),
      ),
    );
  }
}
