import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:musicfindapp/models/song/result.dart';
import 'package:musicfindapp/utils/utils.dart';

class APIRepository {
  static final APIRepository _singleton = APIRepository._internal();

  factory APIRepository() {
    return _singleton;
  }

  APIRepository._internal();

  Future<dynamic> findSong(String path) async {
    File file = File(path);
    String fileString = await convertFile(file);

    var song = await searchSong(fileString);
    return song;
    // if (res['status'] == 'success') {
    //   if (res['result'] != null) {
    //     Result result = Result.fromMap(res['result']);
    //     return result;
    //   } else {
    //     return "No se encontró la canción";
    //   }
    // } else {
    //   return "No se pudo obtener la información";
    // }
  }
}

searchSong(dynamic path) async {
  var client = http.Client();
  try {
    // await dotenv.load(fileName: ".env");

    var response = await http.post(
      Uri.https('api.audd.io'),
      // headers: {'Content-Type': 'multipart/form-data'},
      body: {
        // 'api_token': dotenv.env['api_key'],
        'api_token': '1d23943f2c5b091f0dc7056b44fb0765',
        'return': 'apple_music,spotify',
        'audio': path,
        // 'method': 'recognize',
      },
    );

    if (response.statusCode == 200) {
      var body = await jsonDecode(response.body);
      // Result result = Result.fromMap(body['result']);
      // print(result);
      return body['result'];
    }
  } catch (e) {
    print('http error: $e');
  } finally {
    client.close();
  }
}
