import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/features/register/presentation/manager/register_cubit.dart';
import 'package:naraakom/features/register/presentation/widgets/register_screen_body.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: RegisterScreenBody(),
        ),
      ),
    );
  }
}


