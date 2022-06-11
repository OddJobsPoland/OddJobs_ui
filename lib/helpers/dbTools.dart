import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_ui/pages/mainIntro.dart';

Future<bool> UserExists(String? userId) async {
  var collection = FirebaseFirestore.instance.collection('Users');
  var docSnapshot = await collection.doc(userId).get();

  return docSnapshot.exists;
}

bool UserExistsSync(String? userId) {
  bool _value;
  UserExists(userId).then((value) {
    _value = value;
    return _value;
  });

  return false;
}
