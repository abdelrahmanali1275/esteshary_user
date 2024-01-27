import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:naraakom/core/utils/extension/widget.dart';

import '../manager/talk_about_cubit.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({
    super.key,
    required this.cubit,
  });

  final TalkAboutCubit cubit;

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {

  @override
  void dispose() {
    widget.cubit.recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TalkAboutCubit, TalkAboutState>(
      builder: (context, state) {
        return Column(
          children: [
            StreamBuilder<RecordingDisposition>(
              stream: widget.cubit.recorder.onProgress,
              builder: (context, snapshot) {
                widget.cubit.durationFunc(snapshot);
                return Column(
                  children: [
                    Text(
                      "${widget.cubit.twoDigitsSeconds} : ${widget.cubit.twoDigitsMinutes}",
                      style: CustomTextStyles.bodyLargeBlack900,
                    ), 10.height,

                    FilledButton(
                        onPressed: ()  {
                          widget.cubit.recording();
                         setState(() {
                         });
                        },
                        child: widget.cubit.recorder.isRecording
                            ? Icon(Icons.stop)
                        //     .onTap((){
                        //       // Navigator.pop(context);
                        //       // showDialog(context: context, builder: (context) => AlertDialog(
                        //       //   backgroundColor: AppColors.whiteA700,
                        //       //   title: Column(
                        //       //     children: [
                        //       //       Text("هل تريد حفظ الملف الصوتي",style: CustomTextStyles.bodyLargeBlack900,),
                        //       //     ],
                        //       //   ),
                        //       // ));
                        // })
                            : Icon(Icons.mic)),
                  ],
                );
              },
            ),



          ],
        );
      },
    );
  }
}
