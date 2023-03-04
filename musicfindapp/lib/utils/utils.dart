import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> obtainTempPath() async {
  //Get the temporary directory
  Directory tempDir = await getTemporaryDirectory();
  return tempDir.path;
}

Future<String> convertFile(File file) async {
  List<int> fileBytes = await file.readAsBytes();
  String base64String = base64Encode(fileBytes);
  return base64String;
}
