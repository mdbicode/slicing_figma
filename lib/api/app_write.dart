import 'package:appwrite/appwrite.dart';
import 'dart:developer';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init(){
  _client
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('668ec62b001ef27a6d2b')
    .setSelfSigned(status: true);
    getMusic();
  }
  
static Future<Map<String, dynamic>?> getMusic() async {
    try {
      final response = await _database.getDocument(
        databaseId: "668ec643001b3ca18f82",
        collectionId: "668ecb340001e821ce35",
        documentId: "66901b3700150ba7ba12",
      );
      log(response.data.toString());
      return response.data;
    } catch (e) {
      log('$e');
      return null;
    }
  }

}
