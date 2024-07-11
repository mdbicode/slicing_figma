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
  
static Future<String> getMusic() async {
  try{
    final d = await _database.getDocument(
      databaseId: "668ec643001b3ca18f82", 
      collectionId: "668ecb340001e821ce35", 
      documentId: "66901b3700150ba7ba12");
  log(d.data.toString());
  return d.data['name'];

  }catch (e){
    log('$e');
    return '';
  }
}

}
