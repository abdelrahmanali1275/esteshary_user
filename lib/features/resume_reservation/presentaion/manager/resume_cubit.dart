import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/data/firebase/firebase_requests.dart';
import '../../../../core/data/request_model.dart';

part 'resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit() : super(ResumeInitial());

  FireBaseRequests fireBaseRequests=FireBaseRequests();

  allRequests()async{
    emit(AcceptRequestsLoading());
    var res = await fireBaseRequests.acceptRequests();
    res.fold((l) => emit(AcceptRequestsErr(message: l.message)), (
        r) => emit(AcceptRequestsLoaded(data: r)));
  }
}
