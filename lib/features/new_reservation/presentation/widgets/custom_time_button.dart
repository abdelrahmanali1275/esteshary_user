import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import 'custom_filled_button.dart';

class CustomTimeButton extends StatelessWidget {
  const CustomTimeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReservationCubit, NewReservationState>(
      builder: (context, state) {
        return FilledButton(
          onPressed: () {
            context.read<NewReservationCubit>().getDayTimer();
            showModalBottomSheet(
              context: context,
              builder: (context) =>
                  BlocBuilder<NewReservationCubit, NewReservationState>(
                builder: (context, state) {
                  if (state is NewReservationLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is GetTimeLoaded) {
                    return Container(
                      width: double.maxFinite,
                      decoration: AppDecoration.fillWhiteA,
                      child: ListView(
                        children: [
                          20.height,
                          Chip(
                            label: Text(AppStrings.timeAvailable),
                          ),
                          context.read<NewReservationCubit>().day2 != null
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => state
                                          .timer.isNotEmpty
                                      ? CustomFilledButton(
                                          from: '${state.timer[index].from}',
                                          to: '${state.timer[index].to}',
                                          num: state.timer[index].num!,
                                    active:state.timer[index].active!
                                  )
                                      : Center(
                                          child: Text(
                                              "لا يوجد مواعيد متاحة لهذا اليوم",
                                              style: CustomTextStyles
                                                  .bodyLargeBlack900Bold20),
                                        ),
                                  separatorBuilder: (context, index) =>
                                      20.height,
                                  itemCount: state.timer.isEmpty
                                      ? 1
                                      : state.timer.length)
                              : Center(
                                  child: Text("برجاء اختيار اليوم من فضلك",
                                      style: CustomTextStyles
                                          .bodyLargeBlack900Bold20)),
                        ],
                      ),
                    );
                  }
                  if (state is GetTimeErr) {
                    print(state.message);
                    return Center(child: CircularProgressIndicator());
                  }
                  return SizedBox();
                },
              ),
            );
          },
          child: context.read<NewReservationCubit>().day2 == null
              ? Text("اليوم", style: CustomTextStyles.bodyMediumBlack20001)
              : Text(
                  "${context.read<NewReservationCubit>().day2} ${context.read<NewReservationCubit>().addRequestDay!.format()} ",
                  style: CustomTextStyles.bodyMediumBlack20001,
                ),
        );
      },
    ).animate().moveY();
  }
}
