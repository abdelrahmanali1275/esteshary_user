import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/save_data.dart';
import '../../../../core/utils/app_strings.dart';
import 'model/messag_model.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(AppStrings.support);

  void sendMessage({required String message, required String email}) {
    try {
      messages.add({
        AppStrings.messageCollection: message,
        AppStrings.createAt: DateTime.now(),
        AppStrings.id: email,
      });
    } catch (e) {}
  }

  void getMessage() {
    List<Message> messageList = [];
    messages
        .orderBy(AppStrings.createAt, descending: true)
        .snapshots()
        .listen((event) {
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
    });
    emit(ChatSuccess());
  }

  removeImage() {
    imageFile = null;
    emit(ChatSuccess());
  }

  removeFile() {
    file = null;
    emit(ChatSuccess());
  }

  File? imageFile;
  File? file;

  pickImageFile() async {
    file = null;
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      imageFile = File(result.files.single.path!);
      print("object");
      emit(ChatSuccess());
    } else {
      emit(ChatSuccess());
    }
  }

  pickFile() async {
    imageFile = null;
    FilePickerResult? result;
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
      emit(ChatSuccess());
    } else {
      print("object");
      emit(ChatSuccess());
    }
  }

  String? imageUrl;
  String? fileUrl;
  String? fileName;
  String? fileSize;

  Future addNewMessage(String text) async {
    if (imageFile != null) {
      emit(ChatImageLoading());
      // Upload the image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child(
          'images/${FirebaseAuth.instance.currentUser!.uid}/${DateTime.now().microsecondsSinceEpoch}.png');
      UploadTask uploadTask = storageReference.putFile(File(imageFile!.path));
      await uploadTask.whenComplete(() => print('Image uploaded'));
      imageUrl = await storageReference.getDownloadURL();
      print(imageUrl);
    }
    if (file != null) {
      emit(FileImageLoading());
      // Upload the image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child(
          'file/${FirebaseAuth.instance.currentUser!.uid}/${DateTime.now()}.pdf');
      UploadTask uploadTask = storageReference.putFile(File(file!.path));
      await uploadTask.whenComplete(() => print('Image uploaded'));
      fileUrl = await storageReference.getDownloadURL();
      fileName = file!.path.split('/').last;
      var Size = file!.lengthSync();
      fileSize = formatBytes(Size);
      print(fileUrl);
      print(fileName);
    }

    // Upload the image to Firebase Storage

    await FirebaseFirestore.instance
        .collection(AppStrings.collectionUsers)
        .doc(CacheHelper.getUser().userId)
        .collection(AppStrings.messageCollection)
        .add({
      AppStrings.messageCollection: text,
      AppStrings.createAt: FieldValue.serverTimestamp(),
      AppStrings.id: CacheHelper.getUser().userId,
      AppStrings.imageCollection: imageUrl,
      AppStrings.file: fileUrl,
      "file_name": fileName,
      "file_size": fileSize
    });

    // if(text.isNotEmpty){
    //   sendPushNotificationToAdmin(userModel.name, text,"chat");
    //
    // }else{
    //   if(file!=null){
    //     sendPushNotificationToAdmin(userModel.name, "ارسل ملف جديد","chat");
    //
    //   }
    //   if(imageFile!=null){
    //     sendPushNotificationToAdmin(userModel.name, "ارسل صوره جديدة","chat");
    //
    //   }
    // }

    imageFile = null;
    imageUrl = null;
    fileUrl = null;
    file = null;
    fileName = null;
    fileSize = null;
    emit(ChatImageSuccess());
  }

  String formatBytes(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1048576) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else {
      return '${(bytes / 1048576).toStringAsFixed(2)} MB';
    }
  }
}
