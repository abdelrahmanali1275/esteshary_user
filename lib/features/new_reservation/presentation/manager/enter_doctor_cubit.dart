import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naraakom/core/data/firebase/firebase_requests.dart';

import '../../../../core/data/doctor_model.dart';

part 'enter_doctor_state.dart';

class EnterDoctorCubit extends Cubit<EnterDoctorState> {
  EnterDoctorCubit() : super(EnterDoctorInitial());

  FireBaseRequests fireBaseRequests = FireBaseRequests();

  allDoctorSpecialist() async {
    emit(AllDoctorLoading());
    var res = await fireBaseRequests.getAllDoctor();
    res.fold((l) => emit(AllDoctorErr(l.message)), (r) {
      emit(AllDoctorSuccess(r));
    });
  }
}
