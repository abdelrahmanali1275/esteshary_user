import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/data/doctor_model.dart';

import '../Timer.dart';
import '../../helper/error/failure.dart';
import '../../helper/save_data.dart';
import '../user_model.dart';

class FirebaseUser {
  Future<Either<ErrorFailure, UserModel>> getUserData(userId) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .get();

      // List<UserModel> users=[];
      //
      //
      // res.docs.forEach((element) {
      //   users.add(UserModel.fromJson(element.data()));
      // });

      if (res.data() == null) {
        return Left(ErrorFailure(message: "Yoifhuisf vxiohuifhu"));
      } else {
        return Right(UserModel.fromJson(res.data()!));
      }
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> setUserData(UserModel userModel,) async {
    try {
      final res = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userModel.userId)
          .set(userModel.toJson());
// add message
      return Right("nmmmmmm");
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, List<Timer>>> getDayTimer(DoctorModel doctorModel,
      DateTime addRequestDay, daysOfRequest) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection("Doctors")
          .doc("${doctorModel.doctorId}")
          .collection("Timer")
          .where("date", isEqualTo: addRequestDay.format())
          .get();
      res.docs.forEach((element) {
        element.data();
      });
      print(addRequestDay.format());
      return Right(
          res.docs.map<Timer>((e) => Timer.fromJson(e.data())).toList());
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> addRequest({
    required DateTime? day,
    required String from,
    required String to,
    required DoctorModel doctorModel,
    required daysOfRequest,
    required String num,
  }) async {
        var id =Random().nextInt(999999);
      await FirebaseFirestore.instance.collection("Requests").doc("$id").set({
        "user": CacheHelper.getUser().toJson(),
        "id": id,
        "from": from,
        "to": to,
        "num": num,
        "doctor": doctorModel.toJson(),
        "createAt": DateTime.now(),
        "state": "في انتظار الدفع",
        "day": daysOfRequest[day!.weekday - 1],
        "date": day.format(),
        "zoomLink": "",
        "notes": "",
      });
      await FirebaseFirestore.instance.collection("Doctors").doc(
          "${doctorModel.doctorId}").collection("Timer").doc('$num').update({
        "active":false,
      });
      return Right("تم حجز الميعاد بنجاح برجاء الدفع لتاكيد الحجز");
    }

}
