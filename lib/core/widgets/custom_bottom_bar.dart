// import 'package:flutter/material.dart';
// import 'package:naraakom/core/app_export.dart';
//
// import '../utils/app_colors.dart';
//
// class CustomBottomBar extends StatefulWidget {
//   const CustomBottomBar({this.onChanged});
//
//  final Function(BottomBarEnum)? onChanged;
//
//   @override
//   CustomBottomBarState createState() => CustomBottomBarState();
// }
//
// class CustomBottomBarState extends State<CustomBottomBar> {
//   int selectedIndex = 0;
//
//   List<BottomMenuModel> bottomMenuList = [
//     BottomMenuModel(
//       icon: AppAssets.imgNavschedule,
//       activeIcon: AppAssets.imgNavschedule,
//       title: "Schedule",
//       type: BottomBarEnum.Schedule,
//     ),
//     BottomMenuModel(
//       icon: AppAssets.imgFrameTeal5004,
//       activeIcon: AppAssets.imgFrameTeal5004,
//       title: "Schedule",
//       type: BottomBarEnum.Schedule,
//     ),
//     BottomMenuModel(
//       icon: AppAssets.imgFrameTeal20004,
//       activeIcon: AppAssets.imgFrameTeal20004,
//       title: "Schedule",
//       type: BottomBarEnum.Schedule,
//     ),
//     BottomMenuModel(
//       icon: AppAssets.imgMenu,
//       activeIcon: AppAssets.imgMenu,
//       title: "Schedule",
//       type: BottomBarEnum.Schedule,
//     )
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80.h,
//       decoration: BoxDecoration(
//         color: AppColors.whiteA700,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20.h),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.black900.withOpacity(0.08),
//             spreadRadius: 2.h,
//             blurRadius: 2.h,
//             offset: Offset(
//               0,
//               -2,
//             ),
//           ),
//         ],
//       ),
//       child: BottomNavigationBar(
//         backgroundColor: Colors.transparent,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedFontSize: 0,
//         elevation: 0,
//         currentIndex: selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         items: List.generate(bottomMenuList.length, (index) {
//           return BottomNavigationBarItem(
//             icon: CustomImageView(
//               svgPath: bottomMenuList[index].icon,
//               height: 24.h,
//               width: 24.w,
//               color: AppColors.teal5004,
//             ),
//             activeIcon: Container(
//               padding: EdgeInsets.all(8.h),
//               decoration: AppDecoration.fillLightBlue.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder5,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CustomImageView(
//                     svgPath: bottomMenuList[index].activeIcon,
//                     height: 24.h,
//                     width: 24.w,
//                     color: theme.colorScheme.primary.withOpacity(1),
//                     margin: EdgeInsets.only(left: 8.h),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 6.h,
//                       right: 13.h,
//                     ),
//                     child: Text(
//                       bottomMenuList[index].title ?? "",
//                       style: theme.textTheme.titleSmall!.copyWith(
//                         color: theme.colorScheme.primary.withOpacity(1),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             label: '',
//           );
//         }),
//         onTap: (index) {
//           selectedIndex = index;
//           widget.onChanged?.call(bottomMenuList[index].type);
//           setState(() {});
//         },
//       ),
//     );
//   }
// }
//
// enum BottomBarEnum {
//   Schedule,
// }
//
// class BottomMenuModel {
//   BottomMenuModel({
//     required this.icon,
//     required this.activeIcon,
//     this.title,
//     required this.type,
//   });
//
//   String icon;
//
//   String activeIcon;
//
//   String? title;
//
//   BottomBarEnum type;
// }
//
// class DefaultWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(10),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Please replace the respective Widget here',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
