import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/new_reservation/new_reservation_screen.dart';

import '../../../../config/theme/custom_text_style.dart';
import '../../../../core/utils/app_colors.dart';

class SpecializationWidget extends StatelessWidget {
  const SpecializationWidget({
    super.key, required this.title, required this.subtitle, required this.color,
  });

  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NewReservationScreen().launch(context);
      },
      child: ListTile(
        title: Text(title,style: CustomTextStyles.bodyLargeBlack900Bold20),
        subtitle: Text(
          subtitle,
          style: CustomTextStyles.bodyLargeBlack900Bold20,),
        leading: CircleAvatar(
          backgroundColor: color,
        ),
      ),
    );
  }
}