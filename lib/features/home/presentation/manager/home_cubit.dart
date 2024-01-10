import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/app_colors.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);
  List<Color> color = [
    AppColors.redA400,
    AppColors.primary,
    AppColors.deepOrangeA400,
    AppColors.blueGray400,
    AppColors.redA400,
    AppColors.primary,
    AppColors.redA400,
    AppColors.primary,
    AppColors.deepOrangeA400,
    AppColors.blueGray400,
    AppColors.redA400,
    AppColors.primary,
  ];
  List<String> specialization = [
    "نفسي",
    "باطنة",
    "اسنان",
    "مخ واعصاب",
    "تخاطب",
    "انف واذن",
    "عيون",
    "نفسي",
    "باطنة",
    "اسنان",
    "مخ واعصاب",
    "تخاطب",
    "انف واذن",
    "عيون",
  ];
  List<String> doctorName = [
    "دكتور احمد ",
    "دكتور محمد ",
    "دكتور عبدالرحمن ",
    "دكتور مسعود ",
    "دكتور عمر ",
    "دكتور سيد ",
    "دكتور احمد ",
    "دكتور محمد ",
    "دكتور عبدالرحمن ",
    "دكتور مسعود ",
    "دكتور عمر ",
    "دكتور سيد ",
  ];
}
