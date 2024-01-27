import 'package:naraakom/core/helper/save_data.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/core/widgets/custom_app_bottom.dart';
import 'package:naraakom/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/app_export.dart';
import '../../../../core/utils/app_colors.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({
    super.key,
  });

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteA700,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primary,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(AppAssets.hagz),
            ),
          ).paddingOnly(top: 60),
          ListTile(
            trailing: Text(
              CacheHelper.getUser().name,
              style: CustomTextStyles.fontSize18,
            ),
            leading: Text(
              "الاسم",
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            trailing: Text(
              CacheHelper.getUser().requiredWhatsApp,
              style: CustomTextStyles.fontSize18,
            ),
            leading: Text(
              "رقم الواتساب",
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            trailing: Text(
              CacheHelper.getUser().email,
              style: CustomTextStyles.fontSize18,
            ),
            leading: Text(
              "البريد الالكتروني",
              style: CustomTextStyles.bodyLargeBlack900Bold20,
            ),
          ),
          10.height,
          CustomAppBottom(
            label: "تسجيل الخروج",
            onPressed: () {
              Login().launch(context, isNewTask: true);
              CacheHelper.removeData(key: "doctor");
            },
          ).paddingSymmetric(horizontal: 30).animate().flip()
        ],
      ),
    );
  }
}
