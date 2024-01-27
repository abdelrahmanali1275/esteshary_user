import 'package:flutter/material.dart';

showMessage(context, ms, backGround) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backGround,
      content: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              ms,
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      )));
}