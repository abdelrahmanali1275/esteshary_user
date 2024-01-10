import 'package:flutter/material.dart';
import 'package:naraakom/config/theme/custom_text_style.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/features/new_reservation/enter_doctor.dart';

class ResumeReservationBody extends StatelessWidget {
  const ResumeReservationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
      child: Column(
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
              SizedBox(width: 5,),
              OutlinedButton(
                onPressed: (){
                EnterDoctor().launch(context);
              }, child: Icon(Icons.plus_one),
              ),

            ],
          ),
          20.height,

          Text("اخر الحجوزات",
            style: CustomTextStyles.bodyLargeBlack900Bold25,),
          Icon(Icons.not_listed_location_outlined,size: 150,color: AppColors.primary,),
          Text("لا يوجد لديك حجوزات سابقة",
            style: CustomTextStyles.bodyLargeBlack900Bold25,),
          10.height,
          Text("يمكنك طلب استشارة من احد اطبائنا المعتمدين للحصول على مساعدة",
            style: CustomTextStyles.bodyLargeGray700,
          textAlign: TextAlign.center),
          50.height,
          CustomAppBottom(label: "عمل حجز جديد",onPressed: (){
            EnterDoctor().launch(context);
          },)
        ],
      ),
    );
  }
}
