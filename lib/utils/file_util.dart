import 'dart:async';
import 'dart:io';

import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

Future<File> resizeImage(File file, [int width = 480]) async {
  final image = decodeImage(file.readAsBytesSync());
  final uuid = new Uuid();

  final resizedImage = copyResize(image, width);
  final tempDir = await getTemporaryDirectory();

  final resizedFile = File('${tempDir.path}/${uuid.v1()}.jpg')..writeAsBytesSync(encodeJpg(resizedImage));

  return resizedFile;
}
