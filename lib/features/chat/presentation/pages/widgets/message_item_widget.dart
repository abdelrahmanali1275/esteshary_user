import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:naraakom/core/helper/save_data.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/show_image.dart';
import 'package:naraakom/features/chat/presentation/pages/widgets/show_message.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../manager/model/messag_model.dart';

class MessageItemWidget extends StatefulWidget {
  const MessageItemWidget(
      {Key? key, required this.message, required this.index})
      : super(key: key);
  final Message message;
  final int index;

  @override
  State<MessageItemWidget> createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    var time = DateFormat.jm().format(widget.message.createAt.toDate());
    var s = time.split(' ');

    var s1 = s[0];
    var s2 = s[1];

    return Align(
      alignment: widget.message.id != CacheHelper.getUser().userId
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: widget.message.file != null
                    ? MediaQuery.of(context).size.width * .6
                    : MediaQuery.of(context).size.width * .75),
            margin: const EdgeInsets.only(
              right: 10,
              top: 10,
              left: 10,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.message.id == CacheHelper.getUser().userId
                  ? AppColors.primary.withOpacity(0.6)
                  : Colors.amberAccent.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.message.image != null)
                  InkWell(
                    onTap: () {
                      ShowImage(url: widget.message.image!).launch(context);
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.message.image!,
                      height: 300,
                      width: MediaQuery.of(context).size.width / 1.5,
                      fit: BoxFit.fill,
                    ),
                  ),
                if (widget.message.file != null)
                  ListTile(
                    onTap: () {
                      downloadFile(widget.message.file);
                    },
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 0,
                    leading: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.black900,
                      ),
                      child: Text(
                        widget.message.fileName!.split('.').isEmpty
                            ? "غير معروف"
                            : widget.message.fileName!.split('.').last,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                    title: Text(
                      widget.message.fileName!,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                    subtitle: Text(widget.message.fileSize ?? ""),
                  ),
                // InkWell(
                //   onTap: () {
                //     downloadFile(widget.message.file);
                //   },
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.all(5),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(3),
                //           color: AppColor.grey.withOpacity(0.5),
                //         ),
                //         child: Column(
                //           children: [
                //
                //             Text(widget.message.fileName!.length > 9
                //                 ? widget.message.fileName!.substring(0, 9)
                //                 : widget.message.fileName!),
                //             Row(
                //               mainAxisAlignment:
                //                   MainAxisAlignment.spaceAround,
                //               mainAxisSize: MainAxisSize.min,
                //               children: [
                //                 Container(
                //                   padding: const EdgeInsets.all(5),
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(3),
                //                     color: AppColor.blueGrey,
                //                   ),
                //                   child: Text(
                //                     widget.message.fileName!
                //                         .split('.')
                //                         .isEmpty
                //                         ? "غير معروف"
                //                         : widget.message.fileName!
                //                         .split('.')
                //                         .last,
                //                     style: const TextStyle(
                //                         color: Colors.white, fontSize: 16),
                //                   ),
                //                 ),
                //
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                if (widget.message.message.isNotEmpty)
                  Text(
                    widget.message.message,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$s2 ",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      s1,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  downloadFile(url) async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      Directory? d = await getDownloadsDirectory();
      if (!d!.existsSync()) {
        d.createSync(recursive: true);
      }
      showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        useSafeArea: false,
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(
              "جاري فتح الملف......",
              textAlign: TextAlign.center,
            ),
            elevation: 10,
          );
        },
      );
      await Dio()
          .download(
        url,
        "${d.path}/${widget.message.fileName}_${widget.message.createAt.microsecondsSinceEpoch}.${widget.message.fileName!.split('.').last}",
      )
          .then((value) async {
        Navigator.pop(context);
        //showMessage(context, "تم التنزيل بنجاح", Colors.green);
        await OpenFile.open(
          "${d.path}/${widget.message.fileName}_${widget.message.createAt.microsecondsSinceEpoch}.${widget.message.fileName!.split('.').last}",
        ).then((value) {
          print("value.message-------${value.message}");
        }).catchError((e) {
          print(e.toString());
          showMessage(context, "جدث خطاا حاول مره اخري", Colors.red);
        });
      }).catchError((e) {
        Navigator.pop(context);
        showMessage(context, "جدث خطاا حاول مره اخري", Colors.red);
      });
    } else {
      showMessage(context, "ليس لدي الاذن لتحميل الملف", Colors.red);
    }
  }
}
