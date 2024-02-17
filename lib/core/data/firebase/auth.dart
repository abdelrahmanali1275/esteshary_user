import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naraakom/core/data/firebase/user.dart';

import '../../helper/error/failure.dart';

class AuthHelper {
  FirebaseUser firebaseUser = FirebaseUser();

  String id = '';
  Future<Either<ErrorFailure, String>> login(
      {required String email, required String pass}) async {
    try {
      var res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      id = res.user!.uid;
      return Right(res.user!.uid);
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }

  Future<Either<ErrorFailure, String>> register(
      email,
      password,
      ) async {
    try {
      var res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(res.user!.uid);
    } catch (e) {
      return Left(ErrorFailure(message: e.toString()));
    }
  }
}