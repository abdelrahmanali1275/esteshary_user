import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:naraakom/core/app_export.dart';
import '../manager/talk_about_cubit.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({
    super.key,
    required this.cubit,
  });

  final TalkAboutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TalkAboutCubit, TalkAboutState>(
      builder: (context, state) {
        return Column(
          children: [
            StreamBuilder<RecordingDisposition>(
              stream: cubit.recorder.onProgress,
              builder: (context, snapshot) {
                cubit.durationFunc(snapshot);
                return Column(
                  children: [
                    Text(
                      "${cubit.twoDigitsSeconds} : ${cubit.twoDigitsMinutes}",
                      style: CustomTextStyles.bodyLargeBlack900,
                    ),
                    10.height,
                    FilledButton(
                        onPressed: () {
                          cubit.initRecorder();
                          cubit.recording();
                        },
                        child: cubit.recorder.isRecording
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
