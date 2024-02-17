import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/widgets/show_toast.dart';
import 'package:naraakom/core/data/Timer.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import 'custom_time_button.dart';

class NewReservationBody extends StatelessWidget {
  const NewReservationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewReservationCubit, NewReservationState>(
        builder: (context, state) {
      var cubit = NewReservationCubit().get(context);
      if (state is AddRequestLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Center(
        child: Column(
          children: [
            FilledButton(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2030))
                      .then((value) {
                    if(value !=null){
                      cubit.addRequestDay = value;
                      print(value.format());
                      cubit.dayName();
                    }
                  });
                },
                child: Text("اختر اليوم")),
            CustomTimeButton(),
          ],
        ),
      );
    }, listener: (BuildContext context, NewReservationState state) {
      if (state is AddRequestLoaded) {
        showToast(text: state.message, state: ToastStates.success);
      }
      if (state is AddRequestErr) {
        showToast(text: state.message, state: ToastStates.error);
      }
    });
  }
}

// Expanded(
// child: ListView.builder(
// itemBuilder: (context, index) => Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CustomTimeButton(
// text: '${cubit.days[index]}',
// index: index,
// ),
// 15.height,
// ],
// ),
// itemCount: cubit.days.length,
// ),
// ),
