import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/new_reservation/new_reservation_screen.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/utils/app_colors.dart';

class SpecializationWidget extends StatelessWidget {
  const SpecializationWidget({
    super.key, required this.name, required this.specialist, required this.url,
  });

  final String name;
  final String specialist;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cyan5002,
      child: InkWell(
        onTap: (){
          NewReservationScreen().launch(context);
        },
        child: ListTile(
          title: Text(name,style: CustomTextStyles.bodyLargeBlack900Bold20),
          leading: CircleAvatar(
           backgroundImage: NetworkImage(url),
          ),
        ),
      ),
    ).paddingSymmetric(horizontal: 20);
  }
}