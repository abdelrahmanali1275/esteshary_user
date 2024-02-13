import 'package:flutter/material.dart';
import 'package:naraakom/config/theme/custom_text_style.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/features/new_reservation/enter_doctor.dart';

import 'list_user_requests.dart';

class ResumeReservationBody extends StatelessWidget {
  const ResumeReservationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "حجز جديد",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            OutlinedButton(
              onPressed: () {
                EnterDoctor().launch(context);
              },
              child: Icon(Icons.plus_one),
            ),
          ],
        ),
        20.height,
        Text(
          "اخر الحجوزات",
          style: CustomTextStyles.bodyLargeBlack900Bold25,
        ),
        UserRequestsList(),
      ],
    );
  }
}
