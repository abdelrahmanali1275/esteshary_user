import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/resume_reservation/presentaion/manager/resume_cubit.dart';
import '../../../../config/theme/custom_text_style.dart';
import 'all_request_card.dart';
import 'data_empty.dart';

class UserRequestsList extends StatelessWidget {
  const UserRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        if (state is AcceptRequestsLoaded) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return state.data.isNotEmpty
                    ? AcceptRequestsCard(
                        index: index,
                        data: state.data,
                      ).paddingSymmetric(horizontal: 10)
                    : DataEmpty();
              },
              itemCount: state.data.isEmpty ? 1 : state.data.length,
            ),
          );
        }
        if (state is AcceptRequestsErr) {
          return Container(
            child: Text(
              state.message,
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          );
        }
        context.read<ResumeCubit>().allRequests();
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
