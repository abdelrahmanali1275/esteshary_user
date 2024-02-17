import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/data/firebase/auth.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/login/presentation/pages/login_screen.dart';

import '../../../../core/data/firebase/user.dart';
import '../../../../core/data/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController age = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController requiredWhatsApp = TextEditingController();
  TextEditingController optionalWhatsApp = TextEditingController();
  String gender = "";
  String userId = "";
  var key = GlobalKey<FormState>();
  AuthHelper firebaseAuthHelper = AuthHelper();
  FirebaseUser firebaseUser = FirebaseUser();
  bool lookPass = true;
  lookPassChange() {
    lookPass == true ? lookPass = false : lookPass = true;
    emit(LookPassChangeState());
  }

  register(context) async {
    // if (key.currentState!.validate()) {
    //   // message validate
    //   RegisterErrState("l.message");
    //
    //   return;
    // }
    emit(
      RegisterLoadingGetDataUserState(),
    );

    final res = await firebaseAuthHelper.register(
      email.text,
      pass.text,
    );

    res.fold(
      (l) => emit(
        RegisterErrState(l.message),
      ),
      (r) async {
        String fcnToken= await FirebaseMessaging.instance.getToken()??"";
        var set = await firebaseUser.setUserData(UserModel(
            userId: r,
            name: name.text,
            email: email.text,
            password: pass.text,
            age: age.text,
            education: education.text,
            job: job.text,
            requiredWhatsApp: requiredWhatsApp.text,
            optionalWhatsApp: optionalWhatsApp.text,
            gender: gender, fcn_token: fcnToken));

        set.fold((l) {
          RegisterErrState(l.message);
        }, (r) {
          age.clear();
          email.clear();
          pass.clear();
          education.clear();
          job.clear();
          requiredWhatsApp.clear();
          optionalWhatsApp.clear();
          name.clear();
          gender = '';
          Login().launch(context, isNewTask: true);
          emit(
            RegisterSuccessState("تم التسجيل بنجاح"),
          );
        });
      },
    );
  }
}
