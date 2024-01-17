import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/data/firebase/auth.dart';

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

  register() async {
    print("object");
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
        RegisterErrState("برجاء ادخال بيانات صحيحة"),
      ),
      (r) async {
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
            gender: gender));
        set.fold((l) {
          RegisterErrState("هذا المستخدم موجود بالفعل");
        }, (r) {
          emit(
            RegisterSuccessState("تم التسجيل بنجاح"),
          );
        });
      },
    );
  }
}
