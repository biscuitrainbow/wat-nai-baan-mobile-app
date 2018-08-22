import 'dart:async';

import 'package:buddish_project/utils/file_util.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:zefyr/zefyr.dart';

class FirebaseImageDelegate implements ZefyrImageDelegate<ImageSource> {
  @override
  ImageProvider createImageProvider(String imageSource) {
//    final file = new File.fromUri(Uri.parse(imageSource));
//    return new FileImage(file);
    return NetworkImage(imageSource);
  }

  @override
  Future<String> pickImage(ImageSource source) async {
    final file = await ImagePicker.pickImage(source: source);

    if (file == null) return null;

    try {
      final resizedFile = await resizeImage(file);
      final uuid = Uuid();
      final ref = FirebaseStorage.instance.ref().child('images').child('${uuid.v1()}.jpg');
      final task = ref.putFile(resizedFile);

      final downloadUri = (await task.future).downloadUrl;

      return downloadUri.toString();
    } catch (e) {
      print(e);
    }
  }
}
