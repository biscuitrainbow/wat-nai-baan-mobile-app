import 'package:zefyr/zefyr.dart';

String getFirstImage(NotusDocument document) {
  final operations = document.toDelta().toList();

  final imageOperation = operations.firstWhere(
    (operation) {
      if (operation.attributes == null) {
        return false;
      }

      return operation?.attributes['embed'] != null && operation?.attributes['embed']['type'] == 'image';
    },
    orElse: () => null,
  );

  if (imageOperation == null) {
    return null;
  }

  final url = imageOperation?.attributes['embed']['source'];
  return url;
}
