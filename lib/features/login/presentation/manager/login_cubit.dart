import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/data/firebase/auth.dart';
import 'package:naraakom/core/data/firebase/user.dart';
import 'package:naraakom/core/helper/save_data.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/home/presentation/home.dart';

import '../../../../core/data/user_model.dart';

part 'login_state.dart';

// get Doctor List

// get User

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isLogin = false;
  bool lookPass= true;
  var key = GlobalKey<FormState>();

  AuthHelper authHelper = AuthHelper();
  FirebaseUser firebaseUser = FirebaseUser();

  lookPassChange(){
    lookPass==true? lookPass = false:lookPass=true;
    emit(LookPassChangeState());
  }

  login(context) async {
    emit(LoginLoadingGetDataUserState());
    var resLogin = await authHelper.login(email: email.text, pass: pass.text);
    resLogin.fold((l) {
      emit(LoginErrState("لم يتم العثور على بيانات يرجى ادخال بيانات صحيحة"));
    }, (r) async {
      // var resUser = await firebaseUser.getUserData(r);
      //   emit(LoginSuccessState(r));
      // resUser.fold((l) {
      //   emit(LoginErrState(l.message));
      // }, (r) {
      //   CacheHelper.saveData(key: "user", value: json.encode(r.toJson()));
        HomeScreen().launch(context,isNewTask: true);
        emit(LoginSuccessState("تم تسجيل الدخول بنجاح"));
      // });
    });
  }
}
