import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/utils/app_strings.dart';

import '../new_reservation_model.dart';

part 'new_reservation_state.dart';

class NewReservationCubit extends Cubit<NewReservationState> {
  NewReservationCubit() : super(NewReservationInitial());

  NewReservationCubit get(context) => BlocProvider.of(context);

  List days = [
    AppStrings.saturDay,
    AppStrings.sunDay,
    AppStrings.monDay,
    AppStrings.tuesDay,
    AppStrings.wednesDay,
    AppStrings.thursDay,
    AppStrings.friDay,
  ];

  List<NewReservationTimeModel> time = [
    NewReservationTimeModel(
      time1: '6:00   :   6:30',
      time2: "6:30   :   7:00",
      time3: "7:00   :   7:30",
    ),
    NewReservationTimeModel(
      time1: '9:00   :  9:30',
      time2: "9:30   :   10:00",
      time3: "10:00   :   10:30",
    ),
    NewReservationTimeModel(
      time1: '4:00   :   4:30',
      time2: "4:30   :   5:00",
      time3: "7:00   :   7:30",
    ),
    NewReservationTimeModel(
      time1: '6:00   :   6:30',
      time2: "8:30   :   8:00",
      time3: "9:00   :   9:30",
    ),
    NewReservationTimeModel(
      time1: '6:00   :   6:30',
      time2: "6:30   :   7:00",
      time3: "7:00   :   7:30",
    ),
    NewReservationTimeModel(
      time1: '6:00   :   6:30',
      time2: "6:30   :   7:00",
      time3: "7:00   :   7:30",
    ),
    NewReservationTimeModel(
      time1: '6:00   :   6:30',
      time2: "6:30   :   7:00",
      time3: "7:00   :   7:30",
    ),
    NewReservationTimeModel(
      time1: '6:00   :   6:30',
      time2: "6:30   :   7:00",
      time3: "7:00   :   7:30",
    ),
  ];
}
