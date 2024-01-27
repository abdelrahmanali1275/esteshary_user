import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/data/doctor_model.dart';
import '../manager/home_cubit.dart';
import 'specialization_widget.dart';

class SpecializationList extends StatelessWidget {
  const SpecializationList({super.key, required this.data});

  final List<DoctorModel> data;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            SpecializationWidget(
              name: data[index].name,
              specialist: data[index].specialist,
              url: data[index].photo,
            ),
        itemCount:data.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
