import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseApi {
      final FirebaseMessaging _firebaseMessaging =  FirebaseMessaging.instance;
  Future<void> initNoti() async {

    await _firebaseMessaging.requestPermission(sound: true,alert: true,badge: true);
    final fcm = await _firebaseMessaging.getToken();

    print('token... $fcm');
  }
}