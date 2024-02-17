import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/enter_doctor_cubit.dart';
import '../home/presentation/widgets/specialization_list.dart';

class EnterDoctor extends StatelessWidget {
  const EnterDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: AppStrings.specialestAvailable,
      ),
      body: Center(
        child: Column(
          children: [
            Text(AppStrings.specialestAvailable,
                style: CustomTextStyles.bodyLargeBlackFont40),
            30.height,
            BlocProvider(
              create: (context) => EnterDoctorCubit()..allDoctorSpecialist(),
              child: BlocBuilder<EnterDoctorCubit, EnterDoctorState>(
                builder: (context, state) {
                  if (state is AllDoctorErr) {
                    return Text(state.err);
                  }
                  if (state is AllDoctorSuccess) {
                    return SpecializationList(
                      data: state.data,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
