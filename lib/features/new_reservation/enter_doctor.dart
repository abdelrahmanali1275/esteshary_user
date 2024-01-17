import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:naraakom/core/widgets/custom_app_bar.dart';
import 'package:naraakom/features/home/presentation/manager/home_cubit.dart';

import '../../core/utils/app_colors.dart';
import '../home/presentation/widgets/specialization_list.dart';

class EnterDoctor extends StatefulWidget {
  const EnterDoctor({super.key});

  @override
  State<EnterDoctor> createState() => _EnterDoctorState();
}

class _EnterDoctorState extends State<EnterDoctor> {
  List<QueryDocumentSnapshot> data = [];
  void initState() {
    getData();
    super.initState();
  }
   getData() async {
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('Doctors').get();
    setState(() {
      data.addAll(querySnapshot.docs);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: AppStrings.specialestAvailable,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: Column(
          children: [
            Text(
              AppStrings.specialestAvailable,
              style: TextStyle(
                  color: AppColors.blueGray700,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            30.height,
            SpecializationList(data: data,),
          ],
        ),
      ),
    );
  }
}
