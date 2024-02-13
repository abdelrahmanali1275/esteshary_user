import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/config/theme/custom_text_style.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import '../../../../core/widgets/show_toast.dart';
import '../../../payment/presentaion/payment_screen.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.from,
    required this.to,
  });

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) =>
                BlocBuilder<NewReservationCubit, NewReservationState>(
                  builder: (context, state) {
                    return AlertDialog(
                      backgroundColor: AppColors.whiteA700,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "لتاكيد حجز المعاد",
                            style: CustomTextStyles.bodyLargeBlack900,
                          ),
                          Text("$from : $to",
                              style: CustomTextStyles.bodyMediumPrimary),
                        ],
                      ),
                      content: Text("اضغط على زر متابعة",
                          style: CustomTextStyles.bodyLargeBlack900),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              await context
                                  .read<NewReservationCubit>()
                                  .addRequest(from, to);
                              Navigator.pop(context);
                              PaymentScreen().launch(
                                context,
                              );
                            },
                            child: Text("متابعة",
                                style: CustomTextStyles.bodyMediumPrimary)),
                      ],
                    );
                  },
                ));
      },
      child: Text("$from : $to"),
    );
  }
}
