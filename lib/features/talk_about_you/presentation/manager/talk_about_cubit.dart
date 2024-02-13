import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:naraakom/core/utils/app_strings.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/helper/save_data.dart';

part 'talk_about_state.dart';

class TalkAboutCubit extends Cubit<TalkAboutState> {
  TalkAboutCubit() : super(TalkAboutInitial());

  TalkAboutCubit get(context) => BlocProvider.of(context);
  var textController = TextEditingController();
  var key = GlobalKey<FormState>();
  String? twoDigitsMinutes;
  String? twoDigitsSeconds;
  bool isRecordReady = false;

  durationFunc(snapshot) {
    final duration = snapshot.hasData ? snapshot.data!.duration : Duration.zero;
    String twoDigits(int n) => n.toString().padLeft(0);
    twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
  }

  File? audioFile;
  final recorder = FlutterSoundRecorder();

  stop() async {
    try {
      var path = await recorder.stopRecorder();
      audioFile = File(path!);
      emit(StopSuccessState());
    } catch (e) {
      emit(StopErrState(e.toString()));
    }
  }

  getDownloadAudioURL() async {
    if (audioFile != null) {
      Reference refStorage = FirebaseStorage.instance
          .ref()
          .child(Uri.file(audioFile!.path).pathSegments.last);
      await refStorage.putFile(audioFile!);
      print("kkkkkkkkkkkkkkkkk4${Uri.file(audioFile!.path).pathSegments.last}");
      var url = await refStorage.getDownloadURL();
      print("hhhhhhhhhhhhhhhhhhh4$url");
      return url;
    } else {
      return '';
    }
  }

  record() async {
    try {
      await recorder.startRecorder(toFile: "audio");
      recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
      emit(RecordStartState());
    } catch (e) {
      emit(RecordStartErrState(e.toString()));
    }
  }

  initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'microphone permission not granted';
    }
    await recorder.openRecorder();
  }

  recording() async {
    if (recorder.isRecording) {
      await stop();
      emit(RecordChangeState());
    } else {
      await record();
      emit(RecordChangeState());
    }
  }

  recordSuccess() async {
    emit(RecordSuccessLoadingState());
    try {
      var url = await getDownloadAudioURL();
      print('llllllllllllllllllllllllllllll$url');
      await FirebaseFirestore.instance
          .collection(AppStrings.customRequestCollection)
          .add({
        "text": textController.text,
        "audioLink": url,
        "user": CacheHelper.getUser().toJson(),
        "time": DateTime.now(),
      });
      emit(RecordSuccessState("تم ارسال شرح الحالة بنجاح"));
    } catch (e) {
      emit(RecordSuccessErrState(e.toString()));
    }
  }
}
