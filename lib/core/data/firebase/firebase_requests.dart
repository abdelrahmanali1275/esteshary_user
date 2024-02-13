import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:naraakom/core/helper/save_data.dart';
import 'package:naraakom/core/utils/app_strings.dart';

import '../../helper/error/failure.dart';
import '../doctor_model.dart';
import '../request_model.dart';

class FireBaseRequests {
  Future<Either<ErrorFailure, List<RequestModel>>> acceptRequests() async {
    try {
      String userId = CacheHelper
          .getUser()
          .userId;
      var res = await FirebaseFirestore.instance
          .collection('Requests')
          .where("state", isEqualTo: "تم التاكيد في انتظار الكشف")
          .where("user.userId", isEqualTo: userId)
          .get();

      return Right(res.docs
          .map<RequestModel>((e) => RequestModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<DoctorModel>>> getAllDoctor() async {
    try {
      var res = await FirebaseFirestore.instance.collection("Doctors").get();
      return Right(res.docs
          .map<DoctorModel>((e) => DoctorModel.fromJson(e.data()))
          .toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }
}
