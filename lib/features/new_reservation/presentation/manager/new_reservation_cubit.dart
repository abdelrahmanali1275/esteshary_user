import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/data/doctor_model.dart';
import 'package:naraakom/core/helper/save_data.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import '../../../../core/data/firebase/user.dart';
import '../../../../core/data/Timer.dart';

part 'new_reservation_state.dart';

class NewReservationCubit extends Cubit<NewReservationState> {
  NewReservationCubit() : super(NewReservationInitial());

  NewReservationCubit get(context) => BlocProvider.of(context);

  DoctorModel? doctorModel;

  List daysOfRequest = [
    AppStrings.monDay,
    AppStrings.tuesDay,
    AppStrings.wednesDay,
    AppStrings.thursDay,
    AppStrings.friDay,
    AppStrings.saturDay,
    AppStrings.sunDay,
  ];

  FirebaseUser firebaseUser = FirebaseUser();

  var day2;
  DateTime? addRequestDay;

  addRequest(from, to, num) async {
    emit(AddRequestLoading());
    var res =
    await firebaseUser.addRequest(
        day: addRequestDay,
        daysOfRequest: daysOfRequest,
        doctorModel: doctorModel!,
        from: from,
        to: to, num: num);
    res.fold((l) => emit(AddRequestErr(message: l.message)), (r) {
      emit(AddRequestLoaded(message: r));
    });
  }

  dayName() {
    day2 = daysOfRequest[addRequestDay!.weekday - 1];
    emit(NewReservationLoading());
  }

  getDayTimer() async {
    emit(NewReservationLoading());
    var res = await firebaseUser.getDayTimer(
        doctorModel!, addRequestDay!, daysOfRequest);
    res.fold((l) => emit(GetTimeErr(message: l.message)),
        (r) => emit(GetTimeLoaded(timer: r)));
  }
}
// getDayTimer(day) async {
//   emit(NewReservationLoading());
//   try {
//     var res = await FirebaseFirestore.instance
//         .collection("Doctors")
//         .doc("${doctorModel!.doctorId}")
//         .collection("Timer")
//         .where("day", isEqualTo: day.toString())
//         .get();
//     res.docs.forEach((element) {
//       element.data();
//     });
//     emit(NewReservationLoaded(
//         timer:
//             res.docs.map<Timer>((e) => Timer.fromJson(e.data())).toList()));
//   } catch (e) {
//     emit(NewReservationErr(message: e.toString()));
//   }
// }
