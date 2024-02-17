import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/data/doctor_model.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import 'package:naraakom/features/resume_reservation/presentaion/widgets/data_empty.dart';
import '../../../../core/widgets/data_empty.dart';
import '../manager/home_cubit.dart';
import 'specialization_widget.dart';

class SpecializationList extends StatelessWidget {
  const SpecializationList({super.key, required this.data});

  final List<DoctorModel> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewReservationCubit, NewReservationState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return data.isEmpty? DataEmpty2(txt: 'عفوا لا يوجد اي دكتور',):SpecializationWidget(
                name: data[index].name,
                specialist: data[index].specialist,
                url: data[index].photo,
                data: data[index],
              );
            },
            itemCount: data.isEmpty?1:data.length,
            scrollDirection: Axis.vertical,
          );
        },
      ),
    );
  }
}
