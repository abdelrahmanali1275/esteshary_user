import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/utils/app_strings.dart';

class Message {
  final String message;
  final String id;
  final String? image;
  final String? file;
  final String? fileName;
  final String? fileSize;
  final Timestamp createAt;

  Message(this.message, this.id, this.createAt, this.image, this.file,
      this.fileName, this.fileSize);

  factory Message.fromJson(jsonData) {
    if (jsonData[AppStrings.createAt] == null) {
      return Message(
        jsonData[AppStrings.messageCollection],
        jsonData[AppStrings.id],
        Timestamp.now(),
        jsonData[AppStrings.imageCollection],
        jsonData[AppStrings.file],
        jsonData['file_name'],
        jsonData['file_size'],
      );
    }
    return Message(
      jsonData[AppStrings.messageCollection],
      jsonData[AppStrings.id],
      jsonData[AppStrings.createAt],
      jsonData[AppStrings.imageCollection],
      jsonData[AppStrings.file],
      jsonData['file_name'],
      jsonData['file_size'],
    );
  }
}
