import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userInfoCollection =
      FirebaseFirestore.instance.collection('user_info');

  Future updateUserData(String name, String contact, String city) async {
    return await userInfoCollection.doc(uid).set({
      'name': name,
      'contact': contact,
      'city': city,
    });
  }

  Stream<QuerySnapshot> get info {
    return userInfoCollection.snapshots();
  }
}
