import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';
import 'package:naraakom/core/data/firebase/user.dart';
import '../../../../core/data/doctor_model.dart';
import '../../../../core/helper/error/failure.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeCubit get(context) => BlocProvider.of(context);

  FireBaseRequests fireBaseRequests = FireBaseRequests();

  allDoctorSpecialist() async {
    emit(HomeSpecialistLoading());
    var res = await fireBaseRequests.getAllDoctor();
    res.fold((l) => emit(HomeSpecialistErr(l.message)), (r) {
      emit(HomeSpecialistSuccess(r));
    });
  }


}
