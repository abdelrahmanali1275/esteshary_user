import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/home/presentation/home.dart';

import '../../../../core/helper/functions/show_bottom_sheet.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isLogin = false;

  var key = GlobalKey<FormState>();

  login({required BuildContext context,required String email,required String password}) {
    var auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          value.user!.uid;
          print(value.user!.uid);
      HomeScreen().launch(context);
    }).catchError((e) {
      showCustomBottomSheet(
        context: context,
        content: Text("البيانات غير صحيحة يرجى اعادة المحاولة"),
        color: AppColors.redA400,
      );
    });
  }
}
