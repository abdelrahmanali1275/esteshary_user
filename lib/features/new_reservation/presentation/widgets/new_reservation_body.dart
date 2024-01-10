import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import 'custom_time_button.dart';

class NewReservationBody extends StatelessWidget {
  const NewReservationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReservationCubit, NewReservationState>(
      builder: (context, state) {
        var cubit = NewReservationCubit().get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTimeButton(
                        text: '${cubit.days[index]}',
                        timeTextButton1: cubit.time[index].time1,
                        timeTextButton2: cubit.time[index].time2,
                        timeTextButton3: cubit.time[index].time3,
                      ),
                      15.height,
                    ],
                  ),
                  itemCount: cubit.days.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
