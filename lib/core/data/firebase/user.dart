import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:naraakom/core/data/doctor_model.dart';

import '../../helper/error/failure.dart';
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

  Future<Either<ErrorFailure, String>> setUserData(
    UserModel userModel,
  ) async {
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

  Future<Either<ErrorFailure, List<DoctorModel>>> getAllDoctor() async {
    try {
      var res = await FirebaseFirestore.instance.collection("Doctors").get();
      return Right(List<DoctorModel>.from(
          (res.docs as List).map((e) => DoctorModel.fromJson(e))));
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }
}
