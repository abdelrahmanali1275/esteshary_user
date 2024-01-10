import 'package:flutter/material.dart';

void showCustomBottomSheet(
    {required BuildContext context, required Widget content,required Color color}) {
  showModalBottomSheet(
    backgroundColor: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) =>   content,

  );
}
