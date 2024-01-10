import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/home_cubit.dart';
import 'specialization_widget.dart';

class SpecializationList extends StatelessWidget {
  const SpecializationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit().get(context);
          return ListView.builder(
            itemBuilder: (context, index) => SpecializationWidget(
              title: cubit.doctorName[index],
              subtitle: cubit.specialization[index],
              color: cubit.color[index],
            ),
            itemCount: cubit.doctorName.length,
            scrollDirection: Axis.vertical,
          );
        },
      ),
    );
  }
}
